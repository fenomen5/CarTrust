using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Usr = CarTrust.User;

namespace CarTrust
{
    public partial class CarTrust : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Dictionary<string, string> cartTotal = Cart.getCartTotal(Request.Cookies);
            cart_svc_num.Text = " " + cartTotal["svc_num"];
            cart_svc_cost.Text = " " + cartTotal["svc_cost"];
        }

        protected string getLoginData()
        {
            if (Session["auth"] == null || !User.checkAuth(Session["auth"].ToString()))
            {
                return "<a href='login.aspx'>" +
                    "<i class='fa fa-user-circle text-theme-colored font-18'></i>" +
                    "Sign In </a>";
            }
            else {
                AuthUser user = (AuthUser)User.getUserBySession(Session["auth"].ToString());
                return user.name;
            }

            return "";
        }
        protected string getSignButton()
        {
            if (Session["auth"] == null || !User.checkAuth(Session["auth"].ToString()))
            {
                return "<a href='register.aspx'>" +
                        "<i class='fa fa-user text-theme-colored font-18'></i>" +
                        "Sign Up" +
                        "</a>";
            }
            else
            {
                return "<a href='logout.aspx'>" +
                        "<i class='fa fa-sign-out text-theme-colored font-18'></i>" +
                        "Log out " +
                        "</a>";
            }

            return "";
        }

        protected string getAdminLink()
        {
            if (Session["auth"] == null || !User.checkAuth(Session["auth"].ToString()) || !User.checkAdmin(Session["auth"].ToString()))
            {
                return "";
            }
            else
            {
                return "<a href='manage_services.aspx'>" +
                        "<i class='fa fa-cogs text-theme-colored font-18'></i>" +
                        " admin panel " +
                        "</a>";
            }

            return "";
        }
    }
}