Imports MySql.Data.MySqlClient

Public Class FormEstoque
    Private Sub btnEstoque_Click(sender As Object, e As EventArgs) Handles btnEstoque.Click
        ' 1. Limpa qualquer tela que estava antes no painel
        pnlMain.Controls.Clear()

        ' 2. Cria a nova tela de estoque
        Dim telaEstoque As New ucEstoque()

        ' 3. Faz a tela preencher todo o painel
        telaEstoque.Dock = DockStyle.Fill

        ' 4. Adiciona a tela de estoque ao painel principal
        pnlMain.Controls.Add(telaEstoque)
    End Sub
    Private Sub btnEstoqueBaixo_Click(sender As Object, e As EventArgs) Handles btnEstoqueBaixo.Click
        ' 1. Limpa o painel
        pnlMain.Controls.Clear()

        ' 2. Cria a nova tela de relatório
        Dim telaBaixo As New ucEstoqueBaixo()

        ' 3. Define o Dock e adiciona ao painel
        telaBaixo.Dock = DockStyle.Fill
        pnlMain.Controls.Add(telaBaixo)
    End Sub
    Private Sub btnFornecedores_Click(sender As Object, e As EventArgs) Handles btnFornecedores.Click
        ' 1. Limpa o painel
        pnlMain.Controls.Clear()

        ' 2. Cria a nova tela de relatório
        Dim telaFornecedores As New ucFornecedores()

        ' 3. Define o Dock e adiciona ao painel
        telaFornecedores.Dock = DockStyle.Fill
        pnlMain.Controls.Add(telaFornecedores)
    End Sub
    Private Sub btnAddForn_Click(sender As Object, e As EventArgs) Handles btnAddForn.Click
        ' 1. Limpa o painel
        pnlMain.Controls.Clear()

        ' 2. Cria a nova tela
        Dim telaFornecedor As New ucAdicionarFornecedor()

        ' 3. Define o Dock e adiciona ao painel
        telaFornecedor.Dock = DockStyle.Fill
        pnlMain.Controls.Add(telaFornecedor)
    End Sub

    Private Sub btnAddManga_Click(sender As Object, e As EventArgs) Handles btnAddManga.Click
        ' 1. Limpa qualquer tela que estava antes no painel
        pnlMain.Controls.Clear()

        ' 2. Cria a nova tela de estoque
        Dim telaAdicionarManga As New ucAdicionarManga()

        ' 3. Faz a tela preencher todo o painel
        telaAdicionarManga.Dock = DockStyle.Fill

        ' 4. Adiciona a tela de estoque ao painel principal
        pnlMain.Controls.Add(telaAdicionarManga)
    End Sub

    Private Sub btnVenda_Click(sender As Object, e As EventArgs) Handles btnVenda.Click
        pnlMain.Controls.Clear()
        Dim telaVenda As New ucRealizarVenda()
        telaVenda.Dock = DockStyle.Fill
        pnlMain.Controls.Add(telaVenda)
    End Sub

    Private Sub btnHistorico_Click(sender As Object, e As EventArgs) Handles btnHistorico.Click
        pnlMain.Controls.Clear()
        Dim telaHistorico As New ucHistoricoVendas()
        telaHistorico.Dock = DockStyle.Fill
        pnlMain.Controls.Add(telaHistorico)
    End Sub

    Private Sub FormEstoque_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' 1. Limpa qualquer tela que estava antes no painel
        pnlMain.Controls.Clear()

        ' 2. Cria a nova tela de estoque
        Dim telaEstoque As New ucEstoque()

        ' 3. Faz a tela preencher todo o painel
        telaEstoque.Dock = DockStyle.Fill

        ' 4. Adiciona a tela de estoque ao painel principal
        pnlMain.Controls.Add(telaEstoque)
    End Sub

    ' Este é um NOVO método público
    Public Sub AbrirTelaDeEdicao(mangaId As Integer)
        ' 1. Limpa o painel
        pnlMain.Controls.Clear()

        ' 2. Cria a tela "Adicionar Mangá" (que usaremos para editar)
        Dim telaEdicao As New ucAdicionarManga()
        telaEdicao.Dock = DockStyle.Fill

        ' 3. Adiciona ao painel
        pnlMain.Controls.Add(telaEdicao)

        ' 4. CHAMA O NOVO MÉTODO para carregar os dados do mangá
        '    (Este método será criado na Parte 3)
        telaEdicao.CarregarMangaParaEdicao(mangaId)
    End Sub

    Public Sub AbrirEdicaoFornecedor(fornecedorId As Integer)
        ' 1. Limpa o painel principal
        pnlMain.Controls.Clear()

        ' 2. Cria a tela de cadastro (que agora serve para editar)
        Dim telaEdicao As New ucAdicionarFornecedor()
        telaEdicao.Dock = DockStyle.Fill
        pnlMain.Controls.Add(telaEdicao)

        ' 3. Manda essa tela carregar os dados do fornecedor
        telaEdicao.CarregarFornecedorParaEdicao(fornecedorId)
    End Sub

    Private Sub btnSair_Click(sender As Object, e As EventArgs) Handles btnSair.Click
        ' 1. Cria a caixa de diálogo e guarda a resposta do usuário
        Dim resultado As DialogResult = MessageBox.Show("Tem certeza que deseja sair do aplicativo?",
                                                       "Confirmar Saída",
                                                       MessageBoxButtons.YesNo,
                                                       MessageBoxIcon.Question)

        ' 2. Verifica se o usuário clicou em "Sim"
        If resultado = DialogResult.Yes Then
            ' Se sim, fecha a aplicação
            Application.Exit()
        End If

        ' Se o usuário clicou em "Não", o código simplesmente termina e nada acontece.
    End Sub
End Class