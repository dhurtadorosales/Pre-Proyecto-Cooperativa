Imports System.Data
Imports System.Data.SqlClient

Partial Class recursos_maestra_Default2
    Inherits System.Web.UI.Page

    Protected Sub btnCambiar_Click(sender As Object, e As EventArgs) Handles btnCambiar.Click

        Dim base As String
        Dim sentencia As String
        Dim resultado As Integer
        Dim operacion As New Operaciones

        If Session("dUsuario").Rows(0).item(1) = tbActual.Text Then
            Try
                'Insertamos en la base de datos cooperativa
                base = "socios_cooperativa"
                sentencia = "update Usuario set password=convert(varchar(15),@c) where idUsuario=convert(int,@a) and password=convert(varchar(15),@b)"

                resultado = operacion.ejecucion(base, sentencia, tbNueva.Text.ToString, Session("dUsuario").Rows(0).item(0), Session("dUsuario").Rows(0).item(1).ToString)

                MsgBox("Contraseña modificada correctamente")
            Catch ex As SqlException
                MsgBox("No se ha podido cambiar la contraseña")
            End Try
        Else
            MsgBox("La contraseña actual no es correcta")
        End If

    End Sub

    Protected Sub validaPass(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs)

        If Session("dUsuario").Rows(0).item(0) = tbActual.Text Then
            args.IsValid = True
        Else
            args.IsValid = False
        End If

    End Sub

End Class
