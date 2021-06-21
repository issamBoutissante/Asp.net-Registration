<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="PageExporterXML.aspx.cs" Inherits="Exercices_de_revision_WCS_2.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                 <label>Circonscription</label>
            </td>
            <td>
                <asp:DropDownList ID="Circonscripitons" runat="server" DataSourceID="SqlDataSource1" DataTextField="nomCir" DataValueField="idCirconscription" />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MonConnection %>" SelectCommand="SELECT [nomCir], [idCirconscription] FROM [Circonscription]"></asp:SqlDataSource>
            </td>
        </tr>
         <tr>
            <td>
                 <asp:Button ID="GenererXML" Text="Generer XML" runat="server" OnClick="GenererXML_Click"></asp:Button>
            </td>
            <td>
                 <asp:Label ID="Message" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
