using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tbl
{
    public partial class WebChat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayMemberCount();
            }

            if (Session["username"] == null)
            {
                Response.Redirect("Dangnhap.aspx");
            }

        }

        private void DisplayMemberCount()
        {
            List<Member> members = (List<Member>)Application["listMember"];
            int memberCount = members != null ? members.Count : 0;
            lblMemberCount.Text = $"Tổng số người tham gia: {memberCount}";
        }

    }

}