
Partial Class recursos_maestra_Default
    Inherits System.Web.UI.Page

    Private Sub recursos_maestra_Default_Load(sender As Object, e As EventArgs) Handles Me.Load
        btnEditarSeleccionado.Visible = False
        btnAceptar.Visible = False
        btnCancelar.Visible = False
    End Sub

    'Evento selección gridview
    Protected Sub gvListadoSocios_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvListadoSocios.SelectedIndexChanged
        btnEditarSeleccionado.Visible = True
        Dim IBseleccionado = CType(gvListadoSocios.SelectedRow.Cells(0).Controls(0), ImageButton)
        ' Si está seleccionado. se anula la selección
        If IBseleccionado.ImageUrl = "~/recursos/imagenes/ck_on.gif" Then
            IBseleccionado.ImageUrl = "~/recursos/imagenes/ck_off.gif"
            gvListadoSocios.SelectedIndex = -1
            btnEditarSeleccionado.Visible = False
        Else
            ' Limpiar seleccionado
            For Each fila As GridViewRow In gvListadoSocios.Rows
                fila.BackColor = Nothing
                CType(fila.Cells(0).Controls(0), ImageButton).ImageUrl = "~/recursos/imagenes/ck_off.gif"

            Next
            CType(gvListadoSocios.SelectedRow.Cells(0).Controls(0), ImageButton).ImageUrl = "~/recursos/imagenes/ck_on.gif"
        End If
    End Sub

    'Evento click boton editar
    Protected Sub btnEditarSeleccionado_Click(sender As Object, e As EventArgs) Handles btnEditarSeleccionado.Click
        btnEditarSeleccionado.Visible = False
        btnAceptar.Visible = True
        btnCancelar.Visible = True
        gvListadoSocios.SetEditRow(gvListadoSocios.SelectedIndex)

    End Sub

    'Evento click botón cancelar
    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        gvListadoSocios.SetEditRow(-1)
        gvListadoSocios.SelectedIndex = -1
        btnAceptar.Visible = False
        btnCancelar.Visible = False
        btnEditarSeleccionado.Visible = False
    End Sub

    'Evento click botón aceptar
    Protected Sub btnAceptar_Click(sender As Object, e As EventArgs) Handles btnAceptar.Click
        gvListadoSocios.UpdateRow(gvListadoSocios.SelectedIndex, False)
        gvListadoSocios.SelectedIndex = -1
        btnEditarSeleccionado.Visible = False
        btnAceptar.Visible = False
        btnCancelar.Visible = False
    End Sub

    'Evento dropdownlist ordenar
    Protected Sub ddlOrdenar_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlOrdenar.SelectedIndexChanged
        Dim ordenaNumero = "SELECT [codSocio], [nif], [nombre], [apellidos], [direccion], [cp], [localidad], [provincia], [telefono], [telefonoAdicional], [email],[fechaAlta] FROM [Socio] WHERE [estado]=1 ORDER BY [codSocio]"
        Dim ordenaNombre = "SELECT [codSocio], [nif], [nombre], [apellidos], [direccion], [cp], [localidad], [provincia], [telefono], [telefonoAdicional], [email], [fechaAlta] FROM [Socio] WHERE [estado]=1 ORDER BY [nombre]"
        Dim ordenaApellidos = "SELECT [codSocio], [nif], [nombre], [apellidos], [direccion], [cp], [localidad], [provincia], [telefono], [telefonoAdicional], [email], [fechaAlta] FROM [Socio] WHERE [estado]=1 ORDER BY [apellidos]"
        Dim ordenaFecha = "SELECT [codSocio], [nif], [nombre], [apellidos], [direccion], [cp], [localidad], [provincia], [telefono], [telefonoAdicional], [email], [fechaAlta] FROM [Socio] WHERE [estado]=1 ORDER BY [fechaAlta]"

        If ddlOrdenar.SelectedIndex = 0 Then
            sqlDtsSocios.SelectCommand = ordenaNumero
        End If
        If ddlOrdenar.SelectedIndex = 1 Then
            sqlDtsSocios.SelectCommand = ordenaNombre
        End If
        If ddlOrdenar.SelectedIndex = 2 Then
            sqlDtsSocios.SelectCommand = ordenaApellidos
        End If
        If ddlOrdenar.SelectedIndex = 3 Then
            sqlDtsSocios.SelectCommand = ordenaFecha
        End If

        gvListadoSocios.DataBind()

    End Sub

End Class
