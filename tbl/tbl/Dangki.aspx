<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dangki.aspx.cs" Inherits="tbl.Dangki" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng ký</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="css/StyleSheet.css" />
    <link rel="stylesheet" href="css/DangKy.css" />
    <script>
        function checkinfordangky() {
            var ten = document.getElementById("Ten").value;
            var email = document.getElementById("Email").value;
            var sdt = document.getElementById("SDT").value;
            var pass = document.getElementById("Pass").value;
            var cfpass = document.getElementById("ComfirmPass").value;
            // var email1 = document.getElementById("Email1").value;
            var erTen = document.getElementById("error_ten");
            var erEmaail = document.getElementById("error_email");
            var erSDT = document.getElementById("error_sdt");
            var erPass = document.getElementById("error_pass");
            var erCfPass = document.getElementById("error_confirm");
            var cb = document.getElementById("DieuKhoan").checked;
            var lb = document.getElementById("lbCheckBox");
            //var erEmail1= document.getElementById("error_email1");

            var ok = true;

            if (ten == "") {
                erTen.style.color = "red";
                erTen.innerHTML = "* Tên không được để trống";
                ok = false;

            }

            if (sdt == "") {
                erSDT.style.color = "red";
                erSDT.innerHTML = "* SĐT không được để trống";
                ok = false;
            } else if (!(/^\d{10}$/.test(sdt)) || sdt.charAt(0) !== '0') {
                erSDT.style.color = "red";
                erSDT.innerHTML = "* SĐT phải bắt đầu từ số 0 và có đúng 10 chữ số";
                ok = false;
            }


            if (email == "") {
                erEmaail.style.color = 'red';
                erEmaail.innerHTML = "* Email không được để trống";
                ok = false;
            } else {
                console.log("ha");
                if (email.lastIndexOf("@gmail.com") === -1) {
                    erEmaail.style.color = 'red';
                    erEmaail.innerHTML = "* Email phải có @gmail.com";
                    ok = false;
                }
            }

            if (pass == "") {
                erPass.style.color = 'red';
                erPass.innerHTML = "* Pass không được để trống";
                ok = false;
            }

            if (cfpass == "") {
                erCfPass.style.color = 'red';
                erCfPass.innerHTML = "* CfPass không được để trống"
                ok = false;
            }

            //if (email1 == "") {
            //    erEmail1.style.color = 'red';
            //    erEmail1.innerHTML = "* Email không được để trống";
            //    ok = false;
            //} else {
            //    console.log("ha");
            //    if (email1.lastIndexOf("@gmail.com") === -1) {
            //        erEmail1.style.color = 'red';
            //        erEmail1.innerHTML = "* Email phải có @gmail.com";
            //        ok = false;
            //    }
            //}


            if (ok) {
                if (pass != cfpass) {
                    erCfPass.style.color = 'red';
                    erCfPass.innerHTML = "* Pass không giống với CfPass"
                    ok = false;
                }
            }

            if (!cb) {
                lb.style.color = "red";
                ok = false;
            } else {
                lb.style.color = "black";
            }

            return ok;

        }
    </script>
</head>
<body>
    <div id="container">
        <div id="header-container">
            <div id="logo-navigation-container">
                <div id="loginregister">
                    <a href="Dangnhap.aspx">Đăng nhập</a>
                </div>
            </div>
        </div>


        <div id="body">
            <form id="formTaoTaiKhoan" method="post" runat="server" onsubmit="return checkinfordangky();">
                <div class="khungBao">
                    <h2>Đăng Ký</h2>
                    <div class="nhapInfor">
                        <div class="iptInfor">
                            <input type="text" name="Ten" id="Ten" class="input-text" placeholder="Tên" />
                            <div class="errorText" id="error_ten" runat="server"></div>
                        </div>

                        <div class="iptInfor">
                            <input type="text" value="" class="input-text" name="Email" id="Email" placeholder="Email" />
                            <div class="errorText" id="error_email" runat="server"></div>
                        </div>

                        <div class="iptInfor">
                            <input type="text" value="" class="input-text" name="SDT" id="SDT" placeholder="Số điện thoại" />
                            <div class="errorText" id="error_sdt" runat="server"></div>
                        </div>

                        <div class="iptInfor">
                            <input type="password" value="" class="input-text" name="Pass" id="Pass" placeholder="Mật khẩu" />
                            <div class="errorText" id="error_pass" runat="server"></div>
                        </div>

                        <div class="iptInfor">
                            <input type="password" value="" class="input-text" name="ComfirmPass" id="ComfirmPass" placeholder="Mật khẩu xác nhận" />
                            <div class="errorText" id="error_confirm" runat="server"></div>
                        </div>

                         <div class="iptInfor">
                            <input type="text" value="" class="input-text" placeholder="Mã số thuế" />
                            <div class="errorText" runat="server"></div>
                        </div>

                    </div>
                    <label for="DieuKhoan" class="lbDieuKhoan" id="lbCheckBox">
                        <input type="checkbox" name="DieuKhoan" id="DieuKhoan" value="ok" />
                        Tôi đồng ý với điều khoản sử dụng.
                    </label>
                    <div class="dk">
                        <asp:Button class="btnDK_DN" ID="btnDangKy" name="DangKy" runat="server" Text="Đăng Ký" OnClick="BtnDangKy_Click" />
                    </div>
                </div>
            </form>
        </div>

    </div>

</body>
</html>
