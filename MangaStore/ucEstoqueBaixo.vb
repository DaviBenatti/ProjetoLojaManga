Imports MySql.Data.MySqlClient
Imports System.Data

Public Class ucEstoqueBaixo

    ' 1. String de conexão
    Private strConexao As String = "server=localhost;database=db_manga_store;uid=root;password=usbw;port=3307"

    ' 2. DataTable *local* para esta tela
    Private dtEstoqueBaixo As DataTable

    ' 3. Evento Load: Carrega os dados quando a tela é aberta
    Private Sub ucEstoqueBaixo_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        CarregarDadosBaixos()
    End Sub

    ' 4. O método principal que busca os dados
    Private Sub CarregarDadosBaixos()
        Try
            ' --- ESTE É O NOVO SQL (com JOIN) ---
            Dim sql As String = "SELECT " &
                                "    m.manga_id, " &
                                "    m.titulo, " &
                                "    m.volume, " &
                                "    m.quantidade_estoque, " &
                                "    m.estoque_minimo, " &
                                "    f.nome AS fornecedor_nome, " &
                                "    f.telefone AS fornecedor_telefone, " &
                                "    f.email AS fornecedor_email " &
                                "FROM mangas AS m " &
                                "JOIN fornecedores AS f ON m.fornecedor_id_fk = f.fornecedor_id " &
                                "WHERE m.quantidade_estoque <= m.estoque_minimo " &
                                "ORDER BY m.titulo"

            Dim adapter As New MySqlDataAdapter(sql, strConexao)
            dtEstoqueBaixo = New DataTable()
            adapter.Fill(dtEstoqueBaixo)

            ' Define o DataSource ANTES de adicionar colunas manuais
            dgvEstoqueBaixo.DataSource = dtEstoqueBaixo

            ' Chamadas para os novos métodos (Passo 2)
            AdicionarColunasManuais()
            FormatarGrid() ' Para o Item 3 (Nomear Colunas)

        Catch ex As Exception
            MessageBox.Show("Erro ao carregar estoque baixo: " & ex.Message, "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    ' MÉTODO NOVO (Adicionar Colunas Manuais)
    Private Sub AdicionarColunasManuais()
        ' Adiciona a coluna "Qtd Comprar" (onde o usuário digita)
        If Not dgvEstoqueBaixo.Columns.Contains("colQtdComprar") Then
            Dim colQtd As New DataGridViewTextBoxColumn()
            colQtd.Name = "colQtdComprar"
            colQtd.HeaderText = "Qtd. Comprar"
            dgvEstoqueBaixo.Columns.Add(colQtd)
        End If

        ' Adiciona a coluna "Repor Estoque" (o botão)
        If Not dgvEstoqueBaixo.Columns.Contains("colRepor") Then
            Dim colBotao As New DataGridViewButtonColumn()
            colBotao.Name = "colRepor"
            colBotao.HeaderText = "Ação"
            colBotao.Text = "Repor"
            colBotao.UseColumnTextForButtonValue = True
            dgvEstoqueBaixo.Columns.Add(colBotao)
        End If
    End Sub

    ' MÉTODO NOVO (Nomear Colunas - Item 3)
    Private Sub FormatarGrid()
        Try
            ' Esconde a coluna de ID
            dgvEstoqueBaixo.Columns("manga_id").Visible = False

            ' Renomeia as colunas do banco (HeaderText é o que o usuário vê)
            dgvEstoqueBaixo.Columns("titulo").HeaderText = "Título do Mangá"
            dgvEstoqueBaixo.Columns("volume").HeaderText = "Volume"
            dgvEstoqueBaixo.Columns("quantidade_estoque").HeaderText = "Qtd. Atual"
            dgvEstoqueBaixo.Columns("estoque_minimo").HeaderText = "Qtd. Mínima"
            dgvEstoqueBaixo.Columns("fornecedor_nome").HeaderText = "Fornecedor"
            dgvEstoqueBaixo.Columns("fornecedor_telefone").HeaderText = "Telefone"
            dgvEstoqueBaixo.Columns("fornecedor_email").HeaderText = "Email"

            ' Ajusta o tamanho
            dgvEstoqueBaixo.Columns("volume").AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill
            dgvEstoqueBaixo.Columns("quantidade_estoque").AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill
            dgvEstoqueBaixo.Columns("estoque_minimo").AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill
            dgvEstoqueBaixo.Columns("colQtdComprar").AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill

        Catch ex As Exception
            ' Ignora erros se a coluna não existir (só para segurança)
        End Try
    End Sub

    ' 5. Filtro de pesquisa (idêntico ao da outra tela, mas usa dtEstoqueBaixo)
    Private Sub txtPesquisa_TextChanged(sender As Object, e As EventArgs) Handles txtPesquisa.TextChanged
        ' 1. Segurança: Verifica se o DataTable (dtEstoque) já foi carregado
        If dtEstoqueBaixo Is Nothing Then Return

        ' 2. Pega o texto da barra e "limpa" ele para evitar erros de SQL
        Dim termo As String = txtPesquisa.Text.Replace("'", "''")

        ' 3. Se a barra estiver vazia, limpa o filtro e mostra tudo
        If String.IsNullOrEmpty(termo) Then
            dtEstoqueBaixo.DefaultView.RowFilter = ""
            Return
        End If

        ' 4. AQUI ESTÁ A MÁGICA:
        '    Vamos construir a query do filtro
        '    (Use os nomes EXATOS das colunas do seu SELECT)
        Try
            Dim filtro As String = String.Format(
                "([titulo] LIKE '%{0}%' OR " &
                " CONVERT([volume], 'System.String') LIKE '%{0}%' OR " &
                " [fornecedor_nome] LIKE '%{0}%')",
                termo
            )

            ' 5. Aplica o filtro no seu DataTable
            dtEstoqueBaixo.DefaultView.RowFilter = filtro

        Catch ex As Exception
            ' Se o usuário digitar algo que quebre o filtro (ex: '[')
            ' Apenas limpamos o filtro para não travar o app
            dtEstoqueBaixo.DefaultView.RowFilter = ""
        End Try
    End Sub

    Private Sub dgvEstoqueBaixo_CellContentClick(sender As Object, e As DataGridViewCellEventArgs) Handles dgvEstoqueBaixo.CellContentClick
        ' 1. Verifica se o clique foi na coluna do botão "colRepor"
        If e.RowIndex >= 0 AndAlso dgvEstoqueBaixo.Columns(e.ColumnIndex).Name = "colRepor" Then

            ' 2. Pega o ID do mangá (da coluna escondida)
            Dim mangaId As Integer = CInt(dgvEstoqueBaixo.Rows(e.RowIndex).Cells("manga_id").Value)
            Dim titulo As String = dgvEstoqueBaixo.Rows(e.RowIndex).Cells("titulo").Value.ToString()

            ' 3. Pega a quantidade da coluna "Qtd. Comprar" E VALIDA
            Dim cellValue As Object = dgvEstoqueBaixo.Rows(e.RowIndex).Cells("colQtdComprar").Value
            Dim qtdRepor As Integer = 0

            ' Validação: O campo está vazio ou não é um número?
            If cellValue Is Nothing OrElse Not Integer.TryParse(cellValue.ToString(), qtdRepor) Then
                MessageBox.Show("Por favor, digite uma quantidade numérica válida na coluna 'Qtd. Comprar'.", "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error)
                Return
            End If

            ' Validação: A quantidade é zero ou negativa?
            If qtdRepor <= 0 Then
                MessageBox.Show("A quantidade para repor deve ser maior que zero.", "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error)
                Return
            End If

            ' 4. Confirmação
            Dim resultado As DialogResult = MessageBox.Show($"Deseja adicionar {qtdRepor} unidade(s) ao estoque de '{titulo}'?",
                                                           "Confirmar Reposição",
                                                           MessageBoxButtons.YesNo,
                                                           MessageBoxIcon.Question)
            If resultado = DialogResult.No Then
                Return
            End If

            ' 5. Executa o UPDATE
            Try
                Using conexao As New MySqlConnection(strConexao)
                    conexao.Open()

                    ' O SQL MÁGICO: Ele SOMA a quantidade ao estoque atual
                    Dim sql As String = "UPDATE mangas SET quantidade_estoque = quantidade_estoque + @qtdRepor " &
                                        "WHERE manga_id = @id"

                    Dim comando As New MySqlCommand(sql, conexao)
                    comando.Parameters.AddWithValue("@qtdRepor", qtdRepor)
                    comando.Parameters.AddWithValue("@id", mangaId)

                    comando.ExecuteNonQuery()
                    MessageBox.Show("Estoque atualizado com sucesso!", "Sucesso", MessageBoxButtons.OK, MessageBoxIcon.Information)

                    ' 6. ATUALIZA A LISTA!
                    ' O item provavelmente vai desaparecer, pois agora o estoque está acima do mínimo.
                    CarregarDadosBaixos()
                End Using
            Catch ex As Exception
                MessageBox.Show("Erro ao atualizar o estoque: " & ex.Message, "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error)
            End Try

        End If
    End Sub
End Class