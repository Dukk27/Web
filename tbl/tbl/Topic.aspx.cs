using System;
using System.Collections.Generic;

namespace tbl
{
    public partial class Topic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("Dangnhap.aspx");
                }
            }
        }
    }
}
