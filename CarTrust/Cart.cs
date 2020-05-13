using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;

namespace CarTrust
{
    public class Cart
    {
        public static Dictionary<string, string> getCartTotal(HttpCookieCollection cookieCollection)
        {
            Dictionary<string, string> cartTotal = new Dictionary<string, string>();
            HttpCookie cookie = cookieCollection.Get("cart_cookie");

            Decimal servicesCost = 0, cost;
            int servicesCount = 0;

            if (cookie != null)
            {
                var jsonSerialiser = new JavaScriptSerializer();
                ArrayList servicesIds = (ArrayList)jsonSerialiser.Deserialize(cookie.Values["cart_services"], typeof(ArrayList));
                foreach (string serviceId in servicesIds) {
                    Dictionary<string,string> serviceInfo = DataLayer.getServiceInfo(serviceId);
                    if (serviceInfo.Count == 0) {
                        continue;
                    }
                    Decimal.TryParse(serviceInfo["service_cost"], out cost);
                    servicesCost += cost;
                    servicesCount++;
                }
                cartTotal.Add("svc_num", servicesCount.ToString());
                cartTotal.Add("svc_cost", servicesCost.ToString() + "$");
            }
            else {
                cartTotal.Add("svc_num", "0");
                cartTotal.Add("svc_cost", "0$");
            }

            return cartTotal;
        }

        /*
         * Add service id  to cookies 
         */
        public static HttpCookie addService(string svcId, HttpCookieCollection cookieCollection)
        {
            HttpCookie cookie = cookieCollection.Get("cart_cookie");

            if (cookie == null) {
                cookie = new HttpCookie("cart_cookie");
            }

            ArrayList services;
            var jsonSerialiser = new JavaScriptSerializer();

            if (cookie.Values["cart_services"] != null && cookie.Values["cart_services"].Length > 0)
            {
                string servicesString = cookie.Values["cart_services"];
                services = (ArrayList)jsonSerialiser.Deserialize(servicesString, typeof(ArrayList));
                services.Add(svcId);
            }
            else {
                services = new ArrayList();
                services.Add(svcId);
            }

            string cookieString = jsonSerialiser.Serialize(services);
            cookie.Values["cart_services"] = cookieString;
            cookie.Expires.AddDays(10);

            return cookie;
        }


        /*
         * Add service id  to cookies 
         */
        public static HttpCookie removeService(string svcId, HttpCookieCollection cookieCollection)
        {

            HttpCookie cookie = cookieCollection.Get("cart_cookie");

            if (cookie == null)
            {
                cookie = new HttpCookie("cart_cookie");
            }

            ArrayList services;
            var jsonSerialiser = new JavaScriptSerializer();

            if (cookie.Values["cart_services"] != null && cookie.Values["cart_services"].Length > 0)
            {
                string servicesString = cookie.Values["cart_services"];
                services = (ArrayList)jsonSerialiser.Deserialize(servicesString, typeof(ArrayList));
                services.Remove(svcId);
            }
            else
            {
                services = new ArrayList();
            }

            string cookieString = jsonSerialiser.Serialize(services);
            cookie.Values["cart_services"] = cookieString;
            cookie.Expires.AddDays(10);

            return cookie;
        }

        public static ArrayList getServicesIds(HttpCookieCollection cookies)
        {
            
            HttpCookie cookie = cookies.Get("cart_cookie");

            if (cookie == null)
            {
                cookie = new HttpCookie("cart_cookie");
            }

            ArrayList services = new ArrayList();
            var jsonSerialiser = new JavaScriptSerializer();

            if (cookie.Values["cart_services"] != null && cookie.Values["cart_services"].Length > 0)
            {
                string servicesString = cookie.Values["cart_services"];
                services = (ArrayList)jsonSerialiser.Deserialize(servicesString, typeof(ArrayList));
            }

            return services;
        }

        public static HttpCookie removeServices(HttpCookieCollection cookieCollection)
        {

            HttpCookie cookie = cookieCollection.Get("cart_cookie");

            if (cookie == null) {
                return new HttpCookie("cart_cookie");
            }

            cookie.Expires = DateTime.Now.AddDays(-1);

            return cookie;
        }
    }
}