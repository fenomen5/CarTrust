using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Usr = CarTrust.User;

namespace CarTrust
{
    public partial class WebForm15 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string password = Usr.generatePassword();
            Usr.passwordReset(txtEmail.Text, password);
            if (!Mailer.sendPasswordRecoveryLetter(txtEmail.Text, password)) {
                lblError.Text = "Sending email with a new password is failed";
                lblError.Visible = true;
            } ;
            
        }
    }
}