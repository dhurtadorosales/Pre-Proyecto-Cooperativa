<%@ Page Title="" Language="VB" MasterPageFile="~/recursos/maestra/maestra.master" AutoEventWireup="false" CodeFile="roles.aspx.vb" Inherits="recursos_maestra_Default2" %>

<asp:Content ID="contenidoNavRoles" ContentPlaceHolderID="bloqueNav" Runat="Server">

    <asp:HyperLink ID="hlInicio" runat="server"  NavigateUrl="~/Default.aspx" text="Ir a página principal" ToolTip="Ir a página principal" CssClass="btnNavUsuario" />

</asp:Content>

<asp:Content ID="contenidoLogin" ContentPlaceHolderID="bloquePrincipal" Runat="Server">

    <div class="sectionLogin">
        <div>
            <asp:Label ID="aviso" runat="server" Text="Iniciar sesión para acceder" /><br /><br />
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblRol" runat="server" Text="Accede como: " />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlRol" runat="server" >
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <br />
            <asp:linkButton ID="btnIniciar" runat="server" Text="Iniciar sesión" CssClass="btnSection" ToolTip="Iniciar sesión"/>
            <br />
            <br />
            <asp:CheckBox ID="CKcontinuar" runat="server" Checked="true"  Text="Continuar con la misma cuenta"/>
        </div>
    </div>
</asp:Content>

