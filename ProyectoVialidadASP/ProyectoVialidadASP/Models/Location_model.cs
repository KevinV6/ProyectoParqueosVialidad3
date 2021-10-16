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

        public void DesabilitarParqueo(Location location)
        {
            client = new FireSharp.FirebaseClient(config);
            FirebaseResponse response = client.Set("Locations/" + location.IdLocation, location);

        }
        public void EnableLocation(Location location)
        {
            client = new FireSharp.FirebaseClient(config);
            FirebaseResponse response = client.Set("Locations/" + location.IdLocation, location);

        }

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

        public Location UpdateLocationFromFirebase(string idLocation)
        {
            client = new FireSharp.FirebaseClient(config);
            FirebaseResponse response = client.Get("Locations/" + idLocation);
            Location location1 = JsonConvert.DeserializeObject<Location>(response.Body);

            return location1;
        }

        public void UpdateLocationFromFirebaseRedirect(Location location)
        {
            client = new FireSharp.FirebaseClient(config);
            SetResponse response = client.Set("Locations/" + location.IdLocation, location);

        }
    }
}