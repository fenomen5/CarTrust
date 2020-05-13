using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace CarTrust
{
    public class Hash
    {
        public static string computeHash(string password, string salt)
        {
            byte[] bytePassword = Encoding.ASCII.GetBytes(password + salt);

            HashAlgorithm algorithm = SHA512.Create();

            byte[] hashBytePassword = algorithm.ComputeHash(bytePassword);

            return Convert.ToBase64String(hashBytePassword);
        }
    }
}