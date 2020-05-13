using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Usr = CarTrust.User;

namespace CarTrust
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            lblMessage.Visible = false;

            string hash = Usr.login(txtEmail.Text, txtPassword.Text);
            if (hash.Length > 0)
            {
                Session["auth"] = hash;
                Response.Redirect("mainpage.aspx");
            }

            lblMessage.Text = "Incorrect user name or password";
            lblMessage.Visible = true;
        }
    }
}