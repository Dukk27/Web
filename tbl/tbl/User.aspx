<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="tbl.User" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="refresh" content="5" />
    <title></title>
    <style>
        .welcome-section {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
            z-index: 9999;
            text-align: center;
        }

        .container {
            margin-bottom: 30px; 
            order: 2;
            display: flex;
        
        }

        .group-chat-section {
            margin-top: 10px; 
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <%--<div class="welcome-section">
            <asp:Label ID="welcomeLabel" runat="server"></asp:Label>
        </div>--%>

        <div class="container">
            <div class="group-chat-section">
        <%-- Hiển thị danh sách thành viên ở đây --%>
            </div>
        </div>
    </form>
</body>
</html>