using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarTrust
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Get("pageIndex") != null)
            {
                gridAdminVisits.PageIndex = int.Parse(Request.QueryString.Get("pageIndex"));
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int visitId = DataLayer.addVisit();
            Response.Redirect("edit_visit.aspx?visitId=" + visitId);
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "edit_visit")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                string visit_id = gridAdminVisits.DataKeys[rowIndex].Values[0].ToString();

                Response.Redirect("edit_visit.aspx?visitId=" + visit_id);
            }
            if (e.CommandName == "remove_visit")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                string visit_id = gridAdminVisits.DataKeys[rowIndex].Values[0].ToString();

                DataLayer.removeVisit(visit_id);

                if (Session["visitPageIndex"] != null)
                {
                    Response.Redirect("manage_visits.aspx?pageIndex=" + Session["visitPageIndex"]);
                }
                else
                {
                    Response.Redirect("manage_visits.aspx");
                }
            }
        }
    }
}