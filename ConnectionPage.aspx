<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConnectionPage.aspx.cs" Inherits="Exercices_de_revision_WCS_2.ConnectionPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{
            padding:0;
            margin:0;
        }
        header{
            background-color:rgba(0, 153, 255, 0.863);
            padding:10px;
            margin-bottom:20px;
        }
        header .item{
            margin-left:20px;
            text-decoration-style:none;
            color:white;
        }
        .btn{
            background-color:rgba(0, 153, 255, 0.863);
            color:white;
            border:none;
            outline:none;
            padding:5px;
            border-radius:5px;
            transition:.5s;
            padding:10px;
        }
        .btn:hover{
            background-color:rgba(0, 89, 255, 0.863);
        }
        .text{
            outline:none;
            padding:5px;
            border-radius:3px;
            border:1px solid gray;
        }
        table{
            margin-right:10px;
        }
        td{
            padding:10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                        <label>Nom Utilisateur</label>
                    </td>
                    <td>
                        <asp:TextBox CssClass="text" ID="Nom" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Mot De Pass</label>
                    </td>
                    <td>
                        <asp:TextBox CssClass="text" TextMode="Password" ID="MotPass" runat="server" />
                    </td>
                </tr>
                                <tr>
                    <td>
                        <asp:Button CssClass="btn" ID="ConnectionBtn" Text="Connection" runat="server" OnClick="ConnectionBtn_Click" />
                    </td>
                    <td>
                        <asp:Label ID="ErrorMessage" ForeColor="Red" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
