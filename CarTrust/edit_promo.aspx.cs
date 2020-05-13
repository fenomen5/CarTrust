using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarTrust
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string recId = this.Request.QueryString["promoId"];
            SqlDataSource1.SelectCommand = "SELECT id, promo_name, file_name " +
                        "FROM promo " +
                        "where id='" + recId + "'";
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            FileUpload btnUpload = (FileUpload)promoEditView.FindControl("promoImageUpload");
            if (btnUpload.FileName == null)
            {
                return;
            }

            btnUpload.SaveAs(Server.MapPath("~/Front/img/promo_detail/" + btnUpload.FileName.ToLower()));
            Image imgService = (Image)promoEditView.FindControl("promoImage");
            imgService.ImageUrl = "~/Front/img/promo_detail/" + btnUpload.FileName.ToLower();
        }

        protected void btnDismiss_Click(object sender, EventArgs e)
        {
            if (Session["promoPageIndex"] != null)
            {
                Response.Redirect("manage_promos.aspx?pageIndex=" + Session["promoPageIndex"]);
            }
            else
            {
                Response.Redirect("manage_promos.aspx");
            }
        }

        protected void btnPromoUpdate_Click(object sender, EventArgs e)
        {
            string promoId = ((Label)promoEditView.FindControl("idLabel")).Text;
            string promoName = ((TextBox)promoEditView.FindControl("promoName")).Text;
            string promoImage = Path.GetFileName(((Image)promoEditView.FindControl("promoImage")).ImageUrl);
            //DataLayer.updateService(serviceId, serviceName, serviceCost, serviceCategory, serviceImage, serviceDescription);
            DataLayer.updatePromo(promoId, promoName, promoImage);
            if (Session["servicePageIndex"] != null)
            {
                Response.Redirect("manage_promos.aspx?pageIndex=" + Session["servicePageIndex"]);
            }
            else
            {
                Response.Redirect("manage_promos.aspx");
            }
        }
    }
}