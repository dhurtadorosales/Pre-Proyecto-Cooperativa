<%@ Page Title="" Language="VB" MasterPageFile="~/recursos/maestra/admin_socios.master" AutoEventWireup="false" CodeFile="ficha_socio.aspx.vb" Inherits="recursos_maestra_Default" %>

<asp:Content ID="fichaSocio" ContentPlaceHolderID="bloqueAdminSocios" Runat="Server">
    <h3>Ficha de socio</h3><br />
    <asp:FormView ID="fvSocio" runat="server" DataKeyNames="codSocio" DataSourceID="sqlDtsSocio">
        <ItemTemplate>
            <table>
                <tr>
                    <td>Número de socio:</td> 
                    <td><asp:Label ID="codSocioLabel" runat="server" Text='<%# Eval("codSocio") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td>NIF:</td>
                    <td><asp:Label ID="nifLabel" runat="server" Text='<%# Bind("nif") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td>Nombre:</td> 
                    <td><asp:Label ID="nombreLabel" runat="server" Text='<%# Bind("nombre") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td>Apellidos:</td>
                    <td><asp:Label ID="apellidosLabel" runat="server" Text='<%# Bind("apellidos") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td>Direccion:</td> 
                    <td><asp:Label ID="direccionLabel" runat="server" Text='<%# Bind("direccion") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td>CP:</td> 
                    <td><asp:Label ID="cpLabel" runat="server" Text='<%# Bind("cp") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td>Localidad:</td>
                    <td><asp:Label ID="localidadLabel" runat="server" Text='<%# Bind("localidad") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td>Provincia:</td>
                    <td><asp:Label ID="provinciaLabel" runat="server" Text='<%# Bind("provincia") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td>Teléfono:</td>
                    <td><asp:Label ID="telefonoLabel" runat="server" Text='<%# Bind("telefono") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td>Teléfono Adicional:</td>
                    <td><asp:Label ID="telefonoAdicionalLabel" runat="server" Text='<%# Bind("telefonoAdicional") %>'></asp:Label><</td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td>Fecha Alta:</td>
                    <td><asp:Label ID="fechaAltaLabel" runat="server" Text='<%# Bind("fechaAlta") %>' /></td>
                </tr>    
            </table>
        </ItemTemplate>

    </asp:FormView>

    <asp:SqlDataSource ID="sqlDtsSocio" runat="server" ConnectionString="<%$ ConnectionStrings:cooperativaConnectionString %>" 
        SelectCommand="SELECT [codSocio], [nif], [nombre], [apellidos], [direccion], [cp], [localidad], [provincia], [telefono], [telefonoAdicional], [email], [fechaAlta] FROM [Socio] WHERE ([codSocio] = @codSocio)">
        <SelectParameters>
            <asp:QueryStringParameter Name="codSocio" QueryStringField="codSocio" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

