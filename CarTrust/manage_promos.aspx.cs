using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarTrust
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddPromo_Click(object sender, EventArgs e)
        {
            int promoId = DataLayer.addPromo();
            Response.Redirect("edit_promo.aspx?promoId=" + promoId);
        }

        protected void grdPromos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "edit_promo")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                string promo_id = grdAdminPromos.DataKeys[rowIndex].Values[0].ToString();

                Response.Redirect("edit_promo.aspx?promoId=" + promo_id);
            }
            if (e.CommandName == "remove_promo")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                string promo_id = grdAdminPromos.DataKeys[rowIndex].Values[0].ToString();

                DataLayer.removePromo(promo_id);
                Response.Redirect("manage_promos.aspx");
            }
        }
    }
}