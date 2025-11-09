<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class ucFornecedores
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
        Me.pnlPesquisa = New System.Windows.Forms.Panel()
        Me.txtPesquisa = New System.Windows.Forms.TextBox()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.dgvFornecedores = New System.Windows.Forms.DataGridView()
        Me.pnlPesquisa.SuspendLayout()
        CType(Me.dgvFornecedores, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'pnlPesquisa
        '
        Me.pnlPesquisa.BackColor = System.Drawing.Color.IndianRed
        Me.pnlPesquisa.Controls.Add(Me.txtPesquisa)
        Me.pnlPesquisa.Controls.Add(Me.Label1)
        Me.pnlPesquisa.Dock = System.Windows.Forms.DockStyle.Top
        Me.pnlPesquisa.Location = New System.Drawing.Point(0, 0)
        Me.pnlPesquisa.Name = "pnlPesquisa"
        Me.pnlPesquisa.Size = New System.Drawing.Size(859, 50)
        Me.pnlPesquisa.TabIndex = 0
        '
        'txtPesquisa
        '
        Me.txtPesquisa.Font = New System.Drawing.Font("Franklin Gothic Book", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtPesquisa.Location = New System.Drawing.Point(368, 12)
        Me.txtPesquisa.Name = "txtPesquisa"
        Me.txtPesquisa.Size = New System.Drawing.Size(219, 26)
        Me.txtPesquisa.TabIndex = 1
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Impact", 14.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.ForeColor = System.Drawing.SystemColors.Control
        Me.Label1.Location = New System.Drawing.Point(272, 15)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(90, 23)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Pesquisar"
        '
        'dgvFornecedores
        '
        Me.dgvFornecedores.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.dgvFornecedores.Dock = System.Windows.Forms.DockStyle.Fill
        Me.dgvFornecedores.Location = New System.Drawing.Point(0, 50)
        Me.dgvFornecedores.Name = "dgvFornecedores"
        Me.dgvFornecedores.Size = New System.Drawing.Size(859, 400)
        Me.dgvFornecedores.TabIndex = 1
        '
        'ucFornecedores
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.Controls.Add(Me.dgvFornecedores)
        Me.Controls.Add(Me.pnlPesquisa)
        Me.MinimumSize = New System.Drawing.Size(859, 450)
        Me.Name = "ucFornecedores"
        Me.Size = New System.Drawing.Size(859, 450)
        Me.pnlPesquisa.ResumeLayout(False)
        Me.pnlPesquisa.PerformLayout()
        CType(Me.dgvFornecedores, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents pnlPesquisa As Panel
    Friend WithEvents dgvFornecedores As DataGridView
    Friend WithEvents txtPesquisa As TextBox
    Friend WithEvents Label1 As Label
End Class
