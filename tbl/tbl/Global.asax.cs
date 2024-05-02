using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace tbl
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            List<Member> listMember = new List<Member>();
            listMember.Add(new Member("a", "a@gmail.com", "012345678", "a"));
            listMember.Add(new Member("b", "b@gmail.com", "0234567891", "b"));
            Application["listMember"] = listMember;

            Application["members"] = new ArrayList();
            Application["content"] = new ArrayList();

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session["member"] = new Member();
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}