using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tbl
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            // Cập nhật danh sách thành viên bằng cách loại bỏ người dùng hiện tại
            List<Member> members = (List<Member>)Application["listMember"];
            if (members != null && Session["username"] != null)
            {
                string username = Session["username"].ToString();
                members.RemoveAll(m => m.username == username);
            }
            Application["listMember"] = members;
        }
    }
}