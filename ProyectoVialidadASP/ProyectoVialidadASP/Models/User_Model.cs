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
    /// <summary>
    /// Nombre de la aplicación: User_Model
    /// Nombre del desarrollador:  Nicole Milenka Paredes Medrano
    /// Fecha de creación: 07/10/2021 
    /// </summary>
    /// <param name="datos"></param>
    /// <param name="file"></param>
    /// <returns></returns>
    /// 
    public class User_Model
    {
        //Conexion a Firebase
        #region Conexion
        IFirebaseConfig config = new FirebaseConfig
        {
            AuthSecret = "F23JUcUtvSmaKQAZh1ZlzSEPL4WQ4wQirbrl3xpT",
            BasePath = "https://proyectovialidadasp-default-rtdb.firebaseio.com/"
        };
        IFirebaseClient client;
        #endregion

        #region Login
        public bool Login(User u)
        {
            bool verified = false;

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
                    verified = true;
                }
            }

            return verified;
        }
        #endregion
    }
}