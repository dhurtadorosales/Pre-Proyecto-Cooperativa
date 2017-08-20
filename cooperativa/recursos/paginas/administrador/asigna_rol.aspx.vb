Imports System.Data
Imports System.Data.SqlClient

Partial Class recursos_maestra_Default
    Inherits System.Web.UI.Page

    Private Sub recursos_maestra_Default_Load(sender As Object, e As EventArgs) Handles Me.Load
        btnAsignaOtro.Visible = False
        btnAltaOtro.Visible = False
        btnFinalizar.Visible = False
    End Sub

    Protected Sub btnAsignaRol_Click(sender As Object, e As EventArgs) Handles btnAsignaRol.Click
        asignaRol()
        btnAsignaRol.Visible = False
        btnAsignaOtro.Visible = True
        btnAltaOtro.Visible = True
        btnFinalizar.Visible = True
    End Sub

    Public Sub asignaRol()
        Dim baseCooperativa As String
        Dim baseUsuarios As String
        Dim sentenciaConsulta As String
        Dim sentenciaInsercion As String
        Dim sentenciaRol As String
        Dim resultadoConsulta As DataTable
        Dim resultadoInsercion As Integer
        Dim resultadoRol As Integer
        Dim operacionConsulta As New Operaciones
        Dim operacionInsercion As New Operaciones

        Try
            'Consultamos el registro insertado en la base de datos cooperativa (el último registro)
            baseCooperativa = "cooperativa"
            sentenciaConsulta = "select * from Socio where codSocio= (select max(codSocio) from Socio)"
            resultadoConsulta = operacionConsulta.consulta(baseCooperativa, sentenciaConsulta)
        Catch ex As SqlException
            MsgBox("Error de lectura de datos")
        End Try

        Try
            'Insertamos en la base de datos cooperativa
            baseUsuarios = "socios_cooperativa"
            sentenciaInsercion = "insert into Usuario values(convert(int,@idUsuario), convert(varchar(15),@password), convert(varchar(64),@nombre), convert(varchar(64),@apellidos))"

            resultadoInsercion = operacionInsercion.ejecucion(baseUsuarios, sentenciaInsercion, resultadoConsulta.Rows(0).Item(0), resultadoConsulta.Rows(0).Item(0), resultadoConsulta.Rows(0).Item(2), resultadoConsulta.Rows(0).Item(3))
        Catch ex As SqlException
            MsgBox("No se ha podido registrar el usuario")
        End Try

        Try
            'Asignamos el rol correspondiente
            sentenciaRol = "insert into Asignacion values(convert(int,@idUsuario), convert(int,@idRol))"
            resultadoRol = operacionConsulta.ejecucion(baseUsuarios, sentenciaRol, resultadoConsulta.Rows(0).Item(0), ddlRol.SelectedValue)
            MsgBox("Rol asignado correctamente")
        Catch ex As SqlException
            MsgBox("No se ha podido asignar el rol correctamente")
        End Try

    End Sub

    Protected Sub btnAsignaOtro_Click(sender As Object, e As EventArgs) Handles btnAsignaOtro.Click
        asignaRol()
    End Sub

End Class
