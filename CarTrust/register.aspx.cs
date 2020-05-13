using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Usr = CarTrust.User;

namespace CarTrust
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            int userId = Usr.register(txtEmail.Text, txtFirstName.Text, txtPassword.Text);
            if (userId > 0) {
                Response.Redirect("Login.aspx");
            }
        }
    }
}