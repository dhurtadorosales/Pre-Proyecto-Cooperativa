<%@ Page Title="" Language="VB" MasterPageFile="~/recursos/maestra/admin_socios.master" AutoEventWireup="false" CodeFile="asigna_rol.aspx.vb" Inherits="recursos_maestra_Default" %>

<asp:Content ID="altaSocio" ContentPlaceHolderID="bloqueAdminSocios" Runat="Server">

 <div id="divRol" runat="server">
        <h3>Asignar Rol</h3><br />
        <asp:DropDownList ID="ddlRol" runat="server" DataSourceID="sqlDtsRol" DataTextField="rol" DataValueField="idRol"></asp:DropDownList><br />

        <asp:SqlDataSource ID="sqlDtsRol" runat="server" ConnectionString="<%$ ConnectionStrings:socios_cooperativaConnectionString2 %>" SelectCommand="SELECT * FROM [Rol]"></asp:SqlDataSource>
    </div>

    <asp:LinkButton ID="btnAsignaRol" runat="server" Text="Asignar rol" CssClass="btnSection" /><br />
    <asp:LinkButton ID="btnAsignaOtro" runat="server" Text="Asignar otro rol" CssClass="btnSection" /><br />
    <asp:LinkButton ID="btnAltaOtro" runat="server" Text="Dar de alta otro socio" CssClass="btnSection" PostBackUrl="~/recursos/paginas/administrador/alta_socio.aspx" />
    <asp:LinkButton ID="btnFinalizar" runat="server" Text="Finalizar" CssClass="btnSection" PostBackUrl="~/recursos/paginas/administrador/default_administrador.aspx" />

</asp:Content>

