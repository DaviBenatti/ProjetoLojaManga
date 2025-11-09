<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class ucRealizarVenda
    Inherits System.Windows.Forms.UserControl

    'O UserControl substitui o descarte para limpar a lista de componentes.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Exigido pelo Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'OBSERVAÇÃO: o procedimento a seguir é exigido pelo Windows Form Designer
    'Pode ser modificado usando o Windows Form Designer.  
    'Não o modifique usando o editor de códigos.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.pnlVenda = New System.Windows.Forms.Panel()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.btnAdicionar = New System.Windows.Forms.Button()
        Me.nudQuantidade = New System.Windows.Forms.NumericUpDown()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.cmbVolume = New System.Windows.Forms.ComboBox()
        Me.cmbProduto = New System.Windows.Forms.ComboBox()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.pnlSubtotal = New System.Windows.Forms.Panel()
        Me.btnFinalizarVenda = New System.Windows.Forms.Button()
        Me.lblTotal = New System.Windows.Forms.Label()
        Me.dgvCarrinho = New System.Windows.Forms.DataGridView()
        Me.colMangaID = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.colTitulo = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.colQtd = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.colPreco = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.colSubtotal = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.colRemover = New System.Windows.Forms.DataGridViewButtonColumn()
        Me.pnlVenda.SuspendLayout()
        CType(Me.nudQuantidade, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.pnlSubtotal.SuspendLayout()
        CType(Me.dgvCarrinho, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'pnlVenda
        '
        Me.pnlVenda.BackColor = System.Drawing.Color.IndianRed
        Me.pnlVenda.Controls.Add(Me.Label3)
        Me.pnlVenda.Controls.Add(Me.btnAdicionar)
        Me.pnlVenda.Controls.Add(Me.nudQuantidade)
        Me.pnlVenda.Controls.Add(Me.Label2)
        Me.pnlVenda.Controls.Add(Me.cmbVolume)
        Me.pnlVenda.Controls.Add(Me.cmbProduto)
        Me.pnlVenda.Controls.Add(Me.Label1)
        Me.pnlVenda.Dock = System.Windows.Forms.DockStyle.Top
        Me.pnlVenda.Location = New System.Drawing.Point(0, 0)
        Me.pnlVenda.Name = "pnlVenda"
        Me.pnlVenda.Size = New System.Drawing.Size(859, 100)
        Me.pnlVenda.TabIndex = 0
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Font = New System.Drawing.Font("Franklin Gothic Book", 14.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label3.ForeColor = System.Drawing.SystemColors.Control
        Me.Label3.Location = New System.Drawing.Point(399, 40)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(75, 24)
        Me.Label3.TabIndex = 5
        Me.Label3.Text = "Volume"
        '
        'btnAdicionar
        '
        Me.btnAdicionar.BackColor = System.Drawing.SystemColors.Control
        Me.btnAdicionar.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnAdicionar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnAdicionar.Font = New System.Drawing.Font("Impact", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnAdicionar.ForeColor = System.Drawing.Color.IndianRed
        Me.btnAdicionar.Location = New System.Drawing.Point(667, 36)
        Me.btnAdicionar.Name = "btnAdicionar"
        Me.btnAdicionar.Size = New System.Drawing.Size(160, 36)
        Me.btnAdicionar.TabIndex = 4
        Me.btnAdicionar.Text = "Adicionar ao Carrinho"
        Me.btnAdicionar.UseVisualStyleBackColor = False
        '
        'nudQuantidade
        '
        Me.nudQuantidade.Font = New System.Drawing.Font("Franklin Gothic Book", 14.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.nudQuantidade.Location = New System.Drawing.Point(588, 38)
        Me.nudQuantidade.Minimum = New Decimal(New Integer() {1, 0, 0, 0})
        Me.nudQuantidade.Name = "nudQuantidade"
        Me.nudQuantidade.Size = New System.Drawing.Size(48, 29)
        Me.nudQuantidade.TabIndex = 3
        Me.nudQuantidade.Value = New Decimal(New Integer() {1, 0, 0, 0})
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Font = New System.Drawing.Font("Franklin Gothic Book", 14.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.ForeColor = System.Drawing.SystemColors.Control
        Me.Label2.Location = New System.Drawing.Point(543, 40)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(41, 24)
        Me.Label2.TabIndex = 2
        Me.Label2.Text = "Qtd"
        '
        'cmbVolume
        '
        Me.cmbVolume.Enabled = False
        Me.cmbVolume.Font = New System.Drawing.Font("Franklin Gothic Book", 14.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbVolume.FormattingEnabled = True
        Me.cmbVolume.Location = New System.Drawing.Point(476, 36)
        Me.cmbVolume.Name = "cmbVolume"
        Me.cmbVolume.Size = New System.Drawing.Size(55, 32)
        Me.cmbVolume.TabIndex = 1
        '
        'cmbProduto
        '
        Me.cmbProduto.Font = New System.Drawing.Font("Franklin Gothic Book", 14.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbProduto.FormattingEnabled = True
        Me.cmbProduto.Location = New System.Drawing.Point(89, 35)
        Me.cmbProduto.Name = "cmbProduto"
        Me.cmbProduto.Size = New System.Drawing.Size(304, 32)
        Me.cmbProduto.TabIndex = 1
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.BackColor = System.Drawing.Color.IndianRed
        Me.Label1.Font = New System.Drawing.Font("Franklin Gothic Book", 14.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.ForeColor = System.Drawing.SystemColors.Control
        Me.Label1.Location = New System.Drawing.Point(19, 40)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(69, 24)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Mangá"
        '
        'pnlSubtotal
        '
        Me.pnlSubtotal.BackColor = System.Drawing.Color.IndianRed
        Me.pnlSubtotal.Controls.Add(Me.btnFinalizarVenda)
        Me.pnlSubtotal.Controls.Add(Me.lblTotal)
        Me.pnlSubtotal.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.pnlSubtotal.Location = New System.Drawing.Point(0, 350)
        Me.pnlSubtotal.Name = "pnlSubtotal"
        Me.pnlSubtotal.Size = New System.Drawing.Size(859, 100)
        Me.pnlSubtotal.TabIndex = 1
        '
        'btnFinalizarVenda
        '
        Me.btnFinalizarVenda.BackColor = System.Drawing.SystemColors.Control
        Me.btnFinalizarVenda.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnFinalizarVenda.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnFinalizarVenda.Font = New System.Drawing.Font("Impact", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnFinalizarVenda.ForeColor = System.Drawing.Color.IndianRed
        Me.btnFinalizarVenda.Location = New System.Drawing.Point(697, 34)
        Me.btnFinalizarVenda.Name = "btnFinalizarVenda"
        Me.btnFinalizarVenda.Size = New System.Drawing.Size(130, 36)
        Me.btnFinalizarVenda.TabIndex = 1
        Me.btnFinalizarVenda.Text = "Finalizar Venda"
        Me.btnFinalizarVenda.UseVisualStyleBackColor = False
        '
        'lblTotal
        '
        Me.lblTotal.AutoSize = True
        Me.lblTotal.Font = New System.Drawing.Font("Franklin Gothic Book", 14.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblTotal.ForeColor = System.Drawing.SystemColors.Control
        Me.lblTotal.Location = New System.Drawing.Point(35, 39)
        Me.lblTotal.Name = "lblTotal"
        Me.lblTotal.Size = New System.Drawing.Size(139, 24)
        Me.lblTotal.TabIndex = 0
        Me.lblTotal.Text = "Total: R$ 0,00"
        '
        'dgvCarrinho
        '
        Me.dgvCarrinho.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.dgvCarrinho.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.colMangaID, Me.colTitulo, Me.colQtd, Me.colPreco, Me.colSubtotal, Me.colRemover})
        Me.dgvCarrinho.Dock = System.Windows.Forms.DockStyle.Fill
        Me.dgvCarrinho.Location = New System.Drawing.Point(0, 100)
        Me.dgvCarrinho.Name = "dgvCarrinho"
        Me.dgvCarrinho.Size = New System.Drawing.Size(859, 250)
        Me.dgvCarrinho.TabIndex = 2
        '
        'colMangaID
        '
        Me.colMangaID.HeaderText = "ID"
        Me.colMangaID.Name = "colMangaID"
        Me.colMangaID.Visible = False
        '
        'colTitulo
        '
        Me.colTitulo.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill
        Me.colTitulo.HeaderText = "Título"
        Me.colTitulo.Name = "colTitulo"
        '
        'colQtd
        '
        Me.colQtd.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill
        Me.colQtd.HeaderText = "Qtd"
        Me.colQtd.Name = "colQtd"
        '
        'colPreco
        '
        Me.colPreco.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill
        Me.colPreco.HeaderText = "Preço Unit."
        Me.colPreco.Name = "colPreco"
        '
        'colSubtotal
        '
        Me.colSubtotal.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill
        Me.colSubtotal.HeaderText = "Subtotal"
        Me.colSubtotal.Name = "colSubtotal"
        '
        'colRemover
        '
        Me.colRemover.HeaderText = "Ação"
        Me.colRemover.Name = "colRemover"
        Me.colRemover.Text = "Remover"
        Me.colRemover.UseColumnTextForButtonValue = True
        '
        'ucRealizarVenda
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.Controls.Add(Me.dgvCarrinho)
        Me.Controls.Add(Me.pnlSubtotal)
        Me.Controls.Add(Me.pnlVenda)
        Me.MinimumSize = New System.Drawing.Size(859, 450)
        Me.Name = "ucRealizarVenda"
        Me.Size = New System.Drawing.Size(859, 450)
        Me.pnlVenda.ResumeLayout(False)
        Me.pnlVenda.PerformLayout()
        CType(Me.nudQuantidade, System.ComponentModel.ISupportInitialize).EndInit()
        Me.pnlSubtotal.ResumeLayout(False)
        Me.pnlSubtotal.PerformLayout()
        CType(Me.dgvCarrinho, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents pnlVenda As Panel
    Friend WithEvents Label2 As Label
    Friend WithEvents cmbProduto As ComboBox
    Friend WithEvents Label1 As Label
    Friend WithEvents pnlSubtotal As Panel
    Friend WithEvents dgvCarrinho As DataGridView
    Friend WithEvents btnAdicionar As Button
    Friend WithEvents nudQuantidade As NumericUpDown
    Friend WithEvents btnFinalizarVenda As Button
    Friend WithEvents lblTotal As Label
    Friend WithEvents Label3 As Label
    Friend WithEvents cmbVolume As ComboBox
    Friend WithEvents colMangaID As DataGridViewTextBoxColumn
    Friend WithEvents colTitulo As DataGridViewTextBoxColumn
    Friend WithEvents colQtd As DataGridViewTextBoxColumn
    Friend WithEvents colPreco As DataGridViewTextBoxColumn
    Friend WithEvents colSubtotal As DataGridViewTextBoxColumn
    Friend WithEvents colRemover As DataGridViewButtonColumn
End Class
