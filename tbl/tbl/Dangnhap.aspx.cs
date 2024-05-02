using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tbl
{
    public partial class Dangnhap : System.Web.UI.Page
    {
        List<Member> listMember;
        protected void Page_Load(object sender, EventArgs e)
        {
            // Khởi tạo danh sách nếu chưa tồn tại
            if (Application["listMember"] == null)
            {
                Application["listMember"] = new List<Member>();
            }

            // Lấy danh sách thành viên từ Application
            listMember = (List<Member>)Application["listMember"];
        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            string email = Request.Form["email"];
            string password = Request.Form["pass"];
            string username = "";

            if (IsPostBack)
            {
                foreach (Member member in listMember)
                {
                    if (member.email == email && member.password == password)
                    {
                        // Nếu thông tin đăng nhập đúng, gán tên thành viên và thêm vào session
                        username = member.username;
                        Session["username"] = username;
                        Session["email"] = email;
                        Response.Redirect("Topic.aspx");
                        return; // Thoát khỏi phương thức sau khi chuyển hướng
                    }
                }

                error_pass.Style.Add("color", "red");
                error_pass.InnerHtml = "* Email hoặc mật khẩu không khớp";
            }
            
        }
    }
}