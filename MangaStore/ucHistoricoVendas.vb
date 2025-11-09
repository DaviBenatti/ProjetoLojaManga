Imports MySql.Data.MySqlClient
Imports System.Data

Public Class ucHistoricoVendas

    ' Use a sua string de conexão
    Private strConexao As String = "server=localhost;database=db_manga_store;uid=root;password=usbw;port=3307"

    ' 1. EVENTO LOAD: Ocorre quando a tela é aberta
    Private Sub ucHistoricoVendas_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        CarregarVendas() ' Carrega o grid de cima (Mestre)
        FormatarGridMestre()
    End Sub

    ' 2. MÉTODO: Carrega a lista de TODAS as vendas (Grid Mestre)
    Private Sub CarregarVendas()
        Try
            ' Traz as vendas mais recentes primeiro
            Dim sql As String = "SELECT venda_id, data_venda, valor_total FROM vendas ORDER BY data_venda DESC"
            Dim adapter As New MySqlDataAdapter(sql, strConexao)
            Dim dt As New DataTable()
            adapter.Fill(dt)
            dgvVendas.DataSource = dt
        Catch ex As Exception
            MessageBox.Show("Erro ao carregar histórico de vendas: " & ex.Message, "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    ' 3. EVENTO "LINK": Ocorre quando o usuário clica em uma venda no grid de cima
    Private Sub dgvVendas_SelectionChanged(sender As Object, e As EventArgs) Handles dgvVendas.SelectionChanged
        ' Garante que uma linha válida foi selecionada
        If dgvVendas.SelectedRows.Count > 0 Then
            ' Pega o ID da linha selecionada
            Dim vendaId As Integer = CInt(dgvVendas.SelectedRows(0).Cells("venda_id").Value)

            ' Manda carregar o grid de baixo (Detalhe)
            CarregarItensDaVenda(vendaId)
        End If
    End Sub

    ' 4. MÉTODO: Carrega os ITENS da venda selecionada (Grid Detalhe)
    Private Sub CarregarItensDaVenda(vendaId As Integer)
        Try
            ' Usamos JOIN para pegar o nome do mangá
            Dim sql As String = "SELECT m.titulo, m.volume, vi.quantidade_vendida, vi.preco_unitario " &
                                "FROM venda_itens AS vi " &
                                "JOIN mangas AS m ON vi.manga_id_fk = m.manga_id " &
                                "WHERE vi.venda_id_fk = @idVenda"

            Dim comando As New MySqlCommand(sql, New MySqlConnection(strConexao))
            comando.Parameters.AddWithValue("@idVenda", vendaId)

            Dim adapter As New MySqlDataAdapter(comando)
            Dim dt As New DataTable()
            adapter.Fill(dt)
            dgvItensVenda.DataSource = dt

            FormatarGridDetalhe()
        Catch ex As Exception
            MessageBox.Show("Erro ao carregar itens da venda: " & ex.Message, "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    ' 5. MÉTODOS DE FORMATAÇÃO (Opcional, mas recomendado)
    Private Sub FormatarGridMestre()
        Try
            dgvVendas.Columns("venda_id").HeaderText = "ID Venda"
            dgvVendas.Columns("data_venda").HeaderText = "Data e Hora"
            dgvVendas.Columns("valor_total").HeaderText = "Valor Total"
            dgvVendas.Columns("valor_total").DefaultCellStyle.Format = "C2" ' Formata como R$

            dgvVendas.Columns("venda_id").AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill
            dgvVendas.Columns("data_venda").AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill
            dgvVendas.Columns("valor_total").AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill
        Catch ex As Exception
        End Try
    End Sub

    Private Sub FormatarGridDetalhe()
        Try
            dgvItensVenda.Columns("titulo").HeaderText = "Título"
            dgvItensVenda.Columns("volume").HeaderText = "Volume"
            dgvItensVenda.Columns("quantidade_vendida").HeaderText = "Qtd. Vendida"
            dgvItensVenda.Columns("preco_unitario").HeaderText = "Preço Unit."
            dgvItensVenda.Columns("preco_unitario").DefaultCellStyle.Format = "C2" ' Formata como R$

            dgvItensVenda.Columns("titulo").AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill
            dgvItensVenda.Columns("volume").AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill
            dgvItensVenda.Columns("quantidade_vendida").AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill
            dgvItensVenda.Columns("preco_unitario").AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill
        Catch ex As Exception
        End Try
    End Sub

End Class
