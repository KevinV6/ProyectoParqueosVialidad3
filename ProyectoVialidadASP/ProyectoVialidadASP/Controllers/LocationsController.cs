using ProyectoVialidadASP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text.RegularExpressions;

namespace ProyectoVialidadASP.Controllers
{
    public class LocationsController : Controller
    {
        // GET: Locations
        public ActionResult Locations(FormCollection datos)
        {
            if (datos["name"] != null)
            {
                /*Regex numAndLetters = new Regex("^[a-zA-Z0-9]+$");
                Regex nums = new Regex("^[0-9]+$");
                bool res = true;
                string message = "";
                if (numAndLetters.IsMatch(datos["name"]) != true)
                {
                    message = message + "No usar Caracteres especiales en el nombre ,";
                    res = false;
                }

                if (nums.IsMatch(datos["latitude"]) != true)
                {
                    message = message + "Solo es permitido numeros en la latitud ,";
                    res = false;
                }
                if (numAndLetters.IsMatch(datos["nameStreet"]) != true)
                {
                    message = message + "No usar Caracteres especiales en el nombre de la calle ,";
                    res = false;
                }
                if (nums.IsMatch(datos["lenght"]) != true)
                {
                    message = message + "Solo es permitido numeros en la logitud ,";
                    res = false;
                }
                if (nums.IsMatch(datos["parkingSpaces"]) != true)
                {
                    message = message + "Solo es permitido numeros en el numero de estacionamientos ,";
                    res = false;
                }
                if (nums.IsMatch(datos["price"]) != true)
                {
                    message = message + "Solo es permitido numeros en el precio ,";
                    res = false;
                }
                if (numAndLetters.IsMatch(datos["description"]) != true)
                {
                    message = message + "No usar Caracteres especiales en la descripcion ,";
                    res = false;
                }

                if (res)
                {
                    if (Session["user"] == null && Session["psw"] == null)
                    {
                        return RedirectToAction("Login", "Login");
                    }
                    else
                    {
                        return View("../Maps/Maps");
                    }
                    
                }
                else
                {
                    @ViewBag.Message = message;
                    if (Session["user"] == null && Session["psw"] == null)
                    {
                        return RedirectToAction("Login", "Login");
                    }
                    else
                    {
                        
                    }
                }*/
                Location location = new Location('V', datos["name"], datos["nameStreet"], datos["latitude"], datos["lenght"], byte.Parse(datos["parkingSpaces"]), datos["price"], datos["description"]);
                Location_model lp = new Location_model();
                lp.AddLocationsTofirebase(location);
                return View();
            }
            else
            {
               /* if (Session["user"] == null && Session["psw"] == null)
                {
                    return RedirectToAction("Login", "Login");
                }
                else
                {
                    
                }*/
                return View();
            }
        }

        public ActionResult inhabilitarParqueo(FormCollection form)
        {
            Location_model lm = new Location_model();
            Location lo = new Location();

            lo = lm.UpdateLocationFromFirebase(form["txtdelete"]);
            lo.StatusLocation = 'F';
            lm.DesabilitarParqueo(lo);

            return Redirect("LocationsList");
        }

        public ActionResult LocationsList()
        {
            if (Session["user"] == null && Session["psw"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                Location_model lp = new Location_model();

                return View(lp.listLocationView());
            }
            
        }

        public ActionResult UpdateLocation(FormCollection datos)
        {
            if (datos["name"] != null)
            {
                /*Regex numAndLetters = new Regex("^[a-zA-Z0-9]+$");
                Regex nums = new Regex("^[0-9]+$");
                bool res = true;
                string message ="";
                if (numAndLetters.IsMatch(datos["name"])!= true)
                {
                    message = message + "No usar Caracteres especiales en el nombre ," ;
                    res = false;
                }

                if (nums.IsMatch(datos["latitude"]) != true)
                {
                    message = message + "Solo es permitido numeros en la latitud ," ;
                    res = false;
                }
                if (numAndLetters.IsMatch(datos["nameStreet"]) != true)
                {
                    message = message + "No usar Caracteres especiales en el nombre de la calle ,";
                    res = false;
                }
                if (nums.IsMatch(datos["lenght"]) != true)
                {
                    message = message + "Solo es permitido numeros en la logitud ," ;
                    res = false;
                }
                if (nums.IsMatch(datos["parkingSpaces"]) != true)
                {
                    message = message + "Solo es permitido numeros en el numero de estacionamientos ," ;
                    res = false;
                }
                if (nums.IsMatch(datos["price"]) != true)
                {
                    message = message + "Solo es permitido numeros en el precio ," ;
                    res = false;
                }
                if (numAndLetters.IsMatch(datos["description"]) != true)
                {
                    message = message + "No usar Caracteres especiales en la descripcion ,";
                    res = false;
                }

                if (res)
                {
                    
                    if (Session["user"] == null && Session["psw"] == null)
                    {
                        return RedirectToAction("Login", "Login");
                    }
                    else
                    {
                        return View("../Maps/Maps");
                    }
                }
                else
                {
                    @ViewBag.Message = message;
                    */
                    if (Session["user"] == null && Session["psw"] == null)
                    {
                        return RedirectToAction("Login", "Login");
                    }
                    else
                    {
                        return View();
                    }
                //}
            }
            else
            {
                if (Session["user"] == null && Session["psw"] == null)
                {
                    return RedirectToAction("Login", "Login");
                }
                else
                {
                    Location location = new Location();
                    Location_model lm = new Location_model();

                    location = lm.UpdateLocationFromFirebase(datos["txtidedit"]);

                    return View(location);
                }
            }

        }

        public ActionResult UpdateLocationRedirect(FormCollection datos)
        {
            Location location = new Location(datos["txtId"], char.Parse(datos["txtStatus"]), datos["name"], datos["nameStreet"], datos["latitude"], datos["lenght"], byte.Parse(datos["parkingSpaces"]), datos["price"], datos["description"]);
            Location_model lm = new Location_model();
            lm.UpdateLocationFromFirebaseRedirect(location);

            return RedirectToAction("LocationsList");
        }

    }
}
