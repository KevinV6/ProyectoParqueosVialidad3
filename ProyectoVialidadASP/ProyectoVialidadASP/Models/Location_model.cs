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
    public class Location_model
    {
        //Conexion in firebase
        IFirebaseConfig config = new FirebaseConfig
        {
            AuthSecret = "F23JUcUtvSmaKQAZh1ZlzSEPL4WQ4wQirbrl3xpT",
            BasePath = "https://proyectovialidadasp-default-rtdb.firebaseio.com/"
        };
        IFirebaseClient client;

        public List<Location> listLocationView()
        {
            client = new FireSharp.FirebaseClient(config);
            FirebaseResponse response = client.Get("Locations");
            dynamic data = JsonConvert.DeserializeObject<dynamic>(response.Body);
            var list = new List<Location>();
            foreach (var item in data)
            {
                list.Add(JsonConvert.DeserializeObject<Location>(((JProperty)item).Value.ToString()));
            }
            return list;
        }

        public void AddLocationsTofirebase(Location location)
        {
            client = new FireSharp.FirebaseClient(config);
            var data = location;
            PushResponse response = client.Push("Locations/", data);
            data.IdLocation = response.Result.name;
            SetResponse setResponse = client.Set("Locations/" + data.IdLocation, data);

        }
    }
}