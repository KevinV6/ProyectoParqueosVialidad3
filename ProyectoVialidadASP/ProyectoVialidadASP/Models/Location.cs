﻿using System;
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
        public string Price { get; set; }
        public string Description { get; set; }
        public string UrlImage { get; set; }
        public string NameImage { get; set; }

        public Location()
        {

        }
        /// <summary>
        /// Insert
        /// </summary>
        /// <param name="statusLocation"></param>
        /// <param name="name"></param>
        /// <param name="nameStreet"></param>
        /// <param name="latitude"></param>
        /// <param name="longitude"></param>
        /// <param name="parkingSpaces"></param>
        /// <param name="price"></param>
        /// <param name="description"></param>
        /// <param name="urlImagen"></param>
        /// <param name="nameImage"></param>
        public Location(char statusLocation, string name, string nameStreet, string latitude, string longitude, byte parkingSpaces, string price, string description,string urlImage,string nameImage)
        {
            StatusLocation = statusLocation;
            Name = name;
            NameStreet = nameStreet;
            Latitude = latitude;
            Longitude = longitude;
            ParkingSpaces = parkingSpaces;
            Price = price;
            Description = description;
            UrlImage = urlImage;
            NameImage = nameImage;
        }
        /// <summary>
        /// Update
        /// </summary>
        /// <param name="idLocation"></param>
        /// <param name="statusLocation"></param>
        /// <param name="name"></param>
        /// <param name="nameStreet"></param>
        /// <param name="latitude"></param>
        /// <param name="longitude"></param>
        /// <param name="parkingSpaces"></param>
        /// <param name="price"></param>
        /// <param name="description"></param>
        public Location(string idLocation, char statusLocation, string name, string nameStreet, string latitude, string longitude, byte parkingSpaces, string price, string description)
        {
            IdLocation = idLocation;
            StatusLocation = statusLocation;
            Name = name;
            NameStreet = nameStreet;
            Latitude = latitude;
            Longitude = longitude;
            ParkingSpaces = parkingSpaces;
            Price = price;
            Description = description;
        }
    }
}