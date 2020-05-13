using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarTrust
{
    public partial class Admins : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["auth"] == null || !User.checkAuth(Session["auth"].ToString()) || !User.checkAdmin(Session["auth"].ToString()))
            {
                throw new HttpException(403, "Authorization required");
            }
           
        }

        
    }
}