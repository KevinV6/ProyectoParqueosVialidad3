using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using ProyectoVialidadASP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;

namespace ProyectoVialidadASP.Controllers
{
    public class StreetsController : Controller
    {
        // GET: Streets


        public ActionResult Streets(FormCollection datos)
        {

            if (datos["NLugar"] != null)
            {

                string cutPrograming = datos["FProgramacion"];
                string programmingDate = cutPrograming.Substring(0, 10);

                Street street = new Street('V', datos["NLugar"], datos["NCalle"], datos["Descripcion"], programmingDate, datos["TiempoI"], datos["TiempoF"], datos["Latitud1"], datos["Longitud1"], datos["Latitud2"], datos["Longitud2"]);
                Street_model sm = new Street_model();
                sm.AddStreetTofirebase(street);
                return View();
            }
            else
            {
                return View();
            }

        }
        public ActionResult inhabilitarCalle(FormCollection form)
        {
            Street_model lm = new Street_model();
            Street lo = new Street();

            lo = lm.UpdateStreetFromFirebase(form["txtdelete"]);
            lo.StatusStreet = 'F';
            lm.DesabilitarStreet(lo);

            return Redirect("StreetsList");
        }
        public ActionResult EnableStreet(FormCollection form)
        {
            Street_model lm = new Street_model();
            Street lo = new Street();

            lo = lm.UpdateStreetFromFirebase(form["txtdelete"]);
            lo.StatusStreet = 'V';
            lm.DesabilitarStreet(lo);

            return Redirect("StreetsList");
        }

        public ActionResult StreetsList()
        {
            if (Session["user"] == null && Session["psw"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                Street_model lp = new Street_model();

                return View(lp.StreetListView());
            }
        }

        public ActionResult UpdateStreets(FormCollection datos)
        {
            if (datos["NLugar"] != null) //el boton se prime apenas ingresar a la pagina revisar
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
            else
            {
                if (Session["user"] == null && Session["psw"] == null)
                {
                    return RedirectToAction("Login", "Login");
                }
                else
                {
                    Street street = new Street();
                    Street_model sm = new Street_model();

                    street = sm.UpdateStreetFromFirebase(datos["txtidedit"]);

                    return View(street);
                }

            }


        }

        public ActionResult UpdateStreetsRedirect(FormCollection datos)
        {
            string cutPrograming = datos["FProgramacion"];
            string programmingDate = cutPrograming.Substring(0, 10);
            Street street = new Street(datos["txtId"], char.Parse(datos["txtStatus"]), datos["NCalle"], datos["NLugar"], datos["Descripcion"], programmingDate, datos["TiempoI"], datos["TiempoF"], datos["Latitud1"], datos["Longitud1"], datos["Latitud2"], datos["Longitud2"]);
            Street_model sm = new Street_model();
            sm.UpdateStreetFromFirebaseRedirect(street);

            return RedirectToAction("StreetsList");
        }
    }
}