using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tbl
{
    public class Member
    {

        public string username, email, sdt, password;
        public Member() { }
        public Member(string username, string email, string sdt, string password)
        {
            this.username = username;
            this.email = email;
            this.sdt = sdt;
            this.password = password;
        }
    }
}