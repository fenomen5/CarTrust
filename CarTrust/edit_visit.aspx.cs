using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarTrust
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string recId = this.Request.QueryString["visitId"];
            SqlDataSource1.SelectCommand = "SELECT [id], [visit_time], [visitor_name], [visitor_email], [visitor_car_model], [visitor_car_released] " +
                "FROM [scheduled_visit] where scheduled_visit.id='" + recId + "'";
        }

        protected void btnSvcUpdate_Click(object sender, EventArgs e)
        {
            string visitId = ((Label)VisitEditView.FindControl("visitId")).Text;
            string visitTime = ((TextBox)VisitEditView.FindControl("visitTime")).Text;
            string visitorName = ((TextBox)VisitEditView.FindControl("visitorName")).Text;
            string visitorEmail = ((TextBox)VisitEditView.FindControl("visitorEmail")).Text;
            string carModel = ((TextBox)VisitEditView.FindControl("carModel")).Text;
            string yearManufactured = ((TextBox)VisitEditView.FindControl("yearManufactured")).Text;
            DataLayer.updateVisit(visitId, visitTime, visitorName, visitorEmail, carModel, yearManufactured);

            if (Session["visitPageIndex"] != null)
            {
                Response.Redirect("manage_visits.aspx?pageIndex=" + Session["visitPageIndex"]);
            }
            else
            {
                Response.Redirect("manage_visits.aspx");
            }
        }

        protected void btnDismiss_Click(object sender, EventArgs e)
        {
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