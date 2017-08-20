Imports System.Data
Imports System.Data.SqlClient

Partial Class recursos_maestra_Default
    Inherits System.Web.UI.Page

    Private Sub recursos_maestra_Default_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            tbBuscar.Visible = False
            btnBuscar.Visible = False

            btnEditarSeleccionado.Visible = False
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
            End Select

            gvListadoSocios.DataBind()


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

    'Evento selección gridview
    Protected Sub gvListadoSocios_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvListadoSocios.SelectedIndexChanged
        btnEditarSeleccionado.Visible = True
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

End Class
