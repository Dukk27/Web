<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="info.aspx.cs" Inherits="tbl.info" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thông tin người dùng</title>
    <style>
        .userInfo {
            text-align: center; /* Căn giữa nội dung */
        }

        .userInfo strong {
            font-weight: bold; /* Tô đậm */
            font-size: 25px; /* Tăng cỡ chữ */
        }

        .btnBackContainer {
            text-align: center; /* Căn giữa nội dung */
            margin-top: 20px; /* Khoảng cách từ trên xuống */
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:Literal ID="userInfo" runat="server"></asp:Literal>
        </div>
        <div class="btnBackContainer">
            <asp:Button ID="btnBack" runat="server" Text="Quay lại" OnClick="btnBack_Click" />
        </div>
    </form>
</body>
</html>
