﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="PageGestionElecteur.aspx.cs" Inherits="Exercices_de_revision_WCS_2.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CINCandidat" DataSourceID="SqlDataSource1" AutoGenerateEditButton="true" AutoGenerateDeleteButton="true">
        <Columns>
            <asp:BoundField DataField="CINCandidat" HeaderText="CINCandidat" ReadOnly="True" SortExpression="CINCandidat" />
            <asp:BoundField DataField="nomCandidat" HeaderText="nomCandidat" SortExpression="nomCandidat" />
            <asp:BoundField DataField="prenomCandidat" HeaderText="prenomCandidat" SortExpression="prenomCandidat" />
            <asp:BoundField DataField="dateNC" HeaderText="dateNC" SortExpression="dateNC" />
            <asp:BoundField DataField="niveauScolaire" HeaderText="niveauScolaire" SortExpression="niveauScolaire" />
            <asp:BoundField DataField="NumOrdreListe" HeaderText="NumOrdreListe" SortExpression="NumOrdreListe" />
            <asp:BoundField DataField="adrCandidat" HeaderText="adrCandidat" SortExpression="adrCandidat" />
            <asp:BoundField DataField="idCirconscription" HeaderText="idCirconscription" SortExpression="idCirconscription" />
            <asp:BoundField DataField="idParti" HeaderText="idParti" SortExpression="idParti" />
            <asp:BoundField DataField="idTrancheAge" HeaderText="idTrancheAge" SortExpression="idTrancheAge" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MonConnection %>" 
        SelectCommand="SELECT * FROM [Candidat]"
        UpdateCommand="update [Candidat] 
        set nomCandidat=@nomCandidat,
        prenomCandidat=@prenomCandidat,
        dateNC=@DateNC,
        niveauScolaire=@niveauScolaire,
        NumOrdreListe=@NumOrdreListe,
        adrCandidat=@adrCandidat,
        idCirconscription=@idCirconscription,
        idParti=@idParti,
        idTrancheAge=@idTrancheAge 
        where CINCandidat=@CINCandidat"
        DeleteCommand="delete from [Candidat] 
        where CINCandidat=@CINCandidat"></asp:SqlDataSource>
<table>
    <tr>
        <td>
            <label>CIN</label>
        </td>
        <td>
            <asp:TextBox ID="CIN" runat="server" />
            <asp:RequiredFieldValidator runat="server" Text="*" ErrorMessage="*" ForeColor="Red" ControlToValidate="CIN" ValidationGroup="AjouGroup"/>
        </td>
    </tr>
    <tr>
        <td>
            <label>Nom</label>
        </td>
        <td>
            <asp:TextBox ID="Nom" runat="server" />
            <asp:RequiredFieldValidator runat="server" Text="*" ErrorMessage="*" ForeColor="Red" ControlToValidate="Nom" ValidationGroup="AjouGroup"/>
        </td>
    </tr>
    <tr>
        <td>
            <label>Prenom</label>
        </td>
        <td>
            <asp:TextBox ID="Prenom" runat="server" />
            <asp:RequiredFieldValidator runat="server" Text="*" ErrorMessage="*" ForeColor="Red" ControlToValidate="Prenom" ValidationGroup="AjouGroup"/>
        </td>
    </tr>
    <tr>
        <td>
            <label>Date Naissance</label>
        </td>
        <td>
            <asp:TextBox ID="DateNaissance" runat="server" />
            <asp:RequiredFieldValidator runat="server" Text="*" ErrorMessage="*" ForeColor="Red" ControlToValidate="DateNaissance" ValidationGroup="AjouGroup"/>
        </td>
    </tr>
    <tr>
        <td>
            <label>Niveau Scolaire</label>
        </td>
        <td>
            <asp:TextBox ID="NiveauScolaire" runat="server" />
            <asp:RequiredFieldValidator runat="server" Text="*" ErrorMessage="*" ForeColor="Red" ControlToValidate="NiveauScolaire" ValidationGroup="AjouGroup"/>
        </td>
    </tr>
    <tr>
        <td>
            <label>Numero Ordre</label>
        </td>
        <td>
            <asp:TextBox ID="NumeroOrdreListe" runat="server" />
            <asp:RequiredFieldValidator runat="server" Text="*" ErrorMessage="*" ForeColor="Red" ControlToValidate="NumeroOrdreListe" ValidationGroup="AjouGroup"/>
        </td>
    </tr>
     <tr>
        <td>
            <label>Adresse</label>
        </td>
        <td>
            <asp:TextBox ID="Adresse" runat="server" />
            <asp:RequiredFieldValidator runat="server" Text="*" ErrorMessage="*" ForeColor="Red" ControlToValidate="Adresse" ValidationGroup="AjouGroup"/>
        </td>
    </tr>
    <tr>
        <td>
            <label>Circonscription</label>
        </td>
        <td>
            <asp:DropDownList ID="Circonscriptions" runat="server" DataSourceID="SqlDataSource2" DataTextField="nomCir" DataValueField="idCirconscription"/>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MonConnection %>" SelectCommand="SELECT [idCirconscription], [nomCir] FROM [Circonscription]"></asp:SqlDataSource>
        </td>
    </tr>
     <tr>
        <td>
            <label>Parti</label>
        </td>
        <td>
            <asp:DropDownList ID="Partis" runat="server" DataSourceID="SqlDataSource3" DataTextField="nomParti" DataValueField="idParti"/>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MonConnection %>" SelectCommand="SELECT * FROM [Parti]"></asp:SqlDataSource>
        </td>
    </tr>
     <tr>
        <td>
            <label>Tranche Age</label>
        </td>
        <td>
            <asp:DropDownList ID="TrancheAges" runat="server" DataSourceID="SqlDataSource4" DataTextField="tranche" DataValueField="idTranche"/>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:MonConnection %>" SelectCommand="SELECT * FROM [TrancheAge]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button runat="server" ID="Ajouter" Text="Ajouter" OnClick="Ajouter_Click" ValidationGroup="AjouGroup"/>
        </td>
        <td>
            <asp:Label runat="server" ID="Message" />
        </td>
    </tr>
</table>
</asp:Content>