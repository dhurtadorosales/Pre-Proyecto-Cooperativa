<%@ Page Title="" Language="VB" MasterPageFile="~/recursos/maestra/socio.master" AutoEventWireup="false" CodeFile="cambia_pass.aspx.vb" Inherits="recursos_maestra_Default2" %>

<asp:Content ID="contenidoListadoParcelas" ContentPlaceHolderID="bloqueSocios" Runat="Server">
    <h1>Cambio de contraseña</h1>

    <asp:Label ID="lblActual" runat="server" Text="Introduce la contraseña actual" />
    <asp:TextBox ID="tbActual" runat="server" TextMode="Password" />
    <asp:RequiredFieldValidator ID="rfvActual" runat="server" ControlToValidate="tbActual" ErrorMessage="No has escrito ningún valor" cssClass="validator"></asp:RequiredFieldValidator>
    <asp:CustomValidator ID="cvPass" runat="server" Dysplay="Dynamic" ErrorMessage="La contraseña es incorrecta" cssClass="validator" OnServerValidate="validaPass" />
    <br />
                        

    <asp:Label ID="lblNueva" runat="server" Text="Introduce la nueva contraseña" />
    <asp:TextBox ID="tbNueva" runat="server" TextMode="Password" />
    <asp:RequiredFieldValidator ID="rfvNueva" runat="server" ControlToValidate="tbNueva" ErrorMessage="No has escrito ningún valor" cssClass="validator"></asp:RequiredFieldValidator>
    <br />

    <asp:Label ID="lblRepite" runat="server" Text="Vuelve a introducir la nueva contraseña" />
    <asp:TextBox ID="tbRepite" runat="server" TextMode="Password" /><br />  
    <asp:RequiredFieldValidator ID="rfvRepite" runat="server" ControlToValidate="tbRepite" ErrorMessage="No has escrito ningún valor" cssClass="validator"></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="cvNueva" runat="server" ControlToCompare="tbRepite" ControlToValidate="tbNueva" ErrorMessage="La contraseña y su confirmación no coinciden" EnableTheming="false"></asp:CompareValidator>
    <br />          

    <%--<asp:LinkButton ID="btnCambiar" runat="server" Text="Cambia contraseña" CommandName="Update" CssClass="btnSection" OnClientClick="confirmaPass()" CausesValidation="true" />--%>
    <asp:LinkButton ID="btnCambiar" runat="server" Text="Cambia contraseña" CssClass="btnSection" OnClientClick="confirmaPass()" />


</asp:Content>
