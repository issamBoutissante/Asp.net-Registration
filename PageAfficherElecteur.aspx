<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="PageAfficherElecteur.aspx.cs" Inherits="Exercices_de_revision_WCS_2.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <table>
            <tr>
                <td>
                    <label>Nom Circonscription</label>
                </td>
                <td>
                    <asp:DropDownList CssClass="text" ID="Circonscriptions" runat="server" DataSourceID="SqlDataSource1" DataTextField="nomCir" DataValueField="idCirconscription" OnSelectedIndexChanged="Circonscriptions_SelectedIndexChanged"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MonConnection %>" SelectCommand="SELECT [idCirconscription], [nomCir] FROM [Circonscription]"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <asp:GridView ID="ElecteurGridView" runat="server" ShowHeaderWhenEmpty="true">
        </asp:GridView>
        <asp:Label ID="ErorMessage" runat="server" />
</asp:Content>
