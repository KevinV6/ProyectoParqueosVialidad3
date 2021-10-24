using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace ProyectoVialidadASP
{
    public class RouteConfig
    {

        /// <summary> 
        /// Nombre de la aplicación: RouteConfig 
        /// Nombre del desarrollador: Daril Alexander Lopez Valverde
        /// Fecha de creación: 23/09/2021 
        /// </summary> 

        // <copyright file="RouteConfig.cs" company="UNIVALLE"> 

        // Esta clase está restringida para su uso, sin la previa autorización del departamento de NETValle. 
        // </copyright> 
        // <author>[Daril Alexander Lopez Valverde]</author> 

        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Login", action = "Login", id = UrlParameter.Optional }
            );
        }
    }
}
