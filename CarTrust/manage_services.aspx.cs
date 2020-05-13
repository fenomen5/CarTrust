using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarTrust
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Get("pageIndex") != null) {
                setServicesGridSource();
                gridAdminServices.PageIndex = int.Parse(Request.QueryString.Get("pageIndex"));
            }
            
            
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "edit_service")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                string service_id = gridAdminServices.DataKeys[rowIndex].Values[0].ToString();
                
                Response.Redirect("edit_service.aspx?serviceId=" + service_id);
            }
            if (e.CommandName == "remove_service")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                string service_id = gridAdminServices.DataKeys[rowIndex].Values[0].ToString();

                DataLayer.removeService(service_id);
                Response.Redirect("manage_services.aspx");
            }
            
        }

        protected void gridAdminServices_DataBound(object sender, EventArgs e)
        {
            Session["servicePageIndex"] = gridAdminServices.PageIndex;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int serviceId = DataLayer.addService();
            Response.Redirect("edit_service.aspx?serviceId=" + serviceId);
        }

        protected void btnSearchServices_Click(object sender, EventArgs e)
        {
            setServicesGridSource();
        }
        protected void setServicesGridSource()
        {
            string command = " SELECT service.id, service.service_name, service.service_cost, service.service_description, " +
            "service_image.image_path, service_category.name " +
            "FROM service " +
            "INNER JOIN service_category ON service.service_category = service_category.id " +
            "INNER JOIN service_image ON service.id = service_image.service_id " +
            "WHERE 1=1 ";

            if (!string.IsNullOrEmpty(txtServiceName.Text))
            {
                command += " AND service.service_name like '%" + txtServiceName.Text + "%'";
            }

            if (!string.IsNullOrEmpty(txtServiceDescription.Text))
            {
                command += " AND service.service_description like '%" + txtServiceDescription.Text + "%'";
            }

            if (listServiceCategory.SelectedValue != "0")
            {
                command += " AND service.service_category = " + listServiceCategory.SelectedItem.Value;
            }

            SqlDataSource1.SelectCommand = command;
        }

        protected void listServiceCategory_DataBound(object sender, EventArgs e)
        {
            listServiceCategory.Items.Insert(0, new ListItem("All categories", "0", true));
            listServiceCategory.SelectedIndex = 0;
        }
    }
}