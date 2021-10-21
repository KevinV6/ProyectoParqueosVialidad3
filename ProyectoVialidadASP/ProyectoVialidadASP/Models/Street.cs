using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoVialidadASP.Models
{
    public class Street
    {
        public string IdStreet { get; set; }
        public char StatusStreet { get; set; }
        public string SiteStreet { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string ProgrammingDate { get; set; }
        public string StartTime { get; set; }
        public string EndTime { get; set; }
        public string InitialLatitude { get; set; }
        public string InitialLongitude { get; set; }
        public string EndLatitude { get; set; }
        public string EndLongitude { get; set; }
        public string UrlImage { get; set; }
        public string NameImage { get; set; }

        public Street()
        {

        }
        /// <summary>
        /// Insert
        /// </summary>
        /// <param name="statusStreet"></param>
        /// <param name="siteStreet"></param>
        /// <param name="name"></param>
        /// <param name="description"></param>
        /// <param name="programmingDate"></param>
        /// <param name="startTime"></param>
        /// <param name="endTime"></param>
        /// <param name="initialLatitude"></param>
        /// <param name="initialLongitude"></param>
        /// <param name="endLatitude"></param>
        /// <param name="endLongitude"></param>
        /// <param name="urlImage"></param>
        /// <param name="nameImage"></param>
        public Street(char statusStreet, string siteStreet, string name, string description, string programmingDate, string startTime, string endTime, string initialLatitude, string initialLongitude, string endLatitude, string endLongitude, string urlImage, string nameImage)
        {
            StatusStreet = statusStreet;
            SiteStreet = siteStreet;
            Name = name;
            Description = description;
            ProgrammingDate = programmingDate;
            StartTime = startTime;
            EndTime = endTime;
            InitialLatitude = initialLatitude;
            InitialLongitude = initialLongitude;
            EndLatitude = endLatitude;
            EndLongitude = endLongitude;
            UrlImage = urlImage;
            NameImage = nameImage;
        }
        /// <summary>
        /// Update
        /// </summary>
        /// <param name="idStreet"></param>
        /// <param name="statusStreet"></param>
        /// <param name="siteStreet"></param>
        /// <param name="name"></param>
        /// <param name="description"></param>
        /// <param name="programmingDate"></param>
        /// <param name="startTime"></param>
        /// <param name="endTime"></param>
        /// <param name="initialLatitude"></param>
        /// <param name="initialLongitude"></param>
        /// <param name="endLatitude"></param>
        /// <param name="endLongitude"></param>
        /// <param name="urlImage"></param>
        /// <param name="nameImage"></param>
        public Street(string idStreet, char statusStreet, string siteStreet, string name, string description, string programmingDate, string startTime, string endTime, string initialLatitude, string initialLongitude, string endLatitude, string endLongitude, string urlImage, string nameImage)
        {
            IdStreet = idStreet;
            StatusStreet = statusStreet;
            SiteStreet = siteStreet;
            Name = name;
            Description = description;
            ProgrammingDate = programmingDate;
            StartTime = startTime;
            EndTime = endTime;
            InitialLatitude = initialLatitude;
            InitialLongitude = initialLongitude;
            EndLatitude = endLatitude;
            EndLongitude = endLongitude;
            UrlImage = urlImage;
            NameImage = nameImage;
        }
    }
}