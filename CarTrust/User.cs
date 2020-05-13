using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace CarTrust
{
    public class User
    {
        public static int register(string email, string firstName, string password) {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcartrust"].ConnectionString);
            conn.Open();

            string query = "insert users output INSERTED.ID values(@user_name, @email, @password, @session, @active, @is_admin)";
            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.Add(new SqlParameter("user_name", firstName));
            cmd.Parameters.Add(new SqlParameter("email", email));
            cmd.Parameters.Add(new SqlParameter("password", "dummyPass"));
            cmd.Parameters.Add(new SqlParameter("active", 1));
            cmd.Parameters.Add(new SqlParameter("session", ""));
            cmd.Parameters.Add(new SqlParameter("is_admin", "0"));

            int userId = (int)cmd.ExecuteScalar();

            string encryptedPassword = Hash.computeHash(password, userId.ToString());

            query = "update users set password = @password where id=@userId";
            cmd = new SqlCommand(query, conn);
            cmd.Parameters.Add(new SqlParameter("password", encryptedPassword));
            cmd.Parameters.Add(new SqlParameter("userId", userId));
            cmd.ExecuteScalar();

            return userId;
        }

        public static string login(string email, string password)
        {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcartrust"].ConnectionString);
            conn.Open();

            string query = "select id,password,email from users where email = @email";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.Add(new SqlParameter("email", email));

            SqlDataReader reader = cmd.ExecuteReader();
            string id, storedPassword, storedEmail, hashedPassword;

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    id = reader.GetInt32(0).ToString();
                    storedPassword = reader.GetString(1);
                    storedEmail = reader.GetString(2);

                    hashedPassword = Hash.computeHash(password, id);
                    if (storedPassword.Equals(hashedPassword)) {
                        string sessionHash = Hash.computeHash(storedEmail.ToString(), id.ToString());
                        User.saveSession(id, sessionHash);
                        return sessionHash;
                    }
                }
            }

            return "";
        }

        private static bool saveSession(string id, string sessionHash)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcartrust"].ConnectionString);
            conn.Open();

            string query = "update users set usession=@session where id = @id";

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.Add(new SqlParameter("session", sessionHash));
            cmd.Parameters.Add(new SqlParameter("id", id));

            cmd.ExecuteScalar();
            return true;
        }

        public static bool checkAuth(string authSession)
        {
            if (string.IsNullOrEmpty(authSession)) {
                return false;
            }

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcartrust"].ConnectionString);
            conn.Open();

            string query = "select id from users where usession = @session";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.Add(new SqlParameter("session", authSession));

            SqlDataReader reader = cmd.ExecuteReader();
           
            if (reader.HasRows)
            {
                return true;
            }

            return false;
        }

        public static bool checkAdmin(string authSession)
        {
            if (string.IsNullOrEmpty(authSession))
            {
                return false;
            }

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcartrust"].ConnectionString);
            conn.Open();

            string query = "select isAdmin from users where usession = @session";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.Add(new SqlParameter("session", authSession));

            SqlDataReader reader = cmd.ExecuteReader();

            if (!reader.HasRows)
            {
                return false;
            }

            reader.Read();
            if (reader.GetByte(0) != 0) {
                return true;
            }

            return false;
        }
        public static object getUserBySession(string authSession)
        {
            if (string.IsNullOrEmpty(authSession))
            {
                return false;
            }

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcartrust"].ConnectionString);
            conn.Open();

            string query = "select id,user_name,email,active from users where usession = @session";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.Add(new SqlParameter("session", authSession));

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                reader.Read();
                AuthUser user = new AuthUser(
                    reader.GetInt32(0).ToString(),
                    reader.GetString(1),
                    reader.GetString(2)
                    );
                return user;
            }

            return false;
        }
        public static bool updateUser(string id, string userName, string email, string active, string isAdmin)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcartrust"].ConnectionString);
            conn.Open();

            string query = "update users set user_name=@userName, email=@email, active=@active, isAdmin=@isAdmin where id = @id";

            SqlCommand cmd = new SqlCommand(query, conn);
            
            cmd.Parameters.Add(new SqlParameter("id", id));
            cmd.Parameters.Add(new SqlParameter("userName", userName));
            cmd.Parameters.Add(new SqlParameter("email", email));
            cmd.Parameters.Add(new SqlParameter("active", active));
            cmd.Parameters.Add(new SqlParameter("isAdmin", isAdmin));

            cmd.ExecuteScalar();
            return true;
        }

        public static bool deleteUser(string id)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcartrust"].ConnectionString);
            conn.Open();

            string query = "delete users where id = @id";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.Add(new SqlParameter("id", id));

            cmd.ExecuteScalar();
            return true;
        }
        
        public static bool passwordReset(string email, string password)
        {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcartrust"].ConnectionString);
            conn.Open();

            string query = "select id from users where email = @email";
            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.Add(new SqlParameter("email", email));

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows) {

                reader.Read();

                int userId = reader.GetInt32(0);
                query = "update users set password = @password where email = @email";
                SqlCommand passCmd = new SqlCommand(query, conn);

                string encryptedPassword = Hash.computeHash(password, userId.ToString());
                passCmd.Parameters.Add(new SqlParameter("password", encryptedPassword));
                passCmd.Parameters.Add(new SqlParameter("email", email));
                reader.Close();
                passCmd.ExecuteScalar();
                return true;
            }

            return false;
        }

        public static string generatePassword()
        {
            StringBuilder builder = new StringBuilder();
            Random random = new Random((int)DateTime.Now.Ticks);
            for (int i = 0; i <= 7; i++) {
                int charType = random.Next(1, 4);
                random.NextDouble();
                Console.Write(charType);
                if (charType == 1)
                {
                    builder.Append(randomString(1,true, random));
                }
                if (charType == 2) {
                    builder.Append(randomString(1, false, random));
                }
                if (charType == 3)
                {
                    builder.Append(randomNumber(0, 9, random));
                }
            }
            return builder.ToString();
        }

        
        private static string randomString(int size, bool lowerCase, Random rnd)
        {
            StringBuilder builder = new StringBuilder();
            int tryNum = rnd.Next(1, 30);
            
            char ch;
            for (int i = 0; i < size; i++)
            {
                ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * rnd.NextDouble() + 65)));
                builder.Append(ch);
            }
            if (lowerCase)
                return builder.ToString().ToLower();
            return builder.ToString();
        }

        private static int randomNumber(int min, int max, Random random)
        {
            return random.Next(min, max);
        }

    }
}