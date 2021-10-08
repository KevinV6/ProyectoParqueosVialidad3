using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoVialidadASP.Models
{
    public class Location
    {
        public string IdLocation { get; set; }
        public char StatusLocation { get; set; }
        public string Name { get; set; }
        public string NameStreet { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }
        public byte ParkingSpaces { get; set; }
        public double Price { get; set; }
        public string Image { get; set; }
        public string Description { get; set; }

        public Location(char statusLocation, string name, string nameStreet, string latitude, string longitude, byte parkingSpaces, double price, string image, string description)
        {
            StatusLocation = statusLocation;
            Name = name;
            NameStreet = nameStreet;
            Latitude = latitude;
            Longitude = longitude;
            ParkingSpaces = parkingSpaces;
            Price = price;
            Image = image;
            Description = description;
        }
    }
}