using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarTrust
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            decimal totalCost = 0 , serviceCost = 0;
            int totalCount = 0;
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[4] { new DataColumn("service_id"), new DataColumn("service_name"), new DataColumn("service_cost"), new DataColumn("service_image") });

            ArrayList servicesIds = Cart.getServicesIds(Request.Cookies);
            foreach (string serviceId in servicesIds) {
                Dictionary<string,string> svcInfo = DataLayer.getServiceInfo(serviceId);
                dt.Rows.Add(svcInfo["id"], svcInfo["service_name"], svcInfo["service_cost"], "~/Front/img/service_detail/" + svcInfo["service_image"]);
                 
                Decimal.TryParse(svcInfo["service_cost"], out serviceCost);
                totalCost += serviceCost;
                totalCount++;

                cartServicesGrid.DataSource = dt;
                cartServicesGrid.DataBind();
            }
       
            lblTotalCount.Text = totalCount.ToString();
            lblTotalCost.Text = totalCost.ToString();
        }

        protected void bookVisit_Click(object sender, EventArgs e)
        {
            Response.Redirect("/visit.aspx");
        }

        protected void cartServicesGrid_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void cartServicesGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "remove_service")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                string service_id = cartServicesGrid.DataKeys[rowIndex].Values[0].ToString();

                HttpCookie cookies = Cart.removeService(service_id, Request.Cookies);
                Response.Cookies.Set(cookies);
                Response.Redirect("cart.aspx", false);
            }
        }
    }
}