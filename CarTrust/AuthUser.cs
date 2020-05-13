using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CarTrust
{
    public class AuthUser
    {
        public string id;
        public string name;
        public string email;

        public AuthUser(string id, string name, string email) {
            this.id = id;
            this.name = name;
            this.email = email;
        }
    }
}