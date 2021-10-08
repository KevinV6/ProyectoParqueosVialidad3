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
    public class Street_model
    {
        IFirebaseConfig config = new FirebaseConfig
        {
            AuthSecret = "F23JUcUtvSmaKQAZh1ZlzSEPL4WQ4wQirbrl3xpT",
            BasePath = "https://proyectovialidadasp-default-rtdb.firebaseio.com/"
        };
        IFirebaseClient client;

        public List<Street> StreetListView()
        {
            client = new FireSharp.FirebaseClient(config);
            FirebaseResponse response = client.Get("Streets");
            dynamic data = JsonConvert.DeserializeObject<dynamic>(response.Body);
            var list = new List<Street>();
            foreach (var item in data)
            {
                list.Add(JsonConvert.DeserializeObject<Street>(((JProperty)item).Value.ToString()));
            }
            return list;
        }

        public void AddStreetTofirebase(Street street)
        {
            client = new FireSharp.FirebaseClient(config);
            var data = street;
            PushResponse response = client.Push("Streets/", data);
            data.IdStreet = response.Result.name;
            SetResponse setResponse = client.Set("Streets/" + data.IdStreet, data);
        }
    }
}