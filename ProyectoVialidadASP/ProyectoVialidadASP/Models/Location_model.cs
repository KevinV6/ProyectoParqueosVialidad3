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
    /// Nombre de la aplicación: Location_model
    /// Nombre del desarrollador: Valeria Delgadillo, Juan Jose Encinas
    /// Fecha de creación: 08/10/2021 
    /// Fecha de modificación: 15/10/2021 
    /// </summary>
    /// <param name="datos"></param>
    /// <param name="file"></param>
    /// <returns></returns>
    /// 
    public class Location_model
    {
        #region Conexión  a fireBase
        IFirebaseConfig config = new FirebaseConfig
        {
            AuthSecret = "F23JUcUtvSmaKQAZh1ZlzSEPL4WQ4wQirbrl3xpT",
            BasePath = "https://proyectovialidadasp-default-rtdb.firebaseio.com/"
        };
        IFirebaseClient client;
        #endregion

        #region Desabilitar Parqueos
        public void DisableParking(Location location)
        {
            client = new FireSharp.FirebaseClient(config);
            FirebaseResponse response = client.Set("Locations/" + location.IdLocation, location);

        }
        #endregion

        #region Habilitar Parqueos
        public void EnableLocation(Location location)
        {
            client = new FireSharp.FirebaseClient(config);
            FirebaseResponse response = client.Set("Locations/" + location.IdLocation, location);
        }
        #endregion

        #region Listado de Parqueos
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
        #endregion

        #region Añadir un nuevo Parqueo
        public Location AddLocationsTofirebase(Location location)
        {
            client = new FireSharp.FirebaseClient(config);
            var data = location;
            PushResponse response = client.Push("Locations/", data);
            data.IdLocation = response.Result.name;
            SetResponse setResponse = client.Set("Locations/" + data.IdLocation, data);
            return location;
        }
        #endregion

        #region Llamado a firebase para la actualizacion de los datos
        public Location UpdateLocationFromFirebase(string idLocation)
        {
            client = new FireSharp.FirebaseClient(config);
            FirebaseResponse response = client.Get("Locations/" + idLocation);
            Location location = JsonConvert.DeserializeObject<Location>(response.Body);

            return location;
        }
        #endregion

        #region Actualizar un Parqueo
        public Location UpdateLocationFromFirebaseRedirect(Location location)
        {
            client = new FireSharp.FirebaseClient(config);
            SetResponse response = client.Set("Locations/" + location.IdLocation, location);
            return location;
        }
        #endregion
    }
}