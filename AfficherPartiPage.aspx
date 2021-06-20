<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="AfficherPartiPage.aspx.cs" Inherits="Exercices_de_revision_WCS_2.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="PartiGridView" runat="server">
    </asp:GridView>
    <label>Nombre Total Des Condidats : </label>
    <asp:Label ID="NombreTotal" runat="server"></asp:Label>
    <br />
    <asp:Label ID="ErrorMessage" ForeColor="Red" runat="server" />
</asp:Content>
