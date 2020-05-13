using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarTrust
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Dictionary<string, string> service = DataLayer.getServiceInfo(Request["service_id"]);
                if (service.Count == 0)
                {
                    Response.Redirect("services.aspx");
                }

                setServiceInfo(service);
            } catch (Exception)
            {
                Response.Redirect("services.aspx");
            }
            
        }
        private void setServiceInfo(Dictionary<string,string> service) {
            svcId.Text = service["id"];
            svcName.Text = service["service_name"];
            svcPrice.Text = service["service_cost"] + "$";
            svcDescription.Text = service["service_description"];
            svcCategory.Text = service["service_category"];
            svcImage.ImageUrl = "~/Front/img/service_detail/" + service["service_image"];
        }

        protected void CartAdd_Click(object sender, EventArgs e)
        {
            Dictionary<string,string> svcInfo = DataLayer.getServiceInfo(svcId.Text);
            HttpCookie cookies = Cart.addService(svcInfo["id"], Request.Cookies);
            Response.Cookies.Set(cookies);
            Response.Redirect("services.aspx");
        }
    }
}