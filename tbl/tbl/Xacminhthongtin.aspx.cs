using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tbl
{
    public partial class Nhapthongtin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Member quen = (Member)Session["Emailquen"];
            if (quen == null)
            {
                Response.Redirect("Quenmatkhau.aspx");
            }
            if (IsPostBack)
            {
                string ten = Request.Form["Ten"];
                string sdt = Request.Form["SDT"];
                if (quen.username != ten || quen.sdt != sdt)
                {
                    error.InnerHtml = "*sai tên hoặc số điện thoại";
                }
                else
                {
                    Session["sdt"] = sdt;
                    Response.Redirect("Doimatkhau.aspx");
                }
            }
        }
    }
}