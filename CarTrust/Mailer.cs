using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace CarTrust
{
    public class Mailer
    {
        public static bool sendPasswordRecoveryLetter(string recipient, string newPassword)
        {
            MailMessage message = new MailMessage();

            message.From = new MailAddress("antnorv95@gmail.com", "MyWeb Site");
            message.To.Add(new MailAddress(recipient));
            message.Subject = "CarTrust password recovery";
            message.Body = "Your password has been reset. New password: " + newPassword + " was generated automatically";

            return sendEmail(message, recipient);
        }

        private static bool sendEmail(MailMessage mail, string recipient) {

            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            
            
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.EnableSsl = true;
            smtpClient.Credentials = new System.Net.NetworkCredential("antnorv95@gmail.com", "norv95gmail");

            try
            {
                smtpClient.Send(mail);
                return true;
            }
            catch (SmtpException smex)
            {
                return false;
            }
            catch (Exception ex) {
                return false;
            }
            
        }
    }
}