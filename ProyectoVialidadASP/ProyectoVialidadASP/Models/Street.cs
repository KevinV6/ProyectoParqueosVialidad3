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

        public Street(char statusStreet, string siteStreet, string name, string description, string programmingDate, string startTime, string endTime, string initialLatitude, string initialLongitude, string endLatitude, string endLongitude)
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
        }
    }
}