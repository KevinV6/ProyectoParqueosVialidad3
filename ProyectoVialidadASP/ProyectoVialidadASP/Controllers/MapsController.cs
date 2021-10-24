using ProyectoVialidadASP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoVialidadASP.Controllers
{
    /// <summary>
    /// Nombre de la aplicación: MapsController
    /// Nombre del desarrollador: Juan Jose Encinas, Nicole Milenka Paredes Medrano
    /// Fecha de creación: 28/09/2021 
    /// Fecha de modficación: 17/10/2021 
    /// </summary>
    /// <param name="datos"></param>
    /// <param name="file"></param>
    /// <returns>Vista Login</returns>
    /// 
    public class MapsController : Controller
    {
        // GET: Maps
        #region Vista de mapa
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
        #endregion

        #region Retorna dato en formato Json de Firebase
        public JsonResult GetAllLocation()
        {
            Location_model location_Model = new Location_model();
            List<Location> list = location_Model.listLocationView();
            return Json(list, JsonRequestBehavior.AllowGet);
        }
        #endregion

        #region Retorna dato en formato Json de Firebase
        public JsonResult GetAllStreet()
        {
            Street_model street_Model = new Street_model();
            List<Street> list = street_Model.StreetListView();
            return Json(list, JsonRequestBehavior.AllowGet);
        }
        #endregion
    }
}