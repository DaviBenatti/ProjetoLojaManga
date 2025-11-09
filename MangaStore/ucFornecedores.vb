Imports MySql.Data.MySqlClient
Imports System.Data ' Importante para o DataTable

Public Class ucFornecedores

    ' 1. Declare seu DataTable aqui, para que todos os métodos o vejam
    Private dtFornecedores As DataTable

    ' 2. Evento Load: Ocorre quando a tela é carregada
    Private Sub ucFornecedores_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' Chama o método que busca os dados
        CarregarDados()
        ' Verifica se a coluna já não existe
        If Not dgvFornecedores.Columns.Contains("colExcluir") Then
            Dim colExcluir As New DataGridViewButtonColumn()
            colExcluir.Name = "colExcluir"
            colExcluir.HeaderText = "Ação" ' Título da coluna
            colExcluir.Text = "Excluir"      ' Texto dentro de cada botão
            colExcluir.UseColumnTextForButtonValue = True ' Força o texto "Excluir" em todos

            dgvFornecedores.Columns.Add(colExcluir)
        End If
    End Sub

    ' 3. Método para buscar os dados (do banco ou de teste)
    ' Este é o método que você vai substituir
    Private Sub CarregarDados()
        ' 1. String de Conexão ATUALIZADA
        Dim strConexao As String = "server=localhost;database=db_manga_store;uid=root;password=usbw;port=3307"

        ' 2. Comando SQL ATUALIZADO (use os nomes de colunas que criamos)
        Dim sql As String = "SELECT fornecedor_id, nome, telefone, email FROM fornecedores"

        Try
            Dim adapter As New MySqlDataAdapter(sql, strConexao)
            dtFornecedores = New DataTable()
            adapter.Fill(dtFornecedores)
            dgvFornecedores.DataSource = dtFornecedores

            FormatarGrid()
        Catch ex As Exception
            MessageBox.Show("Erro ao carregar dados do banco: " & ex.Message, "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    ' 5. Evento do Filtro: Ocorre a cada letra digitada
    Private Sub txtPesquisa_TextChanged(sender As Object, e As EventArgs) Handles txtPesquisa.TextChanged
        ' 1. Segurança: Verifica se o DataTable (dtEstoque) já foi carregado
        If dtFornecedores Is Nothing Then Return

        ' 2. Pega o texto da barra e "limpa" ele para evitar erros de SQL
        Dim termo As String = txtPesquisa.Text.Replace("'", "''")

        ' 3. Se a barra estiver vazia, limpa o filtro e mostra tudo
        If String.IsNullOrEmpty(termo) Then
            dtFornecedores.DefaultView.RowFilter = ""
            Return
        End If

        ' 4. AQUI ESTÁ A MÁGICA:
        '    Vamos construir a query do filtro
        '    (Use os nomes EXATOS das colunas do seu SELECT)
        Try
            Dim filtro As String = String.Format(
                "([nome] LIKE '%{0}%' OR " &
                " CONVERT([telefone], 'System.String') LIKE '%{0}%' OR " &
                " [email] LIKE '%{0}%')",
                termo
            )

            ' 5. Aplica o filtro no seu DataTable
            dtFornecedores.DefaultView.RowFilter = filtro

        Catch ex As Exception
            ' Se o usuário digitar algo que quebre o filtro (ex: '[')
            ' Apenas limpamos o filtro para não travar o app
            dtFornecedores.DefaultView.RowFilter = ""
        End Try
    End Sub

    Private Sub dgvFornecedores_CellDoubleClick(sender As Object, e As DataGridViewCellEventArgs) Handles dgvFornecedores.CellDoubleClick
        ' 1. Ignora o clique no cabeçalho
        If e.RowIndex < 0 Then Return

        ' 2. Pega o ID da linha clicada
        '    (Confirme se o nome da sua coluna de ID é "fornecedor_id")
        Dim id As Integer = CInt(dgvFornecedores.Rows(e.RowIndex).Cells("fornecedor_id").Value)

        ' 3. Avisa o Form principal para abrir a tela de edição
        '    (Igual ao que fizemos no ucEstoque)
        If TypeOf Me.ParentForm Is FormEstoque Then
            CType(Me.ParentForm, FormEstoque).AbrirEdicaoFornecedor(id)
        End If
    End Sub
    Private Sub FormatarGrid()
        Try
            ' Esconde a coluna de ID
            dgvFornecedores.Columns("fornecedor_id").Visible = False

            ' Renomeia as colunas do banco (HeaderText é o que o usuário vê)
            dgvFornecedores.Columns("nome").HeaderText = "Fornecedor"
            dgvFornecedores.Columns("telefone").HeaderText = "Telefone"
            dgvFornecedores.Columns("email").HeaderText = "Email"

            ' Ajusta o tamanho
            dgvFornecedores.Columns("nome").AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill
            dgvFornecedores.Columns("telefone").AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill
            dgvFornecedores.Columns("email").AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill

        Catch ex As Exception
            ' Ignora erros se a coluna não existir (só para segurança)
        End Try
    End Sub
End Class
