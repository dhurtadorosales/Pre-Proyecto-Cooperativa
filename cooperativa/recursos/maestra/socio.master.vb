
Partial Class recursos_maestra_maestra
    Inherits System.Web.UI.MasterPage

    Private Sub recursos_maestra_maestra_Load(sender As Object, e As EventArgs) Handles Me.Load
        lblUsuario.Text = "Socio: " & Session("dUsuario").Rows.item(0).item(2).ToString & " " & Session("dUsuario").Rows.item(0).item(3).ToString
    End Sub

    Protected Sub btnSalir_Click(sender As Object, e As EventArgs)
        Codigo.salir(Context.User.Identity.Name)
    End Sub

    'Protected Sub btnInicio_Click(sender As Object, e As EventArgs) Handles btnInicio.Click
    '    Response.Redirect("~/recursos/paginas/socio/default_socio.aspx")
    'End Sub
End Class

