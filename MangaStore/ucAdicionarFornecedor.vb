Imports MySql.Data.MySqlClient
Imports System.Data

Public Class ucAdicionarFornecedor

    ' 1. Defina sua string de conexão
    Private strConexao As String = "server=localhost;database=db_manga_store;uid=root;password=usbw;port=3307"

    ' VARIÁVEL NOVA: Guarda o ID do fornecedor que estamos editando.
    ' 0 = Novo Fornecedor
    Private idFornecedorAtual As Integer = 0

    ' MÉTODO NOVO: Chamado pelo FormAddManga
    Public Sub CarregarFornecedorParaEdicao(fornecedorId As Integer)
        ' Se o ID for 0, ele está vindo do botão "Novo" (não faz nada)
        If fornecedorId = 0 Then
            Return
        End If

        ' Se o ID for > 0, estamos EDITANDO
        Me.idFornecedorAtual = fornecedorId
        btnSalvar.Text = "Atualizar Fornecedor"

        Try
            Using conexao As New MySqlConnection(strConexao)
                conexao.Open()
                ' Busca os dados daquele ID
                Dim sql As String = "SELECT nome, telefone, email FROM fornecedores WHERE fornecedor_id = @id"
                Dim comando As New MySqlCommand(sql, conexao)
                comando.Parameters.AddWithValue("@id", fornecedorId)

                Using reader As MySqlDataReader = comando.ExecuteReader()
                    If reader.Read() Then
                        ' Preenche os campos da tela
                        txtNome.Text = reader("nome").ToString()
                        mtbTelefone.Text = reader("telefone").ToString()
                        txtEmail.Text = reader("email").ToString()
                    End If
                End Using
            End Using
        Catch ex As Exception
            MessageBox.Show("Erro ao carregar dados do fornecedor: " & ex.Message, "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    ' SUBSTITUA seu btnSalvar_Click por este
    Private Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click
        ' Validação (a mesma que você já tinha)
        If String.IsNullOrWhiteSpace(txtNome.Text) Then
            MessageBox.Show("O campo 'Nome' é obrigatório.", "Campo Obrigatório", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            txtNome.Focus()
            Return
        End If

        Try
            Using conexao As New MySqlConnection(strConexao)
                conexao.Open()
                Dim comando As New MySqlCommand()
                comando.Connection = conexao

                ' AQUI ESTÁ A LÓGICA
                If idFornecedorAtual = 0 Then
                    ' MODO INSERT (o que você já tinha)
                    comando.CommandText = "INSERT INTO fornecedores (nome, telefone, email) VALUES (@nome, @telefone, @email)"
                    MessageBox.Show("Fornecedor salvo com sucesso!", "Sucesso", MessageBoxButtons.OK, MessageBoxIcon.Information)
                Else
                    ' MODO UPDATE
                    comando.CommandText = "UPDATE fornecedores SET nome = @nome, telefone = @telefone, email = @email " &
                                      "WHERE fornecedor_id = @id"
                    comando.Parameters.AddWithValue("@id", Me.idFornecedorAtual)
                    MessageBox.Show("Fornecedor atualizado com sucesso!", "Sucesso", MessageBoxButtons.OK, MessageBoxIcon.Information)
                End If

                ' Parâmetros (são os mesmos para INSERT e UPDATE)
                comando.Parameters.AddWithValue("@nome", txtNome.Text)
                comando.Parameters.AddWithValue("@telefone", mtbTelefone.Text)
                comando.Parameters.AddWithValue("@email", txtEmail.Text)

                comando.ExecuteNonQuery()
                LimparCampos()
            End Using
        Catch ex As Exception
            MessageBox.Show("Erro ao salvar/atualizar fornecedor: " & ex.Message, "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub
    Private Sub LimparCampos()
        txtNome.Clear()
        mtbTelefone.Clear()
        txtEmail.Clear()
        txtNome.Focus()

        ' RESETAR O MODO
        idFornecedorAtual = 0
        btnSalvar.Text = "Salvar Fornecedor"
    End Sub

End Class
