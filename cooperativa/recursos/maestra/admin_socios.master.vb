
Partial Class recursos_maestra_maestra
    Inherits System.Web.UI.MasterPage

    Private Sub recursos_maestra_maestra_Load(sender As Object, e As EventArgs) Handles Me.Load
        lblUsuario.Text = "Administrador: " & Session("dUsuario").Rows.item(0).item(2).ToString & " " & Session("dUsuario").Rows.item(0).item(3).ToString
    End Sub

    Protected Sub btnSalir_Click(sender As Object, e As EventArgs)
        'Session.RemoveAll()
        'Session.Abandon()
        'Codigo.salir("dUsuario")
        Codigo.salir(Context.User.Identity.Name)
        'Response.Redirect("~/recursos/paginas/login.aspx")
    End Sub

    Protected Sub btnInicio_Click(sender As Object, e As EventArgs) Handles btnInicio.Click
        Response.Redirect("~/recursos/paginas/administrador/default_administrador.aspx")
    End Sub
End Class

