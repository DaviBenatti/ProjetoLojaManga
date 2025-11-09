<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class ucAdicionarManga
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
        Me.Panel1 = New System.Windows.Forms.Panel()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.btnSalvar = New System.Windows.Forms.Button()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.Label6 = New System.Windows.Forms.Label()
        Me.Label7 = New System.Windows.Forms.Label()
        Me.Label8 = New System.Windows.Forms.Label()
        Me.txtTitulo = New System.Windows.Forms.TextBox()
        Me.nudVolume = New System.Windows.Forms.NumericUpDown()
        Me.nudQtdeEstoque = New System.Windows.Forms.NumericUpDown()
        Me.nudEstoqueMinimo = New System.Windows.Forms.NumericUpDown()
        Me.txtAutor = New System.Windows.Forms.TextBox()
        Me.cmbFornecedor = New System.Windows.Forms.ComboBox()
        Me.txtPreco = New System.Windows.Forms.TextBox()
        Me.Panel1.SuspendLayout()
        CType(Me.nudVolume, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.nudQtdeEstoque, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.nudEstoqueMinimo, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Panel1
        '
        Me.Panel1.BackColor = System.Drawing.Color.IndianRed
        Me.Panel1.Controls.Add(Me.Label1)
        Me.Panel1.Dock = System.Windows.Forms.DockStyle.Top
        Me.Panel1.Location = New System.Drawing.Point(0, 0)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(859, 50)
        Me.Panel1.TabIndex = 0
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Impact", 14.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.ForeColor = System.Drawing.SystemColors.Control
        Me.Label1.Location = New System.Drawing.Point(676, 14)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(170, 23)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Adicionar e Atualizar"
        '
        'btnSalvar
        '
        Me.btnSalvar.BackColor = System.Drawing.Color.IndianRed
        Me.btnSalvar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnSalvar.Font = New System.Drawing.Font("Impact", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnSalvar.ForeColor = System.Drawing.SystemColors.Control
        Me.btnSalvar.Location = New System.Drawing.Point(63, 371)
        Me.btnSalvar.Name = "btnSalvar"
        Me.btnSalvar.Size = New System.Drawing.Size(737, 29)
        Me.btnSalvar.TabIndex = 1
        Me.btnSalvar.Text = "Salvar"
        Me.btnSalvar.UseVisualStyleBackColor = False
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Font = New System.Drawing.Font("Franklin Gothic Book", 14.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.Location = New System.Drawing.Point(59, 86)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(59, 24)
        Me.Label2.TabIndex = 2
        Me.Label2.Text = "Título"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Font = New System.Drawing.Font("Franklin Gothic Book", 14.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label3.Location = New System.Drawing.Point(676, 86)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(75, 24)
        Me.Label3.TabIndex = 3
        Me.Label3.Text = "Volume"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Font = New System.Drawing.Font("Franklin Gothic Book", 14.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label4.Location = New System.Drawing.Point(59, 170)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(57, 24)
        Me.Label4.TabIndex = 4
        Me.Label4.Text = "Autor"
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Font = New System.Drawing.Font("Franklin Gothic Book", 14.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label5.Location = New System.Drawing.Point(676, 170)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(61, 24)
        Me.Label5.TabIndex = 5
        Me.Label5.Text = "Preço"
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Font = New System.Drawing.Font("Franklin Gothic Book", 14.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label6.Location = New System.Drawing.Point(339, 267)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(190, 24)
        Me.Label6.TabIndex = 6
        Me.Label6.Text = "Quantidade Estoque"
        '
        'Label7
        '
        Me.Label7.AutoSize = True
        Me.Label7.Font = New System.Drawing.Font("Franklin Gothic Book", 14.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label7.Location = New System.Drawing.Point(599, 267)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(152, 24)
        Me.Label7.TabIndex = 7
        Me.Label7.Text = "Estoque Mínimo"
        '
        'Label8
        '
        Me.Label8.AutoSize = True
        Me.Label8.Font = New System.Drawing.Font("Franklin Gothic Book", 14.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label8.Location = New System.Drawing.Point(59, 264)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(111, 24)
        Me.Label8.TabIndex = 8
        Me.Label8.Text = "Fornecedor"
        '
        'txtTitulo
        '
        Me.txtTitulo.Font = New System.Drawing.Font("Franklin Gothic Book", 14.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtTitulo.Location = New System.Drawing.Point(63, 109)
        Me.txtTitulo.Name = "txtTitulo"
        Me.txtTitulo.Size = New System.Drawing.Size(585, 29)
        Me.txtTitulo.TabIndex = 9
        '
        'nudVolume
        '
        Me.nudVolume.Font = New System.Drawing.Font("Franklin Gothic Book", 14.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.nudVolume.Location = New System.Drawing.Point(680, 110)
        Me.nudVolume.Name = "nudVolume"
        Me.nudVolume.Size = New System.Drawing.Size(120, 29)
        Me.nudVolume.TabIndex = 10
        '
        'nudQtdeEstoque
        '
        Me.nudQtdeEstoque.Font = New System.Drawing.Font("Franklin Gothic Book", 14.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.nudQtdeEstoque.Location = New System.Drawing.Point(343, 290)
        Me.nudQtdeEstoque.Name = "nudQtdeEstoque"
        Me.nudQtdeEstoque.Size = New System.Drawing.Size(220, 29)
        Me.nudQtdeEstoque.TabIndex = 12
        '
        'nudEstoqueMinimo
        '
        Me.nudEstoqueMinimo.Font = New System.Drawing.Font("Franklin Gothic Book", 14.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.nudEstoqueMinimo.Location = New System.Drawing.Point(603, 290)
        Me.nudEstoqueMinimo.Name = "nudEstoqueMinimo"
        Me.nudEstoqueMinimo.Size = New System.Drawing.Size(197, 29)
        Me.nudEstoqueMinimo.TabIndex = 13
        '
        'txtAutor
        '
        Me.txtAutor.Font = New System.Drawing.Font("Franklin Gothic Book", 14.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtAutor.Location = New System.Drawing.Point(63, 193)
        Me.txtAutor.Name = "txtAutor"
        Me.txtAutor.Size = New System.Drawing.Size(585, 29)
        Me.txtAutor.TabIndex = 14
        '
        'cmbFornecedor
        '
        Me.cmbFornecedor.Font = New System.Drawing.Font("Franklin Gothic Book", 14.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbFornecedor.FormattingEnabled = True
        Me.cmbFornecedor.Location = New System.Drawing.Point(63, 287)
        Me.cmbFornecedor.Name = "cmbFornecedor"
        Me.cmbFornecedor.Size = New System.Drawing.Size(234, 32)
        Me.cmbFornecedor.TabIndex = 15
        '
        'txtPreco
        '
        Me.txtPreco.Font = New System.Drawing.Font("Franklin Gothic Book", 14.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtPreco.Location = New System.Drawing.Point(680, 193)
        Me.txtPreco.Name = "txtPreco"
        Me.txtPreco.Size = New System.Drawing.Size(120, 29)
        Me.txtPreco.TabIndex = 16
        '
        'ucAdicionarManga
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.Controls.Add(Me.txtPreco)
        Me.Controls.Add(Me.cmbFornecedor)
        Me.Controls.Add(Me.txtAutor)
        Me.Controls.Add(Me.nudEstoqueMinimo)
        Me.Controls.Add(Me.nudQtdeEstoque)
        Me.Controls.Add(Me.nudVolume)
        Me.Controls.Add(Me.txtTitulo)
        Me.Controls.Add(Me.Label8)
        Me.Controls.Add(Me.Label7)
        Me.Controls.Add(Me.Label6)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.btnSalvar)
        Me.Controls.Add(Me.Panel1)
        Me.MinimumSize = New System.Drawing.Size(859, 450)
        Me.Name = "ucAdicionarManga"
        Me.Size = New System.Drawing.Size(859, 486)
        Me.Panel1.ResumeLayout(False)
        Me.Panel1.PerformLayout()
        CType(Me.nudVolume, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.nudQtdeEstoque, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.nudEstoqueMinimo, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents Panel1 As Panel
    Friend WithEvents Label1 As Label
    Friend WithEvents btnSalvar As Button
    Friend WithEvents Label2 As Label
    Friend WithEvents Label3 As Label
    Friend WithEvents Label4 As Label
    Friend WithEvents Label5 As Label
    Friend WithEvents Label6 As Label
    Friend WithEvents Label7 As Label
    Friend WithEvents Label8 As Label
    Friend WithEvents txtTitulo As TextBox
    Friend WithEvents nudVolume As NumericUpDown
    Friend WithEvents nudQtdeEstoque As NumericUpDown
    Friend WithEvents nudEstoqueMinimo As NumericUpDown
    Friend WithEvents txtAutor As TextBox
    Friend WithEvents cmbFornecedor As ComboBox
    Friend WithEvents txtPreco As TextBox
End Class
