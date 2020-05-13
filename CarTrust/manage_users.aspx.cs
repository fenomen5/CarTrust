using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Usr = CarTrust.User;

namespace CarTrust
{
    public partial class WebForm17 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Get("pageIndex") != null)
            {
                searchUsers();
                gridAdminUsers.PageIndex = int.Parse(Request.QueryString.Get("pageIndex"));
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int userId = Usr.register("","","pass");
            Response.Redirect("edit_user.aspx?userId=" + userId);
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "edit_user")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                string visit_id = gridAdminUsers.DataKeys[rowIndex].Values[0].ToString();

                Response.Redirect("edit_user.aspx?userId=" + visit_id);
            }
            if (e.CommandName == "remove_user")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                string userId = gridAdminUsers.DataKeys[rowIndex].Values[0].ToString();

                Usr.deleteUser(userId);

                if (Session["usersPageIndex"] != null)
                {
                    Response.Redirect("manage_users.aspx?pageIndex=" + Session["usersPageIndex"]);
                }
                else
                {
                    Response.Redirect("manage_users.aspx");
                }
            }
        }

        protected void btnSearchUsers_Click(object sender, EventArgs e)
        {
            searchUsers();
        }

        protected void searchUsers()
        {
            string command = " SELECT users.id, users.user_name, users.email, users.active, users.isAdmin, visits.visits_num " +
                " FROM users " +
                " @visits_join " +
                " (select user_id, count(user_stat.user_id) as visits_num " +
                " from user_stat @where_visits @visits_start @visits_end" +
                " group by user_id) as visits on " +
                " visits.user_id = users.id " +
                " WHERE 1=1 ";

            if (!string.IsNullOrEmpty(txtUserName.Text))
            {
                command += " AND users.user_name like '%" + txtUserName.Text + "%'";
            }

            if (!string.IsNullOrEmpty(txtVisitedStart.Text))
            {
                command = command.Replace("@visits_join", " INNER JOIN ");
                command = command = command.Replace("@where_visits", "WHERE 1=1 ");
                command = command.Replace("@visits_start",
                    " AND user_stat.login_date >= '" + txtVisitedStart.Text + "'");
            }

            if (!string.IsNullOrEmpty(txtVisitedEnd.Text))
            {
                command = command.Replace("@visits_join", " INNER JOIN ");
                command = command.Replace("@where_visits", "WHERE 1=1 ");
                command = command.Replace("@visits_end",
                    " AND user_stat.login_date <= '" + txtVisitedEnd.Text + "'");
            }

            command = command.Replace("@where_visits", " ");
            command = command.Replace("@visits_start", " ");
            command = command.Replace("@visits_end", " ");
            command = command.Replace("@visits_join", " LEFT JOIN ");
            
            SqlDataSource1.SelectCommand = command;

        }
    }
}