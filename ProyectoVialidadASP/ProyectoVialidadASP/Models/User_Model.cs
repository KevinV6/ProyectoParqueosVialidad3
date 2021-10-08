using FireSharp.Config;
using FireSharp.Interfaces;
using FireSharp.Response;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoVialidadASP.Models
{
    public class User_Model
    {
        //Conexion a Firebase
        IFirebaseConfig config = new FirebaseConfig
        {
            AuthSecret = "F23JUcUtvSmaKQAZh1ZlzSEPL4WQ4wQirbrl3xpT",
            BasePath = "https://proyectovialidadasp-default-rtdb.firebaseio.com/"
        };
        IFirebaseClient client;

        public bool Login(User u)
        {
            bool verificado = false;

            client = new FireSharp.FirebaseClient(config);
            FirebaseResponse response = client.Get("Administrators");
            dynamic data = JsonConvert.DeserializeObject<dynamic>(response.Body);
            var list = new List<User>();
            foreach (var item in data)
            {
                list.Add(JsonConvert.DeserializeObject<User>(((JProperty)item).Value.ToString()));
            }

            foreach (var item in list)
            {
                string password = string.Empty;
                byte[] decryted = Convert.FromBase64String(item.password);
                password = System.Text.Encoding.Unicode.GetString(decryted);
                if (item.userName.Equals(u.userName) && password.Equals(u.password))
                {
                    verificado = true;
                }
            }

            return verificado;
        }

    }
}