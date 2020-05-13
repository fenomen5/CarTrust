using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace CarTrust
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string recId = this.Request.QueryString["serviceId"];
            SqlDataSource1.SelectCommand = "SELECT service.id, service.service_name, service.service_cost, service_category.name, " +
                        "service_category.id AS category_id, service_image.service_id, service_image.image_path, service_image.id AS image_id, " +
                        "service.service_description FROM service INNER JOIN service_category ON service.service_category = service_category.id " +
                        "INNER JOIN service_image ON service.id = service_image.service_id where service.id='" + recId + "'";
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            FileUpload btnUpload = (FileUpload)ServiceEditView.FindControl("serviceImageUpload");
            if (btnUpload.FileName == null)
            {
                return;
            }

            btnUpload.SaveAs(Server.MapPath("~/Front/img/service_detail/" + btnUpload.FileName.ToLower()));
            Image imgService = (Image)ServiceEditView.FindControl("serviceImage");
            imgService.ImageUrl = "~/Front/img/service_detail/" + btnUpload.FileName.ToLower();
        }

        protected void ServiceEditView_DataBound(object sender, EventArgs e)
        {
            DropDownList listCategories = (DropDownList)ServiceEditView.FindControl("serviceCategories");
            if (listCategories == null)
            {
                return;
            }
            Label currentCategory = (Label)ServiceEditView.FindControl("categoryId");
            listCategories.Items.FindByValue(currentCategory.Text).Selected = true;
        }

        protected void btnDismiss_Click(object sender, EventArgs e)
        {
            if (Session["servicePageIndex"] != null)
            {
                Response.Redirect("manage_services.aspx?pageIndex=" + Session["servicePageIndex"]);
            }
            else
            {
                Response.Redirect("manage_services.aspx");
            }
        }

        protected void btnSvcUpdate_Click(object sender, EventArgs e)
        {
            string serviceId = ((Label)ServiceEditView.FindControl("idLabel")).Text;
            string serviceName = ((TextBox)ServiceEditView.FindControl("serviceName")).Text;
            string serviceCost = ((TextBox)ServiceEditView.FindControl("serviceCost")).Text;
            string serviceCategory = ((DropDownList)ServiceEditView.FindControl("serviceCategories")).SelectedValue;
            string serviceImage = Path.GetFileName(((Image)ServiceEditView.FindControl("serviceImage")).ImageUrl);
            string serviceDescription = ((TextBox)ServiceEditView.FindControl("serviceDescription")).Text;
            DataLayer.updateService(serviceId, serviceName, serviceCost, serviceCategory, serviceImage, serviceDescription);
            if (Session["servicePageIndex"] != null)
            {
                Response.Redirect("manage_services.aspx?pageIndex=" + Session["servicePageIndex"]);
            }
            else
            {
                Response.Redirect("manage_services.aspx");
            }
        }
    }
}