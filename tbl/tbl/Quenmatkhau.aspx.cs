using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tbl
{
    public partial class Quenmakhau : System.Web.UI.Page
    {
        List<Member> listMember;
        protected void Page_Load(object sender, EventArgs e)
        {
            listMember = (List<Member>)Application["listMember"];
            if (IsPostBack)
            {
                string email = Request.Form["dnEmail"];
                foreach(Member i in listMember)
                {
                    if(i.email == email)
                    {
                        Session["Emailquen"] = i;
                        Response.Redirect("Xacminhthongtin.aspx");
                    }
                }
                error_email.InnerHtml = "Sai email";
            }
        }
    }
}