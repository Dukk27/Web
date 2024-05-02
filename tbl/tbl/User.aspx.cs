using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace tbl
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] != null)
                {
                    // Hiển thị tên thành viên đang đăng nhập
                    string username = Session["username"].ToString();
                    //welcomeLabel.Text = "<p style='font-size: 18px'; >Welcome, <a href='info.aspx'>" + username + "</a></p>";
                }
                else
                {
                    Response.Redirect("Dangnhap.aspx");
                }

                // Hiển thị danh sách thành viên
                List<Member> listMember = (List<Member>)Application["listMember"];
                if (listMember != null && listMember.Count > 0)
                {
                    Response.Write("<div style = 'background-color: #061967; position: fixed; top: 0; left: 0; width: 100%; padding: 2px; margin-bottom: 10%'>" +
                        "<p style='font-size:22px; color: white; text-align:center;'>Group chat</p></div>");
                    foreach (Member m in listMember)
                    {
                        Response.Write("<div style='margin-top: 18%'>" +
                            "<p style='text-align: center; padding: 8px; border-radius: 15px; color: white; background-color: #333'><b><i><u>" + m.username + "</u></i></b></p></div>");
                    }
                }
                else
                {
                    Response.Write("<p style='font-size:18px; text-align:center;'>No members in the chat</p>");
                }
            }
            else
            {
                Response.Redirect("Dangnhap.aspx");
            }
        }

    }
}