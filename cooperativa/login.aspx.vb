
Partial Class recursos_maestra_Default2
    Inherits System.Web.UI.Page

    Dim us As Int32

    Private Sub login_Init(sender As Object, e As EventArgs) Handles Me.Init
        tbNumSocio.Attributes.Add("placeholder", "Número de socio")
        tbPass.Attributes.Add("placeholder", "Contraseña")

        If Request.IsAuthenticated Then ' El usuario se encuentra autenticado, ya que se creó una cookie persistente con el tique de validación. Se redirecciona directamente a roles.aspx, previa carga de todos los datos del usuario.
            Session("dUsuario") = Codigo.dUsuario(User.Identity.Name)
            Session("cookiePermanente") = True
            Response.Redirect("roles.aspx")
        End If
    End Sub


    Protected Sub OKusuario(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs)
        Session("dUsuario") = Codigo.dUsuario(tbNumSocio.Text, tbPass.Text)
        If Session("dUsuario").Rows.Count > 0 Then
            us = Session("dUsuario").Rows(0).item(0)

            ' Antes de empezar a trabajar, se borran sus datos anteriores de aspdbnet por si quedan residuos.
            Codigo.removeUsuarioyRoles(us, Roles.GetRolesForUser(us))

            ' FormsAuthentication.RedirectFromLoginPage
            ' Emite un vale de autenticación para el usuario us que es guardado en la cookie predeterminada (persistente o no).
            ' A su vez, redirige al usuario autenticado hacia la dirección URL originalmente solicitada o a la dirección URL predeterminada.
            Session("cookiePermanente") = CKrecordar.Checked
            FormsAuthentication.RedirectFromLoginPage(us, Session("cookiePermanente"))
            args.IsValid = True
            Response.Redirect("roles.aspx")
        Else
            args.IsValid = False
        End If
    End Sub


End Class
