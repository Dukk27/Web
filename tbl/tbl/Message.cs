using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tbl
{
    public class Message
    {
        public string user, timeStamp;

        public string message { get; set; }
        public Message() { }

        public Message(string user, string mess, string time)
        {
            this.user = user;
            this.message = mess;
            this.timeStamp = time;
        }
    }
}