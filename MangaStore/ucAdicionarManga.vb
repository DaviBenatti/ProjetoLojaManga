Imports MySql.Data.MySqlClient
Imports System.Data

Public Class ucAdicionarManga

    Private strConexao As String = "server=localhost;database=db_manga_store;uid=root;password=usbw;port=3307"

    ' ESTA LINHA É NOVA: 0 = Novo Mangá, >0 = ID do Mangá em Edição
    Private idMangaAtual As Integer = 0

    Private Sub ucAdicionarManga_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        CarregarFornecedores()
    End Sub

    Private Sub CarregarFornecedores()
        Try
            Using conexao As New MySqlConnection(strConexao)
                conexao.Open()
                Dim sql As String = "SELECT fornecedor_id, nome FROM fornecedores ORDER BY nome"
                Dim adapter As New MySqlDataAdapter(sql, conexao)
                Dim dtFornecedores As New DataTable()
                adapter.Fill(dtFornecedores)

                ' Configura o ComboBox
                cmbFornecedor.DataSource = dtFornecedores
                cmbFornecedor.DisplayMember = "nome" ' O que o usuário vê
                cmbFornecedor.ValueMember = "fornecedor_id" ' O valor real por trás (ID)
                cmbFornecedor.SelectedIndex = -1 ' Nada selecionado inicialmente
            End Using
        Catch ex As Exception
            MessageBox.Show("Erro ao carregar fornecedores: " & ex.Message, "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click
        ' Validação (mesma de antes)
        If String.IsNullOrWhiteSpace(txtTitulo.Text) OrElse
           String.IsNullOrWhiteSpace(txtPreco.Text) OrElse
           String.IsNullOrWhiteSpace(nudQtdeEstoque.Value) OrElse
           String.IsNullOrWhiteSpace(nudEstoqueMinimo.Value) OrElse
           cmbFornecedor.SelectedValue Is Nothing Then
            MessageBox.Show("Por favor, preencha todos os campos obrigatórios (Título, Preço, Quantidade e Fornecedor).", "Campos Obrigatórios", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            Return
        End If

        ' ... (seu código de TryParse) ...
        Dim preco As Decimal
        If Not Decimal.TryParse(txtPreco.Text, preco) Then
            MessageBox.Show("O preço de venda deve ser um número válido.", "Erro de Validação", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Return
        End If
        Dim quantidade As Integer
        If Not Integer.TryParse(nudQtdeEstoque.Value, quantidade) Then
            MessageBox.Show("A quantidade deve ser um número inteiro válido.", "Erro de Validação", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Return
        End If
        Dim quantidadeMinima As Integer
        If Not Integer.TryParse(nudEstoqueMinimo.Value, quantidadeMinima) Then
            MessageBox.Show("A quantidade deve ser um número inteiro válido.", "Erro de Validação", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Return
        End If
        Dim volume As Integer = 0 ' Volume é opcional, então default 0
        If Not String.IsNullOrWhiteSpace(nudVolume.Value) Then
            If Not Integer.TryParse(nudVolume.Value, volume) Then
                MessageBox.Show("O volume deve ser um número inteiro válido.", "Erro de Validação", MessageBoxButtons.OK, MessageBoxIcon.Error)
                Return
            End If
        End If

        Dim fornecedorId As Integer = CType(cmbFornecedor.SelectedValue, Integer)

        Try
            Using conexao As New MySqlConnection(strConexao)
                conexao.Open()
                Dim comando As MySqlCommand

                ' AQUI ESTÁ A LÓGICA
                If idMangaAtual = 0 Then
                    ' MODO 1: INSERT (Código que você já tinha)
                    Dim sql As String = "INSERT INTO mangas (titulo, volume, autor, preco, quantidade_estoque, estoque_minimo, fornecedor_id_fk) " &
                                    "VALUES (@titulo, @volume, @autor, @preco, @quantidade, @quantidadeMinima, @fornecedorId)"
                    comando = New MySqlCommand(sql, conexao)

                    MessageBox.Show("Mangá salvo com sucesso!", "Sucesso", MessageBoxButtons.OK, MessageBoxIcon.Information)
                Else
                    ' MODO 2: UPDATE (Novo código)
                    Dim sql As String = "UPDATE mangas SET " &
                                    "titulo = @titulo, " &
                                    "volume = @volume, " &
                                    "autor = @autor, " &
                                    "preco = @preco, " &
                                    "quantidade_estoque = @quantidade, " &
                                    "estoque_minimo = @quantidadeMinima, " &
                                    "fornecedor_id_fk = @fornecedorId " &
                                    "WHERE manga_id = @idMangaAtual" ' Onde o ID for o que estamos editando

                    comando = New MySqlCommand(sql, conexao)
                    comando.Parameters.AddWithValue("@idMangaAtual", Me.idMangaAtual) ' O ID para o WHERE

                    MessageBox.Show("Mangá atualizado com sucesso!", "Sucesso", MessageBoxButtons.OK, MessageBoxIcon.Information)
                End If

                ' Parâmetros (são os mesmos para INSERT e UPDATE)
                comando.Parameters.AddWithValue("@titulo", txtTitulo.Text)
                comando.Parameters.AddWithValue("@autor", txtAutor.Text)
                comando.Parameters.AddWithValue("@volume", volume)
                comando.Parameters.AddWithValue("@preco", preco)
                comando.Parameters.AddWithValue("@quantidade", quantidade)
                comando.Parameters.AddWithValue("@quantidadeMinima", quantidadeMinima)
                comando.Parameters.AddWithValue("@fornecedorId", fornecedorId)

                comando.ExecuteNonQuery()
                LimparCampos()

                ' Se estava editando, reseta o ID e o botão
                If idMangaAtual > 0 Then
                    idMangaAtual = 0
                    btnSalvar.Text = "Salvar"
                End If
            End Using
        Catch ex As Exception
            MessageBox.Show("Erro ao salvar/atualizar mangá: " & ex.Message, "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub LimparCampos()
        txtTitulo.Clear()
        nudVolume.Value = 0
        txtAutor.Clear()
        txtPreco.Clear()
        nudQtdeEstoque.Value = 0
        nudEstoqueMinimo.Value = 0
        cmbFornecedor.SelectedIndex = -1 ' Desseleciona o fornecedor
        txtTitulo.Focus() ' Coloca o foco no primeiro campo
    End Sub

    ' Este é o método que o FormPrincipal chama
    Public Sub CarregarMangaParaEdicao(mangaId As Integer)
        ' 1. Armazena o ID
        Me.idMangaAtual = mangaId

        ' 2. Muda o texto do botão
        btnSalvar.Text = "Atualizar"

        ' 3. Busca os dados do mangá específico no banco
        Try
            Using conexao As New MySqlConnection(strConexao)
                conexao.Open()
                ' Traz tudo daquele mangá
                Dim sql As String = "SELECT * FROM mangas WHERE manga_id = @id"
                Dim comando As New MySqlCommand(sql, conexao)
                comando.Parameters.AddWithValue("@id", mangaId)

                ' Usa um MySqlDataReader para ler os dados
                Using reader As MySqlDataReader = comando.ExecuteReader()
                    If reader.Read() Then ' Se encontrou o mangá
                        ' 4. Preenche os campos da tela
                        txtTitulo.Text = reader("titulo").ToString()
                        nudVolume.Value = reader("volume").ToString()
                        txtAutor.Text = reader("autor").ToString()
                        txtPreco.Text = reader("preco").ToString()
                        nudQtdeEstoque.Value = reader("quantidade_estoque").ToString()
                        nudEstoqueMinimo.Value = reader("estoque_minimo").ToString()

                        ' Define o valor no ComboBox
                        ' O cmbFornecedor já foi carregado no evento Load
                        cmbFornecedor.SelectedValue = reader("fornecedor_id_fk")
                    End If
                End Using
            End Using
        Catch ex As Exception
            MessageBox.Show("Erro ao carregar dados do mangá: " & ex.Message, "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub
End Class
