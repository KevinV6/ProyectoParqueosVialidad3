using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoVialidadASP.Controllers
{
    public class LocationsController : Controller
    {
        // GET: Locations
        public ActionResult Locations()
        {
            return View();
        }
        public ActionResult LocationsList()
        {
            return View();
        }
        public ActionResult LocationsStreetList()
        {
            return View();
        }
    }
}
