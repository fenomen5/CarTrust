using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarTrust
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gridServices_SelectedIndexChanged(object sender, EventArgs e)
        {           
            foreach (GridViewRow row in gridServices.Rows)
            {               
                string service_id = gridServices.DataKeys[gridServices.SelectedIndex].Values[0].ToString();
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + gridServices.DataKeys[gridServices.SelectedIndex].Values[0].ToString() + "')", true);
                Response.Redirect("service.aspx?service_id=" + service_id);
            }
        }

        protected void gridServices_RowDataBound(object sender, GridViewRowEventArgs e)
        {

                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gridServices, "Select$" + e.Row.RowIndex);
                }
        }

        protected void gridServices_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "serviceAddClick") {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                
                string service_id = gridServices.DataKeys[rowIndex].Values[0].ToString();

                HttpCookie cookies = Cart.addService(service_id, Request.Cookies);
                Response.Cookies.Set(cookies);
                Response.Redirect("services.aspx", false);
            }
        }

        protected void CartAdd_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int serviceId = 0;
            if (btn.CommandName == "addBasic") {
                serviceId = 76;
             }
            if (btn.CommandName == "addStandard")
            {
                serviceId = 77;
            }
            if (btn.CommandName == "addPremium")
            {
                serviceId = 78;
            }

            Dictionary<string, string> svcInfo = DataLayer.getServiceInfo(serviceId.ToString());
            if (svcInfo == null) {
                Response.Redirect("services.aspx");
            }

            HttpCookie cookies = Cart.addService(svcInfo["id"], Request.Cookies);
            Response.Cookies.Set(cookies);
            Response.Redirect("services.aspx");
        }

        protected void btnSearchByName_Click(object sender, EventArgs e)
        {
            string serviceName = txtServiceName.Text;
            
            //SqlDataSource1.SelectCommand = "SELECT service.id, service.service_name, service.service_cost, service_category.name, " +
            //            "service_category.id AS category_id, service_image.service_id, service_image.image_path, service_image.id AS image_id, " +
            //            "service.service_description FROM service " +
            //            "INNER JOIN service_category ON service.service_category = service_category.id " +
            //            "INNER JOIN service_image ON service.id = service_image.service_id where service.id='" + recId + "'";
            SqlDataSource2.SelectCommand = "SELECT service.id, service.service_name, service.service_cost, service_category.name as service_category " +
                "FROM service " +
                "INNER JOIN service_category ON service.service_category = service_category.id " +
                "WHERE service_name like '%" + serviceName + "%'";
        }
    }
}