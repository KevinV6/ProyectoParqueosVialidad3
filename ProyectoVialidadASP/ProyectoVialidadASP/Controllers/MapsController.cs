using ProyectoVialidadASP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoVialidadASP.Controllers
{
    public class MapsController : Controller
    {
        // GET: Maps
        public ActionResult Maps()
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
        public JsonResult GetAllLocation()
        {
            Location_model lp = new Location_model();
            List<Location> list = lp.listLocationView();
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetAllStreet()
        {
            Street_model lp = new Street_model();
            List<Street> list = lp.StreetListView();
            return Json(list, JsonRequestBehavior.AllowGet);
        }
    }
}