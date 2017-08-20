Imports System.Data
Imports System.Data.SqlClient

Partial Class recursos_maestra_Default2
    Inherits System.Web.UI.Page

    Dim us As Int32

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        us = Context.User.Identity.Name
        If Roles.GetRolesForUser(us).Count = 0 Then
            If Not IsPostBack Then
                For Each fila As DataRow In Session("dUsuario").Rows
                    ddlRol.Items.Add(New ListItem With {.Text = fila("rol"), .Value = fila("idRol")})
                Next
            End If
        Else
            ' Si tiene roles dados de alta en aspdbnet se redirecciona a su zona. Solo debería tener un rol en cada momento.
            Response.Redirect(Codigo.Redireccion(Roles.GetRolesForUser(us)(0)))
        End If
    End Sub

    Protected Sub btnIniciar_Click(sender As Object, e As EventArgs) Handles btnIniciar.Click
        us = Context.User.Identity.Name
        If CKcontinuar.Checked Then
            If us <> Nothing Then
                ' Añadimos el usuario al rol elegido (aspdbnet)
                Codigo.usuarioINrol(us, ddlRol.SelectedValue)
                ' Redireccionamos a su zona.
                Response.Redirect(Codigo.Redireccion(ddlRol.SelectedValue).ToString)
            Else
                Response.Redirect(Codigo.Redireccion(Roles.GetRolesForUser(us)(0)))
            End If
        Else
            Session("cookiePermanente") = False
            Codigo.salir(us)
        End If
    End Sub

End Class
