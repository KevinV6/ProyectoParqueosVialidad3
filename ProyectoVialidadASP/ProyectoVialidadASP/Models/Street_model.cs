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
    /// Nombre del desarrollador: Valeria Delgadillo, Juan Jose Encinas
    /// Fecha de creación: 08/10/2021 
    /// Fecha de modificación: 15/10/2021 
    /// </summary>
    /// <param name="datos"></param>
    /// <param name="file"></param>
    /// <returns></returns>
    /// 
    public class Street_model
    {
        #region Conexion
        IFirebaseConfig config = new FirebaseConfig
        {
            AuthSecret = "F23JUcUtvSmaKQAZh1ZlzSEPL4WQ4wQirbrl3xpT",
            BasePath = "https://proyectovialidadasp-default-rtdb.firebaseio.com/"
        };
        IFirebaseClient client;
        #endregion

        #region Metodo de Deshabilitar
        public void DisableStreet(Street street)
        {
            client = new FireSharp.FirebaseClient(config);
            FirebaseResponse response = client.Set("Streets/" + street.IdStreet, street);
        }
        #endregion

        #region Metodo de Habilitar
        public void EnableStreet(Street street)
        {
            client = new FireSharp.FirebaseClient(config);
            FirebaseResponse response = client.Set("Streets/" + street.IdStreet, street);
        }
        #endregion

        #region Metodo de listar las calles no disponibles
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
        #endregion

        #region Inserta Datos en FireBase
        public void AddStreetTofirebase(Street street)
        {
            client = new FireSharp.FirebaseClient(config);
            var data = street;
            PushResponse response = client.Push("Streets/", data);
            data.IdStreet = response.Result.name;
            SetResponse setResponse = client.Set("Streets/" + data.IdStreet, data);
        }
        #endregion

        #region Retorna datos para luego actulizar en firebase
        public Street UpdateStreetFromFirebase(string idStreet)
        {
            client = new FireSharp.FirebaseClient(config);
            FirebaseResponse response = client.Get("Streets/" + idStreet);
            Street street = JsonConvert.DeserializeObject<Street>(response.Body);

            return street;
        }
        #endregion

        #region Actualiza datos en Firebase
        public void UpdateStreetFromFirebaseRedirect(Street street)
        {
            client = new FireSharp.FirebaseClient(config);
            SetResponse response = client.Set("Streets/" + street.IdStreet, street);            

        }
        #endregion
    }
}