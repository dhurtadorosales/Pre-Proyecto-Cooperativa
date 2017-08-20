<%@ Page Title="" Language="VB" MasterPageFile="~/recursos/maestra/admin_socios.master" AutoEventWireup="false" CodeFile="busca_socio.aspx.vb" Inherits="recursos_maestra_Default" Debug="true" %>

<asp:Content ID="buscaSocio" ContentPlaceHolderID="bloqueAdminSocios" Runat="Server">
    <div class="busqueda">
        <h3>Buscar socio</h3><br />
        <asp:Label ID="lblBuscar" runat="server" Text="Buscar por: "></asp:Label>
        <asp:DropDownList ID="ddlBuscar" runat="server" AutoPostBack="true">
            <asp:ListItem>[Elige un campo]</asp:ListItem>
            <asp:ListItem>Número de socio</asp:ListItem>
            <asp:ListItem>Nombre</asp:ListItem>
            <asp:ListItem>Apellidos</asp:ListItem>
        </asp:DropDownList>
        <br />

        <asp:TextBox ID="tbBuscar" runat="server"></asp:TextBox>
        <asp:LinkButton ID="btnBuscar" CssClass="btnSection" runat="server" OnClientClick="nodatos()">Buscar</asp:LinkButton>

        <asp:LinkButton ID="btnEditarSeleccionado" CssClass="btnSection" runat="server">Editar Seleccionado</asp:LinkButton>
        <asp:LinkButton ID="btnAceptar" CssClass="btnSection" runat="server" OnClientClick="confirmaEdicion()">Aceptar</asp:LinkButton>
        <asp:LinkButton ID="btnCancelar" CssClass="btnSection" runat="server">Cancelar</asp:LinkButton>
    </div>
    <br />

    <div class="contenedorGridView" id="contenedorGridView" runat="server">
        <asp:GridView ID="gvListadoSocios" runat="server" AutoGenerateColumns="False" DataKeyNames="codSocio"
            CssClass="fila"
            Width="100%"
            GridLines="Horizontal"
            BackColor="#CCCCCC"
            HeaderStyle-BackColor="CadetBlue"
            HeaderStyle-Font-Bold="true"
            HeaderStyle-Height="50px"
            ForeColor="#555555" 
            RowStyle-BorderColor="SlateGray" 
            SelectedRowStyle-CssClass="filaSeleccionada">
            
            <Columns>
                <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/recursos/imagenes/ck_off.gif" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Label ID="lblCodSocio" runat="server" Text='<%#Eval("codSocio")%>'></asp:Label>
                    </ItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='NUM SOCIO'></asp:Label>
                    </HeaderTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="lblCodSocio" runat="server" Text='<%#Eval("codSocio")%>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink  ID="btnSocio" CssClass="btnSection" runat="server" ToolTip="Ir a la ficha personal del socio"  NavigateUrl='<%# String.Format("ficha_socio.aspx?codsocio={0}", Eval("codSocio"))  %>' > <%#Eval("apellidos") & ", " & Eval("nombre")%></asp:HyperLink>
                    </ItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='SOCIO'></asp:Label>
                    </HeaderTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%#Eval("nombre")%>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Label ID="lblDireccion" runat="server" Text='<%#Eval("direccion")%>'></asp:Label>
                    </ItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblDireccion" runat="server" Text='DIRECCION'></asp:Label>
                    </HeaderTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbDireccion" runat="server" Text='<%# Bind("direccion") %>' />
                        <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="tbDireccion" ErrorMessage="No has escrito ningún valor" cssClass="validator"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Label ID="lblCp" runat="server" Text='<%#Eval("cp")%>'></asp:Label>
                    </ItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblCp" runat="server" Text='CP'></asp:Label>
                    </HeaderTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbCp" runat="server" Text='<%# Bind("cp") %>' />
                        <asp:RequiredFieldValidator ID="rfvCp" runat="server" ControlToValidate="tbCp" ErrorMessage="No has escrito ningún valor" cssClass="validator"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="reCp" runat="server" ControlToValidate="tbCp" ErrorMessage="El código postal no tiene el formato correcto" ValidationExpression="^([1-9]{2}|[0-9][1-9]|[1-9][0-9])[0-9]{3}$" cssClass="validator"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Label ID="lblLocalidad" runat="server" Text='<%#Eval("localidad")%>'></asp:Label>
                    </ItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblLocalidad" runat="server" Text='LOCALIDAD'></asp:Label>
                    </HeaderTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbLocalidad" runat="server" Text='<%# Bind("localidad") %>' />
                        <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ControlToValidate="tbLocalidad" ErrorMessage="No has escrito ningún valor" cssClass="validator"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Label ID="lblProvincia" runat="server" Text='<%#Eval("provincia")%>'></asp:Label>
                    </ItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblProvincia" runat="server" Text='PROVINCIA'></asp:Label>
                    </HeaderTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbProvincia" runat="server" Text='<%# Bind("provincia") %>' />
                        <asp:RequiredFieldValidator ID="rfvProvincia" runat="server" ControlToValidate="tbProvincia" ErrorMessage="No has escrito ningún valor" cssClass="validator"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Label ID="lblTelefono" runat="server" Text='<%#Eval("telefono")%>'></asp:Label>
                    </ItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblTelefono" runat="server" Text='TELÉFONO'></asp:Label>
                    </HeaderTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbTelefono" runat="server" Text='<%# Bind("telefono") %>' />
                        <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="tbTelefono" ErrorMessage="No has escrito ningún valor" cssClass="validator"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="reTelefono" runat="server" ControlToValidate="tbTelefono" ErrorMessage="El teléfono no tiene el formato correcto" ValidationExpression="^[9|6|7][0-9]{8}$" cssClass="validator"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Label ID="lblTelAd" runat="server" Text='<%#Eval("telefonoAdicional")%>'></asp:Label>
                    </ItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblTelAd" runat="server" Text='TELEFONO 2'></asp:Label>
                    </HeaderTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbTelAd" runat="server" Text='<%# Bind("telefonoAdicional") %>' />
                        <asp:RegularExpressionValidator ID="reTelAd" runat="server" ControlToValidate="tbTelAd" ErrorMessage="El teléfono no tiene el formato correcto" ValidationExpression="^[9|6|7][0-9]{8}$" cssClass="validator"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("email")%>'></asp:Label>
                    </ItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='EMAIL'></asp:Label>
                    </HeaderTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbEmail" runat="server" Text='<%# Bind("email") %>' />
                        <asp:RegularExpressionValidator ID="reEmail" runat="server" ControlToValidate="tbEmail" ErrorMessage="El email no tiene el formato correcto" ValidationExpression="^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$" cssClass="validator"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Label ID="lblFechaAlta" runat="server" Text='<%# String.Format("{0:d}", Eval("fechaAlta")) %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblFechaAlta" runat="server" Text='FECHA ALTA'></asp:Label>
                    </HeaderTemplate>
                        <EditItemTemplate>
                        <asp:Label ID="lblFechaAlta" runat="server" Text='<%# String.Format("{0:d}", Eval("fechaAlta")) %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </div>

    <asp:SqlDataSource ID="sqlDtsCodSocio" runat="server" ConnectionString="<%$ ConnectionStrings:cooperativaConnectionString %>" 
        SelectCommand="SELECT [codSocio], [nif], [nombre], [apellidos], [direccion], [cp], [localidad], [provincia], [telefono], [telefonoAdicional], [email], [fechaAlta] FROM [Socio] WHERE (([estado]=1) AND ([codSocio] = @codSocio))"
        UpdateCommand="UPDATE [Socio] SET [direccion] = @direccion, [cp] = @cp, [localidad] = @localidad, [provincia] = @provincia, [telefono] = @telefono, [telefonoAdicional] =  @telefonoAdicional, [email] = @email WHERE [codSocio] = @codSocio">

        <UpdateParameters>
            <asp:Parameter Name="direccion" Type="String" />
            <asp:Parameter Name="localidad" Type= "String" />
            <asp:Parameter Name="provincia" Type="String" />
            <asp:Parameter Name="telefono" Type="Int32" />
            <asp:Parameter Name="telefonoAdicional" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="codSocio" Type="Int32" />
        </UpdateParameters>
        
        <SelectParameters>
            <asp:ControlParameter ControlID="tbBuscar" Name="codSocio" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sqlDtsNombre" runat="server" ConnectionString="<%$ ConnectionStrings:cooperativaConnectionString %>" 
        SelectCommand="SELECT [codSocio], [nif], [nombre], [apellidos], [direccion], [cp], [localidad], [provincia], [telefono], [telefonoAdicional], [email], [fechaAlta] FROM [Socio] WHERE (([estado]=1) AND ([nombre] = @nombre))"
        UpdateCommand="UPDATE [Socio] SET [direccion] = @direccion, [cp] = @cp, [localidad] = @localidad, [provincia] = @provincia, [telefono] = @telefono, [telefonoAdicional] =  @telefonoAdicional, [email] = @email WHERE [codSocio] = @codSocio">

        <UpdateParameters>
            <asp:Parameter Name="direccion" Type="String" />
            <asp:Parameter Name="localidad" Type= "String" />
            <asp:Parameter Name="provincia" Type="String" />
            <asp:Parameter Name="telefono" Type="Int32" />
            <asp:Parameter Name="telefonoAdicional" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="codSocio" Type="Int32" />
        </UpdateParameters>
        
        <SelectParameters>
            <asp:ControlParameter ControlID="tbBuscar" Name="nombre" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sqlDtsApellidos" runat="server" ConnectionString="<%$ ConnectionStrings:cooperativaConnectionString %>" 
        SelectCommand="SELECT [codSocio], [nif], [nombre], [apellidos], [direccion], [cp], [localidad], [provincia], [telefono], [telefonoAdicional], [email], [fechaAlta] FROM [Socio] WHERE (([estado]=1) AND ([apellidos] = @apellidos))"
        UpdateCommand="UPDATE [Socio] SET [direccion] = @direccion, [cp] = @cp, [localidad] = @localidad, [provincia] = @provincia, [telefono] = @telefono, [telefonoAdicional] =  @telefonoAdicional, [email] = @email WHERE [codSocio] = @codSocio">

        <UpdateParameters>
            <asp:Parameter Name="direccion" Type="String" />
            <asp:Parameter Name="localidad" Type= "String" />
            <asp:Parameter Name="provincia" Type="String" />
            <asp:Parameter Name="telefono" Type="Int32" />
            <asp:Parameter Name="telefonoAdicional" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="codSocio" Type="Int32" />
        </UpdateParameters>
        
        <SelectParameters>
            <asp:ControlParameter ControlID="tbBuscar" Name="apellidos" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

