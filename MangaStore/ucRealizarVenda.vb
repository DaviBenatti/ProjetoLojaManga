Imports MySql.Data.MySqlClient
Imports System.Data

Public Class ucRealizarVenda

    ' 1. String de conexão (use a sua com a porta e senha corretas)
    Private strConexao As String = "server=localhost;database=db_manga_store;uid=root;password=usbw;port=3307"

    ' 2. DataTables para os ComboBoxes
    Private dtTitulos As New DataTable()
    Private dtVolumes As New DataTable()

    ' 3. Evento Load: Carrega os Títulos únicos
    Private Sub ucRealizarVenda_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        CarregarTitulosUnicos()

        ' Desativa o ComboBox de Volume até um título ser selecionado
        cmbVolume.Enabled = False
        cmbProduto.SelectedIndex = -1 ' (Supondo que seu ComboBox de mangá se chama cmbProduto)

        ' 1. Formata a coluna "Preço Unit." como Moeda (R$)
        '    (Use o (Name) que você deu na configuração: colPreco)
        dgvCarrinho.Columns("colPreco").DefaultCellStyle.Format = "C2"

        ' 2. (Recomendado) Faça o mesmo para a coluna "Subtotal"
        '    (Use o (Name) que você deu: colSubtotal)
        dgvCarrinho.Columns("colSubtotal").DefaultCellStyle.Format = "C2"
    End Sub

    ' 4. Carrega Títulos ÚNICOS (sem repetição)
    Private Sub CarregarTitulosUnicos()
        Try
            ' O "DISTINCT" é a mágica aqui
            Dim sql As String = "SELECT DISTINCT titulo FROM mangas WHERE quantidade_estoque > 0 ORDER BY titulo"
            Dim adapter As New MySqlDataAdapter(sql, strConexao)

            dtTitulos.Clear()
            adapter.Fill(dtTitulos)

            cmbProduto.DataSource = dtTitulos
            cmbProduto.DisplayMember = "titulo"
            cmbProduto.ValueMember = "titulo"

        Catch ex As Exception
            MessageBox.Show("Erro ao carregar produtos: " & ex.Message, "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    ' 5. Evento "em Cascata": Ocorre quando você escolhe um Título
    Private Sub cmbProduto_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbProduto.SelectedIndexChanged
        If cmbProduto.SelectedIndex = -1 Then
            cmbVolume.Enabled = False
            cmbVolume.DataSource = Nothing
            Return
        End If

        ' Pega o título que foi selecionado
        Dim tituloSelecionado As String = cmbProduto.SelectedValue.ToString()

        ' Chama o método para carregar os volumes daquele título
        CarregarVolumes(tituloSelecionado)
    End Sub

    ' 6. Carrega os VOLUMES para o Título selecionado
    Private Sub CarregarVolumes(titulo As String)
        Try
            ' Busca TODOS os dados, filtrando pelo TÍTULO
            Dim sql As String = "SELECT manga_id, volume, preco, quantidade_estoque " &
                                "FROM mangas " &
                                "WHERE titulo = @titulo AND quantidade_estoque > 0 " &
                                "ORDER BY volume"

            Dim comando As New MySqlCommand(sql, New MySqlConnection(strConexao))
            comando.Parameters.AddWithValue("@titulo", titulo)

            Dim adapter As New MySqlDataAdapter(comando)

            dtVolumes.Clear()
            adapter.Fill(dtVolumes)

            ' Configura o ComboBox de Volumes
            cmbVolume.DataSource = dtVolumes
            cmbVolume.DisplayMember = "volume"      ' O usuário vê o número do volume
            cmbVolume.ValueMember = "manga_id"    ' O valor por trás é o ID REAL

            cmbVolume.Enabled = True ' ATIVA o ComboBox de Volume
            cmbVolume.SelectedIndex = -1 ' Força o usuário a escolher um

        Catch ex As Exception
            MessageBox.Show("Erro ao carregar volumes: " & ex.Message, "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    ' 7. Botão "Adicionar ao Carrinho"
    Private Sub btnAdicionar_Click(sender As Object, e As EventArgs) Handles btnAdicionar.Click
        ' Validação
        If cmbProduto.SelectedIndex = -1 OrElse cmbVolume.SelectedIndex = -1 Then
            MessageBox.Show("Por favor, selecione um Título e um Volume.", "Atenção", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            Return
        End If

        ' Pega a linha (DataRow) do VOLUME selecionado (é onde estão os dados)
        Dim drVolume As DataRow = CType(cmbVolume.SelectedItem, DataRowView).Row

        ' Pega os valores
        Dim id As Integer = CInt(drVolume("manga_id"))
        Dim preco As Decimal = CDec(drVolume("preco"))
        Dim estoqueAtual As Integer = CInt(drVolume("quantidade_estoque"))
        Dim qtd As Integer = CInt(nudQuantidade.Value)

        Dim titulo As String = cmbProduto.Text
        Dim volume As String = drVolume("volume").ToString()
        Dim tituloCompleto As String = $"{titulo} Vol. {volume}"

        ' Validação de estoque
        If qtd > estoqueAtual Then
            MessageBox.Show($"Estoque insuficiente. Você só pode vender {estoqueAtual} unidades deste item.", "Estoque Insuficiente", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            Return
        End If

        Dim subtotal As Decimal = preco * qtd

        ' Adiciona ao DataGridView
        ' (Isso depende de como você nomeou suas colunas - veja Ponto Crítico abaixo)
        dgvCarrinho.Rows.Add(id, tituloCompleto, qtd, preco, subtotal)

        CalcularTotal()
        LimparCamposVenda()
    End Sub

    ' 8. Método para limpar os campos de seleção
    Private Sub LimparCamposVenda()
        cmbProduto.SelectedIndex = -1
        cmbVolume.DataSource = Nothing
        cmbVolume.Enabled = False
        nudQuantidade.Value = 1
        cmbProduto.Focus()
    End Sub

    ' 9. Calcula o Total do Carrinho
    Private Sub CalcularTotal()
        Dim totalVenda As Decimal = 0
        For Each linha As DataGridViewRow In dgvCarrinho.Rows
            If linha.Cells("colSubtotal").Value IsNot Nothing Then ' (Use o (Name) da sua coluna)
                totalVenda += CDec(linha.Cells("colSubtotal").Value)
            End If
        Next
        lblTotal.Text = String.Format("Total: R$ {0:N2}", totalVenda)
    End Sub

    ' 10. O "GRAND FINALE": Finalizar a Venda (COM TRANSAÇÃO)
    Private Sub btnFinalizarVenda_Click(sender As Object, e As EventArgs) Handles btnFinalizarVenda.Click
        ' Validação: O carrinho está vazio?
        If dgvCarrinho.Rows.Count = 0 Then
            MessageBox.Show("O carrinho está vazio. Adicione produtos antes de finalizar.", "Carrinho Vazio", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            Return
        End If

        ' Confirmação
        Dim resultado As DialogResult = MessageBox.Show($"Deseja realmente finalizar esta venda? ({lblTotal.Text})",
                                                       "Confirmar Venda",
                                                       MessageBoxButtons.YesNo,
                                                       MessageBoxIcon.Question)
        If resultado = DialogResult.No Then
            Return
        End If

        ' --- INÍCIO DA TRANSAÇÃO ---
        Dim conexao As New MySqlConnection(strConexao)
        Dim transacao As MySqlTransaction = Nothing

        Try
            conexao.Open()
            transacao = conexao.BeginTransaction()

            Dim comando As New MySqlCommand()
            comando.Connection = conexao
            comando.Transaction = transacao ' Associa o comando à transação!

            ' ETAPA A: INSERIR NA TABELA 'vendas' (O registro mestre da venda)
            comando.CommandText = "INSERT INTO vendas (valor_total) VALUES (@valorTotal);"
            comando.Parameters.AddWithValue("@valorTotal", CDec(lblTotal.Text.Replace("Total: R$ ", "")))
            comando.ExecuteNonQuery()

            ' ETAPA B: PEGAR O ID DA VENDA QUE ACABAMOS DE CRIAR
            comando.CommandText = "SELECT LAST_INSERT_ID();"
            Dim novaVendaId As Long = Convert.ToInt64(comando.ExecuteScalar())

            ' ETAPA C: FAZER O LOOP NO CARRINHO
            For Each linha As DataGridViewRow In dgvCarrinho.Rows
                If linha.IsNewRow Then Continue For

                ' Pega os valores de cada item no carrinho
                Dim mangaId As Integer = CInt(linha.Cells("colMangaID").Value) ' (Use o (Name) da sua coluna)
                Dim quantidade As Integer = CInt(linha.Cells("colQtd").Value) ' (Use o (Name) da sua coluna)
                Dim precoUnit As Decimal = CDec(linha.Cells("colPreco").Value) ' (Use o (Name) da sua coluna)

                comando.Parameters.Clear()

                ' ETAPA C.1: INSERIR NA TABELA 'venda_itens'
                comando.CommandText = "INSERT INTO venda_itens (venda_id_fk, manga_id_fk, quantidade_vendida, preco_unitario) " &
                                      "VALUES (@vendaId, @mangaId, @qtd, @preco);"
                comando.Parameters.AddWithValue("@vendaId", novaVendaId)
                comando.Parameters.AddWithValue("@mangaId", mangaId)
                comando.Parameters.AddWithValue("@qtd", quantidade)
                comando.Parameters.AddWithValue("@preco", precoUnit)
                comando.ExecuteNonQuery()

                comando.Parameters.Clear()

                ' ETAPA C.2: ABATER O ESTOQUE NA TABELA 'mangas'
                comando.CommandText = "UPDATE mangas SET quantidade_estoque = quantidade_estoque - @qtdVendida " &
                                      "WHERE manga_id = @mangaId;"
                comando.Parameters.AddWithValue("@qtdVendida", quantidade)
                comando.Parameters.AddWithValue("@mangaId", mangaId)
                comando.ExecuteNonQuery()
            Next

            ' ETAPA D: SUCESSO! COMMIT (Confirma) a transação
            transacao.Commit()

            MessageBox.Show("Venda finalizada com sucesso!", "Sucesso", MessageBoxButtons.OK, MessageBoxIcon.Information)

            ' Limpa tudo para a próxima venda
            dgvCarrinho.Rows.Clear()
            CalcularTotal()
            CarregarTitulosUnicos() ' Recarrega os produtos (com o novo estoque)
            LimparCamposVenda()

        Catch ex As Exception
            ' ETAPA E: FALHA! ROLLBACK (Desfaz) a transação
            Try
                If transacao IsNot Nothing Then
                    transacao.Rollback()
                End If
            Catch exRollback As Exception
                MessageBox.Show("Erro CRÍTICO. Falha no Rollback: " & exRollback.Message)
            End Try

            MessageBox.Show("Erro ao finalizar a venda. A transação foi desfeita." & vbCrLf & vbCrLf &
                            "Erro: " & ex.Message,
                            "Falha na Transação",
                            MessageBoxButtons.OK,
                            MessageBoxIcon.Error)

        Finally
            ' ETAPA F: Fecha a conexão (acontece sempre)
            If conexao.State = ConnectionState.Open Then
                conexao.Close()
            End If
        End Try
        ' --- FIM DA TRANSAÇÃO ---
    End Sub

    Private Sub dgvCarrinho_CellContentClick(sender As Object, e As DataGridViewCellEventArgs) Handles dgvCarrinho.CellContentClick
        ' 1. Verifica se o clique foi em uma linha válida (não no cabeçalho)
        ' 2. E se foi EXATAMENTE na nossa coluna de botão "colRemover"
        If e.RowIndex >= 0 AndAlso dgvCarrinho.Columns(e.ColumnIndex).Name = "colRemover" Then

            ' 3. Remove a linha específica que foi clicada
            '    (Não precisa de confirmação, pois é só o carrinho, não o banco)
            dgvCarrinho.Rows.RemoveAt(e.RowIndex)

            ' 4. ATUALIZA O TOTAL!
            '    (Isto é muito importante)
            CalcularTotal()
        End If
    End Sub
End Class