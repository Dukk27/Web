<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Doimatkhau.aspx.cs" Inherits="tbl.Doimatkhau" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đổi mật khẩu</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="css/StyleSheet.css" />
    <link rel="stylesheet" href="css/DangKy.css" />
    <style>
        #error {
            color: red;
        }

        .dk > a {
            padding: 6px;
            background: black;
            color: white;
            text-decoration: none;
        }

        .dk > input {
            margin-top: 20px;
            height: 30px;
            background: black;
            color: white;
            border: none;
            padding: 0px 5px 0px;
            margin-left: 222px;
        }
    </style>
    <script>
        function checkinfordoi() {
            var pas = document.getElementById("Pass").value;
            var comfirm = document.getElementById("ComfirmPass").value;
            var error = document.getElementById("error");
            if (pas === "" || comfirm === "") {
                error.innerHTML = "Không được để trống";
                return false;
            }
            if (pas != comfirm) {
                error.innerHTML = "*2 Mật khẩu không khớp nhau";
                return false;
            }
        }
    </script>
</head>
<body>
    <div id="container">
        <div id="header-container">
            <div id="logo-navigation-container">
                <div id="usernamelogout" runat="server">
                    <a href="#" runat="server" id="username">User name</a>
                    <a href="~/Dangxuat.aspx" runat="server">Đăng xuất</a>
                </div>
                <div id="loginregister" runat="server">
                    <a href="~/Dangnhap.aspx" runat="server">Đăng nhập</a>
                    <a href="~/Dangki.aspx" runat="server">Đăng ký</a>
                </div>
            </div>
        </div>


        <div id="body">
            <form id="formTaoTaiKhoan" method="post" runat="server" onsubmit="return checkinfordoi();">
                <div class="khungBao">
                    <h2>Thay đổi mật khẩu</h2>
                    <div class="nhapInfor">
                        <input type="password" value="" class="iptInfor" runat="server" name="Pass" id="Pass" placeholder="Mật khẩu" />
                        <input type="password" value="" class="iptInfor" name="ComfirmPass" id="ComfirmPass" placeholder="Mật khẩu xác nhận" />
                        <div class="errorText" id="error" runat="server"></div>


                    </div>
                    <div class="dk">
                        <a href="Xacminhthongtin.aspx">Quay lại</a>
                        <input type="submit" value="Xác nhận" />
                    </div>
                </div>
            </form>
        </div>

</body>
</html>
