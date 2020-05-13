using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Usr = CarTrust.User;

namespace CarTrust
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if(Session["auth"] == null || !Usr.checkAuth(Session["auth"].ToString()))
            {
                Page.Form.FindControl("ContentPlaceHolder1").Controls.Clear();
                HtmlGenericControl ctrl = new HtmlGenericControl();
                ctrl.InnerHtml = "<h3 class='text-center'>You should be authorized to reserve a visit. <a href='login.aspx'>Go to login page</a></h3>";
                Page.Form.FindControl("ContentPlaceHolder1").Controls.Add(ctrl);
            }

            if (IsPostBack) {
                string visitTime = txtVisitDate.Text + " " + txtVisitTime.Text;
                ArrayList servicesIds = Cart.getServicesIds(Request.Cookies);
                DataLayer.createVisit(visitTime, txtClientName.Text, txtClientEmail.Text, txtCarModel.Text, txtYearProduced.Text, servicesIds);
                HttpCookie coockie = Cart.removeServices(Request.Cookies);
                Response.Cookies.Add(coockie);
                Response.Redirect("visit_success.aspx");
            }
        }
    }
}