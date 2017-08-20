<%@ Page Title="" Language="VB" MasterPageFile="~/recursos/maestra/maestra.master" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="recursos_maestra_Default2" %>

<asp:Content ID="contenidoNavLogin" ContentPlaceHolderID="bloqueNav" Runat="Server">

    <asp:HyperLink ID="hlInicio" runat="server"  NavigateUrl="~/Default.aspx" text="Ir a página principal" ToolTip="Ir a página principal" CssClass="btnNavUsuario" />

</asp:Content>

<asp:Content ID="contenidoLogin" ContentPlaceHolderID="bloquePrincipal" Runat="Server">

    <div class="sectionLogin">
        <div>
            <asp:Label ID="aviso" runat="server" Text="Iniciar sesión para acceder" /><br /><br />
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblNumSocio" runat="server" Text="Número de socio: " />
                    </td>
                    <td>
                        <asp:TextBox ID="tbNumSocio" runat="server" TextMode="Number" />
                        <div>
                            <asp:RequiredFieldValidator ID="rfvNumSocio" runat="server" Display="Static" ControlToValidate="tbNumSocio" ErrorMessage="Debes introducir tu número de socio" cssClass="validator"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblPass" runat="server" Text="Contraseña: " />
                    </td>
                    <td>
                        <asp:TextBox ID="tbPass" runat="server" TextMode="Password" />
                        <div style="padding-top:5px; padding-left:20px; padding-right:20px;text-align :left">
                            <asp:RequiredFieldValidator ID="rfvPassw" runat="server" Display="Dynamic" ControlToValidate="tbPass" ErrorMessage="Debes introducir tu contraseña"  cssClass="validator"/>
                            <asp:CustomValidator ID="cvOk" runat="server" Dysplay="Dynamic" ErrorMessage="Lo sentimos, el nombre del usuario y/o la contraseña no son correctos." cssClass="validator" OnServerValidate="OKusuario" />
                        </div>
                    </td>
                </tr>
            </table>
            <br />
            <asp:linkButton ID="btnContinuar" runat="server" Text="Continuar..." CssClass="btnSection" ToolTip="Continuar" />
            <br />
            <br />
            <asp:CheckBox ID="CKrecordar" runat="server" Checked="false" Text="Recordar en este equipo"/>
        </div>
    </div>
</asp:Content>

