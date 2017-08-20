<%@ Page Title="" Language="VB" MasterPageFile="~/recursos/maestra/admin_socios.master" AutoEventWireup="false" CodeFile="default_administrador.aspx.vb" Inherits="recursos_maestra_Default" %>

<asp:Content ID="contenidoNavAdministrador" ContentPlaceHolderID="navAdministrador" Runat="Server">
    <nav>
        <ul>
            <asp:LinkButton ID="btnQuienes" runat="server" CssClass="btnNav">Quiénes somos</asp:LinkButton>
            <asp:LinkButton ID="btnServicios" runat="server" CssClass="btnNav">Servicios</asp:LinkButton>
            <asp:LinkButton ID="btnProductos" runat="server" CssClass="btnNav">Nuestros productos</asp:LinkButton>
            <asp:LinkButton ID="btnVenta" runat="server" CssClass="btnNav">Venta online</asp:LinkButton>
            <asp:LinkButton ID="btnContacto" runat="server" CssClass="btnNav">Contacto</asp:LinkButton>
        </ul>
    </nav>
</asp:Content>

<asp:Content ID="contendidoBloquePrincipal" ContentPlaceHolderID="bloqueAdminSocios" Runat="Server">

        <asp:Image ID="imgPresentacion" runat="server" ImageUrl="~/recursos/imagenes/presentacion.jpg" AlternateText="imagen presentacion" CssClass="imgDefault" />

</asp:Content>

