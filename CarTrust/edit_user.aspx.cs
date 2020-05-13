using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Usr = CarTrust.User;

namespace CarTrust
{
    public partial class WebForm18 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string recId = this.Request.QueryString["userId"];
            SqlDataSource1.SelectCommand = "SELECT [id], [user_name], [email], [active], [isAdmin] FROM [users] " +
                "where users.id='" + recId + "'";
        }

        protected void btnUserUpdate_Click(object sender, EventArgs e)
        {
            string userId = ((Label)UserEditView.FindControl("userId")).Text;
            string userName = ((TextBox)UserEditView.FindControl("txtUserName")).Text;
            string userEmail = ((TextBox)UserEditView.FindControl("txtUserEmail")).Text;
            string userActive = ((CheckBox)UserEditView.FindControl("chkUserActive")).Checked ? "1" : "0";
            string userAdmin = ((CheckBox)UserEditView.FindControl("chkUserAdmin")).Checked ? "1" : "0";

            Usr.updateUser(userId, userName, userEmail, userActive, userAdmin);

            if (Session["userPageIndex"] != null)
            {
                Response.Redirect("manage_users.aspx?pageIndex=" + Session["userPageIndex"]);
            }
            else
            {
                Response.Redirect("manage_users.aspx");
            }
        }

        protected void btnDismiss_Click(object sender, EventArgs e)
        {
            if (Session["userPageIndex"] != null)
            {
                Response.Redirect("manage_users.aspx?pageIndex=" + Session["userPageIndex"]);
            }
            else
            {
                Response.Redirect("manage_users.aspx");
            }
        }
    }
}