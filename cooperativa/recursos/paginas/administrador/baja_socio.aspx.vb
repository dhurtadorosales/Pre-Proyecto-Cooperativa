
Partial Class recursos_maestra_Default
    Inherits System.Web.UI.Page

    Private Sub recursos_maestra_Default_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            tbBuscar.Visible = False
            btnBuscar.Visible = False

            btnEliminarSeleccionado.Visible = False
            btnAceptar.Visible = False
            btnCancelar.Visible = False

            contenedorGridView.Visible = False
            gvListadoSocios.Visible = False
        End If
    End Sub

    'Evento ddl buscar
    Protected Sub ddlBuscar_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlBuscar.SelectedIndexChanged
        tbBuscar.Visible = True
        btnBuscar.Visible = True
    End Sub

    'Evento botón buscar
    Protected Sub btnBuscar_Click(sender As Object, e As EventArgs) Handles btnBuscar.Click
        If String.IsNullOrWhiteSpace(tbBuscar.Text) Then
            contenedorGridView.Visible = False
            gvListadoSocios.Visible = False
        Else
            contenedorGridView.Visible = True
            gvListadoSocios.Visible = True

            Select Case ddlBuscar.SelectedIndex
                Case 1
                    gvListadoSocios.DataSourceID = "sqlDtsCodSocio"
                Case 2
                    gvListadoSocios.DataSourceID = "sqlDtsNombre"
                Case 3
                    gvListadoSocios.DataSourceID = "sqlDtsApellidos"
                Case 4
                    gvListadoSocios.DataSourceID = "sqlDtsFecha"
            End Select

            gvListadoSocios.DataBind()


        End If
    End Sub

    'Evento click boton eliminar
    Protected Sub btnEliminarSeleccionado_Click(sender As Object, e As EventArgs) Handles btnEliminarSeleccionado.Click
        btnEliminarSeleccionado.Visible = False
        btnAceptar.Visible = True
        btnCancelar.Visible = True
        'gvListadoSocios.SetEditRow(gvListadoSocios.SelectedIndex)
    End Sub

    'Evento click botón cancelar
    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        gvListadoSocios.SetEditRow(-1)
        gvListadoSocios.SelectedIndex = -1
        btnAceptar.Visible = False
        btnCancelar.Visible = False
        btnEliminarSeleccionado.Visible = False
    End Sub

    'Evento click botón aceptar
    Protected Sub btnAceptar_Click(sender As Object, e As EventArgs) Handles btnAceptar.Click
        gvListadoSocios.UpdateRow(gvListadoSocios.SelectedIndex, False)
        'gvListadoSocios.SetEditRow(gvListadoSocios.SelectedIndex)
        gvListadoSocios.SelectedIndex = -1
        btnAceptar.Visible = False
        btnCancelar.Visible = False
    End Sub

    'Evento selección gridview
    Protected Sub gvListadoSocios_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvListadoSocios.SelectedIndexChanged
        btnEliminarSeleccionado.Visible = True
        Dim IBseleccionado = CType(gvListadoSocios.SelectedRow.Cells(0).Controls(0), ImageButton)
        ' Si está seleccionado. se anula la selección
        If IBseleccionado.ImageUrl = "~/recursos/imagenes/ck_on.gif" Then
            IBseleccionado.ImageUrl = "~/recursos/imagenes/ck_off.gif"
            gvListadoSocios.SelectedIndex = -1
        Else
            ' Limpiar seleccionado
            For Each fila As GridViewRow In gvListadoSocios.Rows
                fila.BackColor = Nothing
                CType(fila.Cells(0).Controls(0), ImageButton).ImageUrl = "~/recursos/imagenes/ck_off.gif"
            Next
            CType(gvListadoSocios.SelectedRow.Cells(0).Controls(0), ImageButton).ImageUrl = "~/recursos/imagenes/ck_on.gif"
        End If
    End Sub

    'Public Sub asignaRol()
    '    Dim baseCooperativa As String
    '    Dim baseUsuarios As String
    '    Dim sentenciaConsulta As String
    '    Dim sentenciaInsercion As String
    '    Dim sentenciaRol As String
    '    Dim resultadoConsulta As DataTable
    '    Dim resultadoInsercion As Integer
    '    Dim resultadoRol As Integer
    '    Dim operacionConsulta As New Operaciones
    '    Dim operacionInsercion As New Operaciones

    '    Try
    '        'Consultamos el registro insertado en la base de datos cooperativa (el último registro)
    '        baseCooperativa = "cooperativa"
    '        sentenciaConsulta = "select * from Socio where codSocio= (select max(codSocio) from Socio)"
    '        resultadoConsulta = operacionConsulta.consulta(baseCooperativa, sentenciaConsulta)
    '    Catch ex As SqlException
    '        MsgBox("Error de lectura de datos")
    '    End Try

    '    Try
    '        'Insertamos en la base de datos cooperativa
    '        baseUsuarios = "socios_cooperativa"
    '        sentenciaInsercion = "insert into Usuario values(convert(int,@idUsuario), convert(varchar(15),@password), convert(varchar(64),@nombre), convert(varchar(64),@apellidos))"

    '        resultadoInsercion = operacionInsercion.ejecucion(baseUsuarios, sentenciaInsercion, resultadoConsulta.Rows(0).Item(0), resultadoConsulta.Rows(0).Item(0), resultadoConsulta.Rows(0).Item(2), resultadoConsulta.Rows(0).Item(3))
    '    Catch ex As SqlException
    '        MsgBox("No se ha podido registrar el usuario")
    '    End Try

    '    Try
    '        'Asignamos el rol correspondiente
    '        sentenciaRol = "insert into Asignacion values(convert(int,@idUsuario), convert(int,@idRol))"
    '        resultadoRol = operacionConsulta.ejecucion(baseUsuarios, sentenciaRol, resultadoConsulta.Rows(0).Item(0), ddlRol.SelectedValue)
    '        MsgBox("Rol asignado correctamente")
    '    Catch ex As SqlException
    '        MsgBox("No se ha podido asignar el rol correctamente")
    '    End Try

    'End Sub

End Class
