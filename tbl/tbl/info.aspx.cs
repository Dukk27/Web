using System;

namespace tbl
{
    public partial class info : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Kiểm tra xem session có tồn tại không
                if (Session["username"] != null && Session["email"] != null)
                {
                    // Lấy thông tin của người dùng từ session
                    string username = Session["username"].ToString();
                    string email = Session["email"].ToString();

                    // Hiển thị thông tin của người dùng với các thẻ HTML đã được định dạng
                    userInfo.Text += "<h1 class='userInfo'>Thông tin người dùng</h1>";
                    userInfo.Text += "<p class='userInfo'>Tên người dùng: <strong>" + username + "</strong></p>";
                    userInfo.Text += "<p class='userInfo'>Email: <strong>" + email + "</strong></p>";
                }
                else
                {
                    // Nếu không có session, chuyển hướng người dùng đến trang đăng nhập
                    Response.Redirect("Dangnhap.aspx");
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            // Chuyển hướng người dùng về trang trước đó (chẳng hạn là trang đăng nhập)
            Response.Redirect("Topic.aspx");
        }

    }
}
