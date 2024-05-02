using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tbl
{
    public partial class SendMsg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string msg = Request.Form["txtMessage"];

            // Lấy danh sách tin nhắn từ Application
            ArrayList content = (ArrayList)Application["content"];

            // Lấy thông tin thành viên từ session
            string username = (string)Session["username"];

            // Kiểm tra xem có tin nhắn và thông tin thành viên hay không
            if (!string.IsNullOrEmpty(msg) && !string.IsNullOrEmpty(username))
            {
                // Tạo đối tượng tin nhắn mới
                Message newMessage = new Message(username, msg, DateTime.Now.ToString());

                // Thêm tin nhắn vào danh sách
                content.Add(newMessage);

                // Chuyển hướng người dùng trở lại trang MessageList
                Response.Redirect("PostMsg.html");
            }
            else
            {
                Response.Write("Lỗi");
            }
        }
    }
}