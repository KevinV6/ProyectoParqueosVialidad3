using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoVialidadASP.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        /// <summary>
        /// Nombre de la aplicación: HomeController
        /// Nombre del desarrollador: Nicole Milenka Paredes Medrano
        /// Fecha de creación: 07/10/2021 
        /// </summary>
        /// <returns>Retorna la vista del Home</returns>
        /// Este metodo esta restringido para su uso
        /// </copyright> 
        /// <author>[Nicole Milenka Paredes Medrano]</author> 
        public ActionResult Index()
        {
            if (Session["user"] == null && Session["psw"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                return View();
            }
        }
    }
}