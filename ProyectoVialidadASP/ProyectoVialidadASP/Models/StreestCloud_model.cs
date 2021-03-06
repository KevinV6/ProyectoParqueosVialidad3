using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Google.Cloud.Firestore;


namespace ProyectoVialidadASP.Models
{
    public class StreestCloud_model
    {
        FirestoreDb database;
        public void Start()
        {
            //string path = "C:\\Program Files (x86)\\IIS Express\\Content\\proyectovialidadasp-firebase-adminsdk-54nx2-7d92d97e2f.json";
            string path = AppDomain.CurrentDomain.BaseDirectory + @"proyectovialidadaspKey.json";
            Environment.SetEnvironmentVariable("GOOGLE_APPLICATION_CREDENTIALS", path);

            database = FirestoreDb.Create("proyectovialidadasp");
        } 

        public void AddCloudDataBase(Street street)
        {
            Start();
            DocumentReference coll = database.Collection("Streets").Document(street.IdStreet);
            Dictionary<string, object> data = new Dictionary<string, object>()
            {
                {"IdStreet",street.IdStreet },
                {"StatusStreet",street.StatusStreet.ToString() },
                {"SiteStreet",street.SiteStreet },
                {"Name",street.Name },
                {"Description ",street.Description },
                {"ProgrammingDate ",street.ProgrammingDate },
                {"StartTime",street.StartTime },
                {"EndTime",street.EndTime },
                {"InitialLatitude",double.Parse(street.InitialLatitude.Replace(".",",")) },
                {"InitialLongitude",double.Parse(street.InitialLongitude.Replace(".",",")) },
                {"EndLatitude",double.Parse(street.EndLatitude.Replace(".",",")) },
                {"EndLongitude",double.Parse(street.EndLongitude.Replace(".",",")) },
                {"UrlImage ",street.UrlImage },
                {"NameImage ",street.NameImage },
            };
            coll.SetAsync(data);
        }

        public async void UpdateCloudStreet(Street street)
        {
            try
            {
                Start();
                DocumentReference docref = database.Collection("Streets").Document(street.IdStreet);
                Dictionary<string, object> data = new Dictionary<string, object>()
            {
                {"IdStreet",street.IdStreet },
                {"StatusStreet",street.StatusStreet.ToString() },
                {"SiteStreet",street.SiteStreet },
                {"Name",street.Name },
                {"Description ",street.Description },
                {"ProgrammingDate ",street.ProgrammingDate },
                {"StartTime",street.StartTime },
                {"EndTime",street.EndTime },
                {"InitialLatitude",double.Parse(street.InitialLatitude.Replace(".",",")) },
                {"InitialLongitude",double.Parse(street.InitialLongitude.Replace(".",",")) },
                {"EndLatitude",double.Parse(street.EndLatitude.Replace(".",",")) },
                {"EndLongitude",double.Parse(street.EndLongitude.Replace(".",",")) },
                {"UrlImage ",street.UrlImage },
                {"NameImage ",street.NameImage },
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