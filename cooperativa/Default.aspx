<%@ Page Title="" Language="VB" MasterPageFile="~/recursos/maestra/maestra.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="recursos_maestra_Default" %>

<asp:Content ID="contenidoNavDefault" ContentPlaceHolderID="bloqueNav" Runat="Server">

    <asp:LinkButton ID="btnLogin" runat="server" Text="Conexión socios" ToolTip="Autenticación" CssClass="btnNavUsuario" PostBackUrl="login.aspx"></asp:LinkButton>

</asp:Content>

<asp:Content ID="contendidoBloquePrincipal" ContentPlaceHolderID="bloquePrincipal" Runat="Server">

    <aside>
        <asp:Image ID="imgPresentacion" runat="server" ImageUrl="~/recursos/imagenes/presentacion.jpg" AlternateText="imagen presentacion" />
    </aside>

    <section></section>
    
</asp:Content>

