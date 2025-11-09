<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FormEstoque
    Inherits System.Windows.Forms.Form

    'Descartar substituições de formulário para limpar a lista de componentes.
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
        Me.pnlMenu = New System.Windows.Forms.Panel()
        Me.btnHistorico = New System.Windows.Forms.Button()
        Me.btnFornecedores = New System.Windows.Forms.Button()
        Me.btnSair = New System.Windows.Forms.Button()
        Me.btnVenda = New System.Windows.Forms.Button()
        Me.btnAddForn = New System.Windows.Forms.Button()
        Me.btnAddManga = New System.Windows.Forms.Button()
        Me.btnEstoqueBaixo = New System.Windows.Forms.Button()
        Me.btnEstoque = New System.Windows.Forms.Button()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.pnlMain = New System.Windows.Forms.Panel()
        Me.pnlMenu.SuspendLayout()
        Me.SuspendLayout()
        '
        'pnlMenu
        '
        Me.pnlMenu.BackColor = System.Drawing.Color.Bisque
        Me.pnlMenu.Controls.Add(Me.btnHistorico)
        Me.pnlMenu.Controls.Add(Me.btnFornecedores)
        Me.pnlMenu.Controls.Add(Me.btnSair)
        Me.pnlMenu.Controls.Add(Me.btnVenda)
        Me.pnlMenu.Controls.Add(Me.btnAddForn)
        Me.pnlMenu.Controls.Add(Me.btnAddManga)
        Me.pnlMenu.Controls.Add(Me.btnEstoqueBaixo)
        Me.pnlMenu.Controls.Add(Me.btnEstoque)
        Me.pnlMenu.Controls.Add(Me.Label1)
        Me.pnlMenu.Dock = System.Windows.Forms.DockStyle.Left
        Me.pnlMenu.Location = New System.Drawing.Point(0, 0)
        Me.pnlMenu.Name = "pnlMenu"
        Me.pnlMenu.Size = New System.Drawing.Size(200, 511)
        Me.pnlMenu.TabIndex = 0
        '
        'btnHistorico
        '
        Me.btnHistorico.BackColor = System.Drawing.Color.IndianRed
        Me.btnHistorico.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnHistorico.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnHistorico.Font = New System.Drawing.Font("Impact", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnHistorico.ForeColor = System.Drawing.SystemColors.Control
        Me.btnHistorico.Location = New System.Drawing.Point(12, 356)
        Me.btnHistorico.Name = "btnHistorico"
        Me.btnHistorico.Size = New System.Drawing.Size(174, 36)
        Me.btnHistorico.TabIndex = 8
        Me.btnHistorico.Text = "Histórico Vendas"
        Me.btnHistorico.UseVisualStyleBackColor = False
        '
        'btnFornecedores
        '
        Me.btnFornecedores.BackColor = System.Drawing.Color.IndianRed
        Me.btnFornecedores.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnFornecedores.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnFornecedores.Font = New System.Drawing.Font("Impact", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnFornecedores.ForeColor = System.Drawing.SystemColors.Control
        Me.btnFornecedores.Location = New System.Drawing.Point(12, 154)
        Me.btnFornecedores.Name = "btnFornecedores"
        Me.btnFornecedores.Size = New System.Drawing.Size(174, 36)
        Me.btnFornecedores.TabIndex = 7
        Me.btnFornecedores.Text = "Fornecedores"
        Me.btnFornecedores.UseVisualStyleBackColor = False
        '
        'btnSair
        '
        Me.btnSair.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.btnSair.BackColor = System.Drawing.Color.IndianRed
        Me.btnSair.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnSair.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnSair.Font = New System.Drawing.Font("Impact", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnSair.ForeColor = System.Drawing.SystemColors.Control
        Me.btnSair.Location = New System.Drawing.Point(12, 463)
        Me.btnSair.Name = "btnSair"
        Me.btnSair.Size = New System.Drawing.Size(174, 36)
        Me.btnSair.TabIndex = 6
        Me.btnSair.Text = "Sair"
        Me.btnSair.UseVisualStyleBackColor = False
        '
        'btnVenda
        '
        Me.btnVenda.BackColor = System.Drawing.Color.IndianRed
        Me.btnVenda.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnVenda.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnVenda.Font = New System.Drawing.Font("Impact", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnVenda.ForeColor = System.Drawing.SystemColors.Control
        Me.btnVenda.Location = New System.Drawing.Point(12, 305)
        Me.btnVenda.Name = "btnVenda"
        Me.btnVenda.Size = New System.Drawing.Size(174, 36)
        Me.btnVenda.TabIndex = 5
        Me.btnVenda.Text = "Realizar Venda"
        Me.btnVenda.UseVisualStyleBackColor = False
        '
        'btnAddForn
        '
        Me.btnAddForn.BackColor = System.Drawing.Color.IndianRed
        Me.btnAddForn.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnAddForn.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnAddForn.Font = New System.Drawing.Font("Impact", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnAddForn.ForeColor = System.Drawing.SystemColors.Control
        Me.btnAddForn.Location = New System.Drawing.Point(12, 255)
        Me.btnAddForn.Name = "btnAddForn"
        Me.btnAddForn.Size = New System.Drawing.Size(174, 36)
        Me.btnAddForn.TabIndex = 4
        Me.btnAddForn.Text = "Adicionar Fornecedor"
        Me.btnAddForn.UseVisualStyleBackColor = False
        '
        'btnAddManga
        '
        Me.btnAddManga.BackColor = System.Drawing.Color.IndianRed
        Me.btnAddManga.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnAddManga.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnAddManga.Font = New System.Drawing.Font("Impact", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnAddManga.ForeColor = System.Drawing.SystemColors.Control
        Me.btnAddManga.Location = New System.Drawing.Point(12, 205)
        Me.btnAddManga.Name = "btnAddManga"
        Me.btnAddManga.Size = New System.Drawing.Size(174, 36)
        Me.btnAddManga.TabIndex = 3
        Me.btnAddManga.Text = "Adicionar Mangá"
        Me.btnAddManga.UseVisualStyleBackColor = False
        '
        'btnEstoqueBaixo
        '
        Me.btnEstoqueBaixo.BackColor = System.Drawing.Color.IndianRed
        Me.btnEstoqueBaixo.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnEstoqueBaixo.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnEstoqueBaixo.Font = New System.Drawing.Font("Impact", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnEstoqueBaixo.ForeColor = System.Drawing.SystemColors.Control
        Me.btnEstoqueBaixo.Location = New System.Drawing.Point(12, 103)
        Me.btnEstoqueBaixo.Name = "btnEstoqueBaixo"
        Me.btnEstoqueBaixo.Size = New System.Drawing.Size(174, 36)
        Me.btnEstoqueBaixo.TabIndex = 2
        Me.btnEstoqueBaixo.Text = "Estoque Baixo"
        Me.btnEstoqueBaixo.UseVisualStyleBackColor = False
        '
        'btnEstoque
        '
        Me.btnEstoque.BackColor = System.Drawing.Color.IndianRed
        Me.btnEstoque.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnEstoque.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnEstoque.Font = New System.Drawing.Font("Impact", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnEstoque.ForeColor = System.Drawing.SystemColors.Control
        Me.btnEstoque.Location = New System.Drawing.Point(12, 54)
        Me.btnEstoque.Name = "btnEstoque"
        Me.btnEstoque.Size = New System.Drawing.Size(174, 36)
        Me.btnEstoque.TabIndex = 1
        Me.btnEstoque.Text = "Estoque"
        Me.btnEstoque.UseVisualStyleBackColor = False
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Impact", 14.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.ForeColor = System.Drawing.Color.IndianRed
        Me.Label1.Location = New System.Drawing.Point(73, 11)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(52, 23)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "MENU"
        '
        'pnlMain
        '
        Me.pnlMain.Dock = System.Windows.Forms.DockStyle.Fill
        Me.pnlMain.Location = New System.Drawing.Point(200, 0)
        Me.pnlMain.Name = "pnlMain"
        Me.pnlMain.Size = New System.Drawing.Size(859, 511)
        Me.pnlMain.TabIndex = 1
        '
        'FormEstoque
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1059, 511)
        Me.Controls.Add(Me.pnlMain)
        Me.Controls.Add(Me.pnlMenu)
        Me.MinimumSize = New System.Drawing.Size(1075, 489)
        Me.Name = "FormEstoque"
        Me.Text = "FormEstoque"
        Me.pnlMenu.ResumeLayout(False)
        Me.pnlMenu.PerformLayout()
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents pnlMenu As Panel
    Friend WithEvents pnlMain As Panel
    Friend WithEvents btnSair As Button
    Friend WithEvents btnVenda As Button
    Friend WithEvents btnAddForn As Button
    Friend WithEvents btnAddManga As Button
    Friend WithEvents btnEstoqueBaixo As Button
    Friend WithEvents btnEstoque As Button
    Friend WithEvents Label1 As Label
    Friend WithEvents btnFornecedores As Button
    Friend WithEvents btnHistorico As Button
End Class
