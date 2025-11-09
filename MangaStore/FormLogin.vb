Public Class FormLogin
    Private Sub btnEntrar_Click(sender As Object, e As EventArgs) Handles btnEntrar.Click
        If txtUsuario.Text = "admin" AndAlso txtSenha.Text = "1234" Then
            MessageBox.Show("Login bem-sucedido!", "Sucesso", MessageBoxButtons.OK, MessageBoxIcon.Information)
            ' Aqui você pode adicionar o código para abrir o formulário principal
            Me.Hide()
            Dim formInicial As New FormEstoque()
            formInicial.Show()
        Else
            MessageBox.Show("Usuário ou senha incorretos.", "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End If
    End Sub

    Private Sub cbMostrarSenha_CheckedChanged(sender As Object, e As EventArgs) Handles cbMostrarSenha.CheckedChanged
        txtSenha.UseSystemPasswordChar = Not cbMostrarSenha.Checked
    End Sub
End Class
