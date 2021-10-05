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
                Regex numAndLetters = new Regex("^[a-zA-Z0-9]+$");
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
                    return View("../Maps/Maps");
                }
                else
                {
                    @ViewBag.Message = message;
                    return View();
                }
            }
            else
            {
                return View();
            }
        }
        public ActionResult LocationsList()
        {
            return View();
        }
        public ActionResult UpdateLocation(FormCollection datos)
        {
            if (datos["name"] != null)
            {
                Regex numAndLetters = new Regex("^[a-zA-Z0-9]+$");
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
                    return View("../Maps/Maps");
                }
                else
                {
                    @ViewBag.Message = message;
                    return View();
                }
            }
            else
            {
                return View();
            }

        }


    }
}
