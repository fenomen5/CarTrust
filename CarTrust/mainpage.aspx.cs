using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CarTrust
{
    public partial class MainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ArrayList promos = DataLayer.getPromos();

            foreach (Dictionary<string, string> promo in promos) {

                HtmlGenericControl li = new HtmlGenericControl("li");
                promo_slider.Controls.Add(li);
                HtmlImage image = new HtmlImage();
                image.Src = "~/Front/img/promo_detail/" + promo["file_name"];
                li.Controls.Add(image);
            }
            //< li >< img src = "http://placehold.it/500x250" alt = "" /></ li >
            //HtmlGenericControl image = new HtmlGenericControl("img");
            //anchor.Attributes.Add("href", "page.htm");
            //anchor.InnerText = "TabX";

            //li.Controls.Add(anchor);
        }
    }
}