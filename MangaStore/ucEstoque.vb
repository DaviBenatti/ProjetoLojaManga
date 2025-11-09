Imports MySql.Data.MySqlClient
Imports System.Data ' Importante para o DataTable

Public Class ucEstoque

    ' 1. Declare seu DataTable aqui, para que todos os métodos o vejam
    Private dtEstoque As DataTable

    ' 2. Evento Load: Ocorre quando a tela é carregada
    Private Sub ucEstoque_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' Chama o método que busca os dados
        CarregarDados()
        ' Verifica se a coluna já não existe
        If Not dgvProdutos.Columns.Contains("colExcluir") Then
            Dim colExcluir As New DataGridViewButtonColumn()
            colExcluir.Name = "colExcluir"
            colExcluir.HeaderText = "Ação" ' Título da coluna
            colExcluir.Text = "Excluir"      ' Texto dentro de cada botão
            colExcluir.UseColumnTextForButtonValue = True ' Força o texto "Excluir" em todos

            dgvProdutos.Columns.Add(colExcluir)
        End If

        ' 1. Formata a coluna "Preço Unit." como Moeda (R$)
        '    (Use o (Name) que você deu na configuração: colPreco)
        dgvProdutos.Columns("preco").DefaultCellStyle.Format = "C2"

    End Sub

    ' 3. Método para buscar os dados (do banco ou de teste)
    ' Este é o método que você vai substituir
    Private Sub CarregarDados()
        ' 1. String de Conexão ATUALIZADA
        Dim strConexao As String = "server=localhost;database=db_manga_store;uid=root;password=usbw;port=3307"

        ' 2. Comando SQL ATUALIZADO (use os nomes de colunas que criamos)
        Dim sql As String = "SELECT manga_id, titulo, volume, autor, quantidade_estoque, estoque_minimo, preco FROM mangas"

        Try
            Dim adapter As New MySqlDataAdapter(sql, strConexao)
            dtEstoque = New DataTable()
            adapter.Fill(dtEstoque)
            dgvProdutos.DataSource = dtEstoque

            FormatarGrid()
        Catch ex As Exception
            MessageBox.Show("Erro ao carregar dados do banco: " & ex.Message, "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    ' 5. Evento do Filtro: Ocorre a cada letra digitada
    Private Sub txtPesquisa_TextChanged(sender As Object, e As EventArgs) Handles txtPesquisa.TextChanged
        ' 1. Segurança: Verifica se o DataTable (dtEstoque) já foi carregado
        If dtEstoque Is Nothing Then Return

        ' 2. Pega o texto da barra e "limpa" ele para evitar erros de SQL
        Dim termo As String = txtPesquisa.Text.Replace("'", "''")

        ' 3. Se a barra estiver vazia, limpa o filtro e mostra tudo
        If String.IsNullOrEmpty(termo) Then
            dtEstoque.DefaultView.RowFilter = ""
            Return
        End If

        ' 4. AQUI ESTÁ A MÁGICA:
        '    Vamos construir a query do filtro
        '    (Use os nomes EXATOS das colunas do seu SELECT)
        Try
            Dim filtro As String = String.Format(
                "([titulo] LIKE '%{0}%' OR " &
            " [autor] LIKE '%{0}%' OR " &
            " CONVERT([volume], 'System.String') LIKE '%{0}%')",
            termo
            )

            ' 5. Aplica o filtro no seu DataTable
            dtEstoque.DefaultView.RowFilter = filtro

        Catch ex As Exception
            ' Se o usuário digitar algo que quebre o filtro (ex: '[')
            ' Apenas limpamos o filtro para não travar o app
            dtEstoque.DefaultView.RowFilter = ""
        End Try
    End Sub

    Private Sub dgvProdutos_CellDoubleClick(sender As Object, e As DataGridViewCellEventArgs) Handles dgvProdutos.CellDoubleClick
        ' Verifica se o clique foi em uma linha válida (não no cabeçalho)
        If e.RowIndex < 0 Then Return

        ' 1. Pega o ID da linha clicada
        '    Usamos o nome da coluna do banco de dados: "manga_id"
        Dim mangaId As Integer = Convert.ToInt32(dgvProdutos.Rows(e.RowIndex).Cells("manga_id").Value)

        ' 2. Chama o método público do formulário principal para trocar a tela
        '    Isso "avisa" o FormAddManga para abrir a tela de edição
        If TypeOf Me.ParentForm Is FormEstoque Then
            CType(Me.ParentForm, FormEstoque).AbrirTelaDeEdicao(mangaId)
        End If
    End Sub

    Private Sub FormatarGrid()
        Try
            ' Esconde a coluna de ID
            dgvProdutos.Columns("manga_id").Visible = False

            ' Renomeia as colunas do banco (HeaderText é o que o usuário vê)
            dgvProdutos.Columns("titulo").HeaderText = "Título do Mangá"
            dgvProdutos.Columns("volume").HeaderText = "Volume"
            dgvProdutos.Columns("autor").HeaderText = "Autor"
            dgvProdutos.Columns("quantidade_estoque").HeaderText = "Qtd. Atual"
            dgvProdutos.Columns("estoque_minimo").HeaderText = "Qtd. Mínima"
            dgvProdutos.Columns("preco").HeaderText = "Preço Unit."

            ' Ajusta o tamanho
            dgvProdutos.Columns("titulo").AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill
            dgvProdutos.Columns("volume").AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill
            dgvProdutos.Columns("autor").AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill
            dgvProdutos.Columns("quantidade_estoque").AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill
            dgvProdutos.Columns("estoque_minimo").AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill
            dgvProdutos.Columns("preco").AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill

        Catch ex As Exception
            ' Ignora erros se a coluna não existir (só para segurança)
        End Try
    End Sub
End Class
