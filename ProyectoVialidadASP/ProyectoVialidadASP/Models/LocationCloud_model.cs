using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Google.Cloud.Firestore;

namespace ProyectoVialidadASP.Models
{
    public class LocationCloud_model
    {
        FirestoreDb database;
        public void Start()
        {
            string path = "C:\\Program Files (x86)\\IIS Express\\Content\\proyectovialidadasp-firebase-adminsdk-54nx2-7d92d97e2f.json";
            Environment.SetEnvironmentVariable("GOOGLE_APPLICATION_CREDENTIALS", path);

            database = FirestoreDb.Create("proyectovialidadasp");
        }
        public void AddCloudDataBase(Location location)
        {
            Start();
            DocumentReference coll = database.Collection("Locations").Document(location.IdLocation);
            Dictionary<string, object> data = new Dictionary<string, object>()
            {
                {"IdLocation",location.IdLocation },
                {"StatusLocation",location.StatusLocation.ToString() },
                {"Name",location.Name },
                {"NameStreet",location.NameStreet },
                {"Latitude",double.Parse(location.Latitude.Replace(".",",")) },
                {"Longitude",double.Parse(location.Longitude.Replace(".",",")) },
                {"LatitudeTwo",double.Parse(location.EndLatitude.Replace(".",",")) },
                {"LongitudeTwo",double.Parse(location.EndLongitude.Replace(".",",")) },
                {"Parking",location.Parking.ToString() },
                {"ParkingSpaces",location.ParkingSpaces.ToString() },
                {"Price",location.Price },
                {"Description",location.Description },
                {"UrlImage",location.UrlImage },
                {"NameImage",location.NameImage },
                {"UrlImageDesign",location.UrlImageDesign },
                {"NameImageDesign",location.NameImageDesign }
            };
            coll.SetAsync(data);
        }

        public async void UpdateCloudLocation(Location location)
        {
            try
            {
                Start();
                DocumentReference docref = database.Collection("Locations").Document(location.IdLocation);
                Dictionary<string, object> data = new Dictionary<string, object>()
            {
                {"IdLocation",location.IdLocation },
                {"StatusLocation",location.StatusLocation.ToString() },
                {"Name",location.Name },
                {"NameStreet",location.NameStreet },

                {"Latitude",double.Parse(location.Latitude.Replace(".",",")) },
                {"Longitude",double.Parse(location.Longitude.Replace(".",",")) },
                {"LatitudeTwo",double.Parse(location.EndLatitude.Replace(".",",")) },
                {"LongitudeTwo",double.Parse(location.EndLongitude.Replace(".",",")) },
                {"Parking",location.Parking.ToString() },
                {"ParkingSpaces",location.ParkingSpaces.ToString() },
                {"Price",location.Price },
                {"Description",location.Description },
                {"UrlImage",location.UrlImage },
                {"NameImage",location.NameImage },
                {"UrlImageDesign",location.UrlImageDesign },
                {"NameImageDesign",location.NameImageDesign }
            };

                DocumentSnapshot snap = await docref.GetSnapshotAsync();
                if (snap.Exists)
                {
                    await docref.SetAsync(data);
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
           
        }
    }
}