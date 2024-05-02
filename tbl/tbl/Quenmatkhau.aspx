<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Quenmatkhau.aspx.cs" Inherits="tbl.Quenmakhau" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quên mật khẩu</title>
    <link rel="stylesheet" href="css/StyleSheet.css" />
    <link rel="stylesheet" href="css/DangNhap.css" />
    <style>
        .Next{
            margin-top: 20px;
            margin-left: 80%;
            padding: 5px;
            height: 30px;
            background: black;
            color: white;
            border: none;
        }
    </style>
</head>
<body>
    <div id="container">
        <div id="header-container">
            <div id="logo-navigation-container">
                <div id="usernamelogout" runat="server">
                    <a href="#" runat="server">User name</a>
                    <a href="~/Index.aspx" runat="server">Đăng xuất</a>
                </div>
                <div id="loginregister">
                    <a href="Dangnhap.aspx">Đăng nhập</a>
                    <a href="Dangki.aspx" style="display: none;">Đăng ký</a>
                </div>
            </div>
        </div>

        <div id="body">
            <form id="formdangnhap" runat="server" method="post" onsubmit="return CheckQuen();">
                <div class="KhungBao">
                    <h2>Tìm email của bạn</h2>
                    <div class="nhapInfor" >
                        <input type="text" name="email" placeholder="Email" class="iptInfor" runat="server" id="dnEmail" />
                        <div class="errorText" id="error_email" runat="server" ></div>
                    </div> 
                    <div class="dk">
                        <input type="submit" class="Next" name="Next" value="Tiếp theo"/>
                    </div>
                   
                </div>
            </form>
       </div>
    </div>
<script>
    function CheckQuen() {
        var email = document.getElementById("dnEmail").value;
        var erEmail = document.getElementById("error_email");
        if (email === "") {
            erEmail.style.color = 'red';
            erEmail.innerHTML = "* Email không được để trống";
            return false;
        }
        if (email.lastIndexOf("@gmail.com") === -1) {
            erEmail.style.color = 'red';
            erEmail.innerHTML = "* Email phải có @gmail.com";
            return false;
        }    
    }
</script>
</body>
</html>
