using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;

namespace ProyectoVialidadASP.Models
{
    public class ServicesNotification_model
    {

        string tokenServidor = "AAAAsR9PavA:APA91bESFa8wnhRyVLbrvEDvtFP_4aN98oSJPFwxy6ILOsoGvxKnFMWI8hU1jy0I6GUBZdsrsx-FPBPCmCqdthS8Grk3opLbUUOrg7DZp-08apft02jtOXk_VUpn5DoGnLU3WrKaM2mH";
        WebRequest tRequest = WebRequest.Create("https://fcm.googleapis.com/fcm/send");
        string topic = "/topics/notificationData";
        public string MessageText { get; set; }
        public string TitleMessage { get; set; }


        public ServicesNotification_model()
        {
            tRequest.Method = "post";
            tRequest.Headers.Add(string.Format("Authorization: key={0}", tokenServidor));
            tRequest.ContentType = "application/json";
        }

        public void SendMessage()
        {
            var payload = new
            {
                to = topic,
                priority = "high",
                content_available = true,
                notification = new
                {
                    body = MessageText,
                    title = TitleMessage,
                    badge = 1
                }
            };

            string postbody = JsonConvert.SerializeObject(payload).ToString();
            Byte[] byteArray = Encoding.UTF8.GetBytes(postbody);
            tRequest.ContentLength = byteArray.Length;
            using (Stream dataStream = tRequest.GetRequestStream())
            {
                dataStream.Write(byteArray, 0, byteArray.Length);
                using (WebResponse tResponse = tRequest.GetResponse())
                {
                    using (Stream dataStreamResponse = tResponse.GetResponseStream())
                    {
                        if (dataStreamResponse != null) using (StreamReader tReader = new StreamReader(dataStreamResponse))
                            {
                                String sResponseFromServer = tReader.ReadToEnd();
                                Console.WriteLine(sResponseFromServer);
                            }
                    }
                }


            }
        }
    }
}