<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dangnhap.aspx.cs" Inherits="tbl.Dangnhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng nhập</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="css/StyleSheet.css" />
    <link rel="stylesheet" href="css/DangNhap.css" />
</head>
<body>
    <div id="container">
        <div id="header-container">
            <div id="logo-navigation-container">
                <div id="loginregister">
                    <a href="Dangnhap.aspx" style="display: none;">Đăng nhập</a>
                    <%--<a href="Dangki.aspx">Đăng ký</a>--%>
                </div>
            </div>
        </div>

        <div id="body">
            <form id="formdangnhap" runat="server" method="post" onsubmit="return checkinfordangnhap();">
                <div class="KhungBao">
                    <h2>Đăng Nhập</h2>
                    <div class="nhapInfor">
                        <input type="text" name="email" placeholder="Email" class="iptInfor" id="dnEmail" />
                        <div class="errorText" id="error_email" runat="server" ></div>

                        <input type="password" name="pass" placeholder="Mật khẩu" class="iptInfor" id="dnPass" />
                        <div class="errorText" id="error_pass" runat="server"></div>
                    </div>

                    <div>
                        <input type="checkbox" id="rememberMe" name="rememberMe" runat="server" />
                         <label for="rememberMe">Nhớ mật khẩu</label>
                    </div>

                    <div class="QuenMatKhau" style="width: 100%; margin-top: 20px; text-align: center;">
                        <a href="Quenmatkhau.aspx" style="text-decoration: none;">Quên mật khẩu?</a>
                    </div>
                    <asp:Button ID="btnDangNhap" CssClass="btnDK_DN" runat="server" Text="Đăng nhập" name="btnDangNhap" OnClick="btnDangNhap_Click"/>
                </div>
                <div class="SangTrangDangKy">
                    <span>Nếu bạn chưa có tài khoản ?<a href="Dangki.aspx" style="text-decoration: none; margin-left: 10px;">Đăng ký</a></span>
                </div>
            </form>
        </div>

    </div>
    <script>
        window.onload = function () {
            // Kiểm tra nếu đã lưu thông tin đăng nhập trong localStorage
            if (localStorage.getItem("rememberMe") === "true") {
                var email = localStorage.getItem("email");
                var password = localStorage.getItem("password");
                document.getElementById("dnEmail").value = email;
                document.getElementById("dnPass").value = password;
                document.getElementById("rememberMe").checked = true;
            }
        };

        document.getElementById("formdangnhap").onsubmit = function () {
            // Kiểm tra nếu checkbox "Nhớ mật khẩu" được chọn
            if (document.getElementById("rememberMe").checked) {
                var email = document.getElementById("dnEmail").value;
                var password = document.getElementById("dnPass").value;

                // Lưu thông tin đăng nhập vào localStorage
                localStorage.setItem("email", email);
                localStorage.setItem("password", password);
                localStorage.setItem("rememberMe", "true");
            } else {
                // Nếu checkbox không được chọn, xóa thông tin đăng nhập từ localStorage
                localStorage.removeItem("email");
                localStorage.removeItem("password");
                localStorage.removeItem("rememberMe");
            }
        };
    </script>

</body>
</html>

