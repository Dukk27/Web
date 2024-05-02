using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tbl
{
    public partial class Dangki : System.Web.UI.Page
    {
        List<Member> listMember;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Application["listMember"] != null)
            {
                // Gán giá trị cho listMember
                listMember = (List<Member>)Application["listMember"];
            }
            else
            {
                // Tạo một danh sách mới nếu Application["listMember"] không tồn tại
                listMember = new List<Member>();
            }
        }

        protected void BtnDangKy_Click(object sender, EventArgs e)
        {
            string ten = Request.Form["Ten"];
            string email = Request.Form["Email"];
            string sdt = Request.Form["SDT"];
            string pass = Request.Form["Pass"];

            bool ok = true;

            // Kiểm tra xem listMember có tồn tại và không null
            if (listMember != null)
            {
                foreach (Member i in listMember)
                {
                    if (i.email == email)
                    {
                        ok = false;
                        error_email.InnerHtml = "* Email đã được sử dụng";
                        break;
                    }
                    else
                    {
                        error_email.InnerHtml = "";
                    }
                    if (i.sdt == sdt)
                    {
                        ok = false;
                        error_sdt.InnerHtml = "* SDT đã được sử dụng";
                        break;
                    }
                    else
                    {
                        error_sdt.InnerHtml = "";
                    }
                }
            }

            if (ok)
            {
                Member new_member = new Member(ten, email, sdt, pass);
                listMember.Add(new_member);
                Application["listUser"] = listMember; // Gán lại Application["listUser"]
                Response.Redirect("Dangnhap.aspx");
            }
        }
    }
}