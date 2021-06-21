<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="AfficherPartiPage.aspx.cs" Inherits="Exercices_de_revision_WCS_2.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="PartiGridView" runat="server">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="checkbox" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <label>Nombre Total Des Condidats : </label>
    <asp:Label ID="NombreTotal" runat="server"></asp:Label>
    <br />
    <asp:Label ID="ErrorMessage" ForeColor="Red" runat="server" />
    <asp:Button Text="Generer" ID="Generer" runat="server" OnClick="Generer_Click" />
</asp:Content>
