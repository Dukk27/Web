using System;
using System.Collections;
using System.Web.UI;

namespace tbl
{
    public partial class MessageList : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Kiểm tra xem session "username" có chứa giá trị không
            if (Session["username"] != null)
            {
                string username = Session["username"].ToString();

                // Lấy danh sách tin nhắn từ Application
                ArrayList arr = (ArrayList)Application["content"];

                // Hiển thị tiêu đề
                Response.Write("<div style='background-color: #061967; position: fixed; top: 0; left: 0; width: 100%; padding: 2px;'><p style='font-size:22px;" +
                                        "display:flex;" +
                                        "justify-content:center;" +
                                        "align-items:center; color: white'>" +
                                        "Chat" +
                                        "</p></div>");

                // Lặp qua danh sách tin nhắn và hiển thị
                foreach (Message m in arr)
                {
                    if (m != null)
                    {
                        if (m.user == username)
                        {
                            // Tin nhắn của người dùng hiện tại
                            Response.Write("<div style='display: flex; flex-direction: row-reverse'><p style='color: blue; padding: 8px; border-radius: 15px; background-color: #cccccc; width: fit-content'><b>" 
                                + m.user + ":&nbsp;" + m.message + "&nbsp;(" + m.timeStamp + ")</b></p></div>");
                        }
                        else
                        {
                            // Tin nhắn của người khác
                            Response.Write("<p style='color: black; padding: 8px; border-radius: 15px; background-color: #cccccc; width: fit-content'><b>"  
                                + m.user + ":&nbsp;" + m.message + "&nbsp;(" + m.timeStamp + ")</b></p>" + "<br/>");
                        }
                    }
                }
                
            }
            else
            {
                // Nếu session "username" không tồn tại, chuyển hướng người dùng đến trang đăng nhập
                Response.Redirect("Dangnhap.aspx");
            }
        }

    }
}

