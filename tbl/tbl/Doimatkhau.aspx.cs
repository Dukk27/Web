using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tbl
{
    public partial class Doimatkhau : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Member member = (Member)Session["Emailquen"];
            if (member == null)
            {
                Response.Redirect("Quenmatkhau.aspx");
            }
            if (IsPostBack)
            {
                foreach(Member m in (List<Member>)Application["listMember"])
                {
                    if(m.email == member.email)
                    {
                        m.password = Request.Form["Pass"];
                        Session.Abandon();
                        Response.Redirect("Dangnhap.aspx");
                    }
                }
            }
            
        }
    }
}