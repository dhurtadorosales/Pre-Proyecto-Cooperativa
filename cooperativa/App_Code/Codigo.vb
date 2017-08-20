Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class Codigo

    ' Sobrecarga(1) de dUsuario, para obtener el DataTable con todos los datos del usuario a partir del numero de socio y del password.
    Public Shared Function dUsuario(ByVal usuario As Integer, ByVal clave As String) As DataTable
        Dim sentencia As String = "select Usuario.*,Rol.* " &
                                  "from (Usuario join Asignacion on Usuario.idUsuario=Asignacion.idUsuario) " &
                                  "join Rol on Asignacion.idRol=Rol.idRol " &
                                  "where Usuario.idUsuario=@idUsuario and password=@passw"
        Dim cmd As New SqlCommand(sentencia)
        cmd.Parameters.Add("@idUsuario", SqlDbType.Int).Value = usuario
        cmd.Parameters.Add("@passw", SqlDbType.VarChar, 15).Value = clave
        Return execCMD(cmd)
    End Function

    ' Sobrecarga(2) de dUsuario, para obtener el DataTable con todos los datos del usuario a partir del idUsuario.
    Public Shared Function dUsuario(ByVal idusuario As Int32) As DataTable
        Dim sentencia As String = "select Usuario.*,Rol.* " &
                                  "from (Usuario join Asignacion on Usuario.idUsuario=Asignacion.idUsuario) " &
                                  "join Rol on Asignacion.idRol=Rol.idRol " &
                                  "where Usuario.idUsuario=@idUsuario"
        Dim cmd As New SqlCommand(sentencia)
        cmd.Parameters.Add("@idUsuario", SqlDbType.Int).Value = idusuario
        Return execCMD(cmd)
    End Function

    Public Shared Function execCMD(ByVal cmd As SqlCommand) As DataTable
        Dim conexion As String = ConfigurationManager.ConnectionStrings("socios_cooperativaConnectionString").ToString
        Dim cnx As New SqlConnection(conexion)
        cmd.Connection = cnx
        Dim dt As New DataTable
        Try
            Dim adt As New SqlDataAdapter(cmd)
            adt.Fill(dt)
        Catch ex As SystemException
            dt = Nothing
        Finally
            cnx.Close()
            cnx.Dispose()
        End Try
        Return dt
    End Function

    Public Shared Sub setRoles()
        ' Se llama desde el Global.asax, al comenzar la aplicación.
        ' Carga los roles disponibles desde socios_cooperativa a la base de datos aspnetdb.
        Dim conexion As String = ConfigurationManager.ConnectionStrings("socios_cooperativaConnectionString").ToString
        Dim sentencia As String = "select idRol from Rol"
        Dim cnx As New SqlConnection(conexion)
        Dim dr As SqlDataReader
        Try
            Dim cmd As New SqlCommand(sentencia, cnx)
            cnx.Open()
            dr = cmd.ExecuteReader()
            While dr.Read
                If Not Roles.RoleExists(dr.GetInt32(0)) Then Roles.CreateRole(dr.GetInt32(0))
            End While
        Catch ex As SystemException
            Throw New System.Exception(ex.Message)
        Finally
            cnx.Close()
            cnx.Dispose()
        End Try
    End Sub

    Public Shared Function usuarioINrol(ByVal usuario As Integer, ByVal rol As String) As Boolean
        ' Añade un usuario a un rol.
        Dim ok As Boolean = True
        Try
            If Not My.User.IsInRole(rol) Then Roles.AddUserToRole(usuario, rol)
        Catch ex As Exception
            ok = False
        End Try
        Return ok
    End Function

    Public Shared Function removeUsuarioyRoles(ByVal usuario As String, ByVal _roles() As String) As Boolean
        ' Se elimina al usuario y a sus roles de la base de datos aspdbnet.
        Dim ok As Boolean = True
        Try
            Roles.RemoveUserFromRoles(usuario, _roles)
            Membership.DeleteUser(usuario)
        Catch ex As Exception
            ok = False
        End Try
        Return ok
    End Function

    Public Shared Sub salir(ByVal usuario As String)
        ' Se ejecuta al hacer click sobre los botones Salir de las distintas páginas de contenidos.

        ' Se elimina, en aspdbnet, al usuario y sus roles de aspdbnet
        Codigo.removeUsuarioyRoles(usuario, Roles.GetRolesForUser(usuario))

        If Not HttpContext.Current.Session("cookiePermanente") Then
            ' Se elimina el tique de validación.
            FormsAuthentication.SignOut()
        End If
        FormsAuthentication.RedirectToLoginPage()

    End Sub

    Public Shared Function Redireccion(ByVal funcion As String) As String
        ' Se redirecciona a la página de inicio de cada rol.
        Dim pagina As String = Nothing
        Select Case funcion
            Case 1
                pagina = "recursos" & "/" & "paginas" & "/" & "socio" & "/" & "default_socio.aspx"
            Case 2
                pagina = "recursos" & "/" & "paginas" & "/" & "administrador" & "/" & "default_administrador.aspx"
        End Select
        Return pagina
    End Function

End Class
