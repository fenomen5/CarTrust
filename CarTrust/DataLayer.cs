using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Data;

namespace CarTrust
{
    public class DataLayer
    {
        public static Dictionary<string,string> getServiceInfo(string service_id)
        {
            Dictionary<string,string> service = new Dictionary<string,string>();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcartrust"].ConnectionString);
            conn.Open();
            string query = "select service.id,service_name,service_cost,service_description, service_category.name, service_image.image_path from service" +
                            " left join service_category ON service.service_category = service_category.id" +
                            " left join service_image ON service.id = service_image.service_id" +
                            " where service.id = " + service_id;
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                service.Add("id", reader.GetInt32(0).ToString());
                service.Add("service_name", reader.GetString(1));
                service.Add("service_cost", reader.GetDecimal(2).ToString());
                service.Add("service_description", reader.GetString(3));
                service.Add("service_category", reader.GetString(4));
                service.Add("service_image", reader.GetString(5));
            }
            else {
                return null;
            }
            conn.Close();
            conn = null;
            return service;
        }

        public static bool createVisit(string visitTime, string visitorName, string visitorEmail, string visitorCarModel, string visitorCarReleased, ArrayList servicesIds)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcartrust"].ConnectionString);
            conn.Open();
            string query = "insert into scheduled_visit output INSERTED.ID values('" + visitTime + "','" + visitorName + "','" + visitorEmail  +  "','" + visitorCarModel + "','" + visitorCarReleased  + "')";
            SqlCommand cmd = new SqlCommand(query, conn);
            int visitId  = (int)cmd.ExecuteScalar();
            if (servicesIds.Count > 0) {
                foreach (string serviceId in servicesIds) {
                    Dictionary<string,string> service = DataLayer.getServiceInfo(serviceId);
                    if (service != null) {
                        query = "insert into visit_service values('" + serviceId + "','" + visitId + "')";
                        cmd = new SqlCommand(query, conn);
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            
            conn.Close();
            conn = null;
            return true;
        }

        public static void updateService(string serviceId, string serviceName, string serviceCost, string serviceCategory, string serviceImage, string serviceDescription)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcartrust"].ConnectionString);
            conn.Open();
            string query = "update service set service_name = @serviceName, service_cost=@serviceCost, service_category=@serviceCategory, service_description=@serviceDescription where id=@serviceId";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.Add(new SqlParameter("serviceId", serviceId));
            cmd.Parameters.Add(new SqlParameter("serviceName", serviceName));
            cmd.Parameters.Add(new SqlParameter("serviceCost", serviceCost));
            cmd.Parameters.Add(new SqlParameter("serviceCategory", serviceCategory));
            cmd.Parameters.Add(new SqlParameter("serviceDescription", serviceDescription));
            cmd.ExecuteNonQuery();
            query = "update service_image set image_path=@imagePath where service_id=@serviceId";
            cmd = new SqlCommand(query, conn);
            cmd.Parameters.Add(new SqlParameter("serviceId", serviceId));
            cmd.Parameters.Add(new SqlParameter("imagePath", serviceImage));
            cmd.ExecuteNonQuery();

            conn.Close();
            conn = null;
        }
        public static void removeService(string serviceId)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcartrust"].ConnectionString);
            conn.Open();
            string query = "delete from service where id=@serviceId";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.Add(new SqlParameter("serviceId", serviceId));
            cmd.ExecuteNonQuery();

            conn.Close();
            conn = null;
        }
        public static int addService()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcartrust"].ConnectionString);
            conn.Open();
            string query = "insert service output INSERTED.ID values(@serviceName, @serviceCost, @serviceCategory, @serviceDescription)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.Add(new SqlParameter("serviceName", "new service"));
            cmd.Parameters.Add(new SqlParameter("serviceCost", "0"));
            cmd.Parameters.Add(new SqlParameter("serviceCategory", "1"));
            cmd.Parameters.Add(new SqlParameter("serviceDescription", ""));
            int serviceId = (int)cmd.ExecuteScalar();

            query = "insert into service_image values (@serviceId, @imagePath)";
            cmd = new SqlCommand(query, conn);
            cmd.Parameters.Add(new SqlParameter("serviceId", serviceId));
            cmd.Parameters.Add(new SqlParameter("imagePath", ""));
            cmd.ExecuteNonQuery();

            conn.Close();
            conn = null;
            return serviceId;
        }
        public static void updateVisit(string visitId, string visitTime, string visitorName, string visitorEmail, string carModel, string carReleased)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcartrust"].ConnectionString);
            conn.Open();
            string query = "update scheduled_visit set visit_time = @visitTime, visitor_name=@visitorName, " +
                "visitor_email=@visitorEmail, visitor_car_model=@visitorCarModel, visitor_car_released=@visitorCarReleased where id=@visitId";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.Add(new SqlParameter("visitId", visitId));
            cmd.Parameters.Add(new SqlParameter("visitTime", visitTime));
            cmd.Parameters.Add(new SqlParameter("visitorName", visitorName));
            cmd.Parameters.Add(new SqlParameter("visitorEmail", visitorEmail));
            cmd.Parameters.Add(new SqlParameter("visitorCarModel", carModel));
            cmd.Parameters.Add(new SqlParameter("visitorCarReleased", carReleased));
            cmd.ExecuteNonQuery();
            conn.Close();
            conn = null;
        }

        public static void removeVisit(string visitId)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcartrust"].ConnectionString);
            conn.Open();
            string query = "delete from scheduled_visit where id=@visitId";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.Add(new SqlParameter("visitId", visitId));
            cmd.ExecuteNonQuery();

            conn.Close();
            conn = null;
        }

        public static int addVisit()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcartrust"].ConnectionString);
            conn.Open();
            string query = "insert scheduled_visit output INSERTED.ID values(@visitTime, @visitorName, @visitorEmail, @visitorCarModel, @visitorCarReleased)";
            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.Add(new SqlParameter("visitTime", "2019-10-29 00:00"));
            cmd.Parameters.Add(new SqlParameter("visitorName", ""));
            cmd.Parameters.Add(new SqlParameter("visitorEmail", ""));
            cmd.Parameters.Add(new SqlParameter("visitorCarModel", ""));
            cmd.Parameters.Add(new SqlParameter("visitorCarReleased", ""));

            int visitId = (int)cmd.ExecuteScalar();

            conn.Close();
            conn = null;
            return visitId;
        }

        public static int addPromo()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcartrust"].ConnectionString);
            conn.Open();
            string query = "insert promo output INSERTED.ID values(@promo_name, @file_name)";
            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.Add(new SqlParameter("promo_name", ""));
            cmd.Parameters.Add(new SqlParameter("file_name", ""));

            int promotId = (int)cmd.ExecuteScalar();

            conn.Close();
            conn = null;
            return promotId;
        }

        public static void updatePromo(string promoId, string promoName, string promoImage)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcartrust"].ConnectionString);
            conn.Open();

            string query = "update promo set promo_name = @promoName, file_name=@fileName where id=@promoId";

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.Add(new SqlParameter("promoId", promoId));
            cmd.Parameters.Add(new SqlParameter("promoName", promoName));
            cmd.Parameters.Add(new SqlParameter("fileName", promoImage));

            cmd.ExecuteNonQuery();
           
            conn.Close();
            conn = null;
        }
        public static ArrayList getPromos()
        {
            ArrayList promos = new ArrayList();
            Dictionary<string, string> promo = new Dictionary<string, string>();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcartrust"].ConnectionString);
            conn.Open();
            string query = "select top 10 id, promo_name, file_name from promo";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                promo.Add("id", reader.GetInt32(0).ToString());
                promo.Add("promo_name", reader.GetString(1));
                promo.Add("file_name", reader.GetString(2));
                promos.Add(promo);
                promo = new Dictionary<string, string>();
            }
            
            conn.Close();
            conn = null;
            return promos;
        }

        public static void removePromo(string promoId)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcartrust"].ConnectionString);
            conn.Open();
            string query = "delete from promo where id=@promoId";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.Add(new SqlParameter("promoId", promoId));
            cmd.ExecuteNonQuery();

            conn.Close();
            conn = null;
        }
    }
}