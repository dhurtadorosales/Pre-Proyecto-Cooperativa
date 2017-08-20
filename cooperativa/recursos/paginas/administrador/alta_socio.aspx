<%@ Page Title="" Language="VB" MasterPageFile="~/recursos/maestra/admin_socios.master" AutoEventWireup="false" CodeFile="alta_socio.aspx.vb" Inherits="recursos_maestra_Default" %>

<asp:Content ID="altaSocio" ContentPlaceHolderID="bloqueAdminSocios" Runat="Server">

    <div id="divAltaSocio" runat="server">
        <h3>Nuevo socio</h3><br />
        <asp:FormView ID="fvAltaSocio" runat="server" DataKeyNames="codSocio" DataSourceID="sqlDtsAltaSocio">
            <InsertItemTemplate>
                <table>
                    <tr>
                        <td>Nif:</td>
                        <td>
                            <asp:TextBox ID="nifTextBox" runat="server" Text='<%# Bind("nif") %>' />
                            <asp:RequiredFieldValidator ID="rfvNif" runat="server" ControlToValidate="nifTextBox" ErrorMessage="No has escrito ningún valor" cssClass="validator"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="reNif" runat="server" ControlToValidate="nifTextBox" ErrorMessage="El N.I.F. no tiene el formato correcto" ValidationExpression="(([X-Z]{1})([-]?)(\d{7})([-]?)([A-Z]{1}))|((\d{8})([-]?)([A-Z]{1}))" cssClass="validator"></asp:RegularExpressionValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>Nombre:</td>
                        <td>
                            <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="nombreTextBox" ErrorMessage="No has escrito ningún valor" cssClass="validator"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="reNombre" runat="server" ControlToValidate="nombreTextBox" ErrorMessage="El nombre no tiene el formato correcto (comprueba que empieza con mayúscula)" ValidationExpression="^([A-ZÁÉÍÓÚ]{1}[a-zñáéíóú]+[\s]*)+$" cssClass="validator"></asp:RegularExpressionValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>Apellidos:</td>
                        <td>
                            <asp:TextBox ID="apellidosTextBox" runat="server" Text='<%# Bind("apellidos") %>' />
                            <asp:RequiredFieldValidator ID="rfvApellidos" runat="server" ControlToValidate="apellidosTextBox" ErrorMessage="No has escrito ningún valor" cssClass="validator"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="nombreTextBox" ErrorMessage="Los apellidos no tienen el formato correcto (comprueba que empieza con mayúscula)" ValidationExpression="^([A-ZÁÉÍÓÚ]{1}[a-zñáéíóú]+[\s]*)+$" cssClass="validator"></asp:RegularExpressionValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>Dirección:</td>
                        <td>
                            <asp:TextBox ID="direccionTextBox" runat="server" Text='<%# Bind("direccion") %>' />
                            <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="direccionTextBox" ErrorMessage="No has escrito ningún valor" cssClass="validator"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>CP:</td>
                        <td>
                            <asp:TextBox ID="cpTextBox" runat="server" Text='<%# Bind("cp") %>' />
                            <asp:RequiredFieldValidator ID="rfvCp" runat="server" ControlToValidate="cpTextBox" ErrorMessage="No has escrito ningún valor" cssClass="validator"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="reCp" runat="server" ControlToValidate="cpTextBox" ErrorMessage="El código postal no tiene el formato correcto" ValidationExpression="^([1-9]{2}|[0-9][1-9]|[1-9][0-9])[0-9]{3}$" cssClass="validator"></asp:RegularExpressionValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>Localidad:</td>
                        <td>
                            <asp:TextBox ID="localidadTextBox" runat="server" Text='<%# Bind("localidad") %>' />
                            <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ControlToValidate="localidadTextBox" ErrorMessage="No has escrito ningún valor" cssClass="validator"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="reLocalidad" runat="server" ControlToValidate="localidadTextBox" ErrorMessage="La localidad no tiene el formato correcto (comprueba que empieza con mayúscula)" ValidationExpression="^([A-ZÁÉÍÓÚ]{1}[a-zñáéíóú]+[\s]*)+$" cssClass="validator"></asp:RegularExpressionValidator>
                    </tr>
                
                    <tr>
                        <td>Provincia:</td>
                        <td>
                            <asp:TextBox ID="provinciaTextBox" runat="server" Text='<%# Bind("provincia") %>' />
                            <asp:RequiredFieldValidator ID="rfvProvincia" runat="server" ControlToValidate="provinciaTextBox" ErrorMessage="No has escrito ningún valor" cssClass="validator"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="provinciaTextBox" ErrorMessage="La provincia no tiene el formato correcto (comprueba que empieza con mayúscula)" ValidationExpression="^([A-ZÁÉÍÓÚ]{1}[a-zñáéíóú]+[\s]*)+$" cssClass="validator"></asp:RegularExpressionValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>Teléfono:</td>
                        <td>
                            <asp:TextBox ID="telefonoTextBox" runat="server" Text='<%# Bind("telefono") %>' />
                            <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="telefonoTextBox" ErrorMessage="No has escrito ningún valor" cssClass="validator"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="reTelefono" runat="server" ControlToValidate="telefonoTextBox" ErrorMessage="El teléfono no tiene el formato correcto" ValidationExpression="^[9|6|7][0-9]{8}$" cssClass="validator"></asp:RegularExpressionValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>Telefono adicional:</td>
                        <td>
                            <asp:TextBox ID="telefonoAdicionalTextBox" runat="server" Text='<%# Bind("telefonoAdicional") %>' />
                            <asp:RegularExpressionValidator ID="reAdicional" runat="server" ControlToValidate="telefonoAdicionalTextBox" ErrorMessage="El teléfono no tiene el formato correcto" ValidationExpression="^[9|6|7][0-9]{8}$" cssClass="validator"></asp:RegularExpressionValidator>
                        </td>        
                    </tr>

                    <tr>
                        <td>Email:</td>
                        <td>
                            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                            <asp:RegularExpressionValidator ID="reEmail" runat="server" ControlToValidate="emailTextBox" ErrorMessage="El email no tiene el formato correcto" ValidationExpression="^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$" cssClass="validator"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:LinkButton ID="btnAltaSocio" CssClass="btnSection" runat="server" CausesValidation="False" CommandName="Insert" Text="Dar de alta" ToolTip="Dar de alta" OnClick="btnAltaSocio_Click" />
                &nbsp;&nbsp;<asp:LinkButton ID="btnCancelarAlta" CssClass="btnSection" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" ToolTip="Cancelar" />
            </InsertItemTemplate>
        </asp:FormView>

        <asp:SqlDataSource ID="sqlDtsAltaSocio" runat="server" ConnectionString="<%$ ConnectionStrings:cooperativaConnectionString %>" 
            InsertCommand="INSERT INTO [Socio] ([nif], [nombre], [apellidos], [direccion], [cp], [localidad], [provincia], [telefono], [telefonoAdicional], [email], [fechaAlta], [estado]) VALUES (@nif, @nombre, @apellidos, @direccion, @cp, @localidad, @provincia, @telefono, @telefonoAdicional, @email, SYSDATETIME(), 1)">   
            <InsertParameters>
                <asp:Parameter Name="nif" Type="String" />
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="apellidos" Type="String" />
                <asp:Parameter Name="direccion" Type="String" />
                <asp:Parameter Name="cp" Type="String" />
                <asp:Parameter Name="localidad" Type="String" />
                <asp:Parameter Name="provincia" Type="String" />
                <asp:Parameter Name="telefono" Type="String" />
                <asp:Parameter Name="telefonoAdicional" Type="String" />
                <asp:Parameter Name="email" Type="String" />
            </InsertParameters>

        </asp:SqlDataSource>  
    </div>

    <div id="divRol" runat="server">
        <h3>Asignar Rol</h3><br />
        <asp:DropDownList ID="ddlRol" runat="server" DataSourceID="sqlDtsRol" DataTextField="rol" DataValueField="idRol"></asp:DropDownList><br />

        <asp:SqlDataSource ID="sqlDtsRol" runat="server" ConnectionString="<%$ ConnectionStrings:socios_cooperativaConnectionString2 %>" SelectCommand="SELECT * FROM [Rol]"></asp:SqlDataSource>
    </div>

    <asp:LinkButton ID="btnAsignaRol" runat="server" Text="Asignar rol" CssClass="btnSection" CausesValidation="false" /><br />
    <asp:LinkButton ID="btnAsignaOtro" runat="server" Text="Asignar otro rol" CssClass="btnSection" CausesValidation="false" /><br />
    <asp:LinkButton ID="btnAltaOtro" runat="server" Text="Dar de alta otro socio" CssClass="btnSection" PostBackUrl="~/recursos/paginas/administrador/alta_socio.aspx" CausesValidation="false" />
    <asp:LinkButton ID="btnFinalizar" runat="server" Text="Finalizar" CssClass="btnSection" PostBackUrl="~/recursos/paginas/administrador/default_administrador.aspx" CausesValidation="false" />

</asp:Content>

