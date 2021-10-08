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
                /* Regex numAndLetters = new Regex("^[a-zA-Z0-9]+$");
                 Regex nums = new Regex("^[0-9]+$");
                 bool res = true;
                 string message = "";
                 if (numAndLetters.IsMatch(datos["NLugar"]) != true)
                 {
                     message = message + "No usar Caracteres especiales1 en el nombre del lugar ,";
                     res = false;
                 }
                 if (numAndLetters.IsMatch(datos["NCalle"]) != true)
                 {
                     message = message + "No usar Caracteres especiales1 en el nombre de la calle ,";
                     res = false;
                 }
                 if (numAndLetters.IsMatch(datos["Descripcion"]) != true)
                 {
                     message = message + "No usar Caracteres especiales en la Descripcion ,";
                     res = false;
                 }
                 if (nums.IsMatch(datos["Latitud1"]) != true)
                 {
                     message = message + "Solo es permitido numeros en la latitud ,";
                     res = false;
                 }
                 if (nums.IsMatch(datos["Latitud2"]) != true)
                 {
                     message = message + "Solo es permitido numeros en la latitud ,";
                     res = false;
                 }
                 if (nums.IsMatch(datos["Longitud1"]) != true)
                 {
                     message = message + "Solo es permitido numeros en la Longitud ,";
                     res = false;
                 }
                 if (nums.IsMatch(datos["Longitud2"]) != true)
                 {
                     message = message + "Solo es permitido numeros en la Longitud ,";
                     res = false;
                 }
                 if (res)
                 {
                     return View("../Maps/Maps");
                 }
                 else
                 {
                     @ViewBag.Message1 = message;

                     if (Session["user"] == null && Session["psw"] == null)
                     {
                         return RedirectToAction("Login", "Login");
                     }
                     else
                     {
                         return View();
                     }
                 }*/
                string cutPrograming = datos["FProgramacion"];
                string programmingDate = cutPrograming.Substring(0, 10);

                Street street = new Street('V', datos["NLugar"], datos["NCalle"], datos["Descripcion"], programmingDate, datos["TiempoI"], datos["TiempoF"], datos["Latitud1"], datos["Longitud1"], datos["Latitud2"], datos["Longitud2"]);
                Street_model sm = new Street_model();
                sm.AddStreetTofirebase(street);
                return View();
            }
            else
            {
                /*if (Session["user"] == null && Session["psw"] == null)
                {
                    return RedirectToAction("Login", "Login");
                }
                else
                {
                    return View();
                }*/
                return View();
            }

        }
        public ActionResult StreetsList()
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

        public ActionResult UpdateStreets(FormCollection datos)
        {
            if (datos["NLugar"] != null) //el boton se prime apenas ingresar a la pagina revisar
            {
                Regex numAndLetters = new Regex("^[a-zA-Z0-9]+$");
                Regex nums = new Regex("^[0-9]+$");
                bool res = true;
                string message = "";
                if (numAndLetters.IsMatch(datos["NLugar"]) != true)
                {
                    message = message + "No usar Caracteres especiales1 ,";
                    res = false;
                }
                if (numAndLetters.IsMatch(datos["NCalle"]) != true)
                {
                    message = message + "No usar Caracteres especiales1 ,";
                    res = false;
                }
                if (numAndLetters.IsMatch(datos["Descripcion"]) != true)
                {
                    message = message + "No usar Caracteres especiales ,";
                    res = false;
                }
                if (nums.IsMatch(datos["Latitud1"]) != true)
                {
                    message = message + "Solo es permitido numeros ,";
                    res = false;
                }
                if (nums.IsMatch(datos["Latitud2"]) != true)
                {
                    message = message + "Solo es permitido numeros ,";
                    res = false;
                }
                if (nums.IsMatch(datos["Longitud1"]) != true)
                {
                    message = message + "Solo es permitido numeros ,";
                    res = false;
                }
                if (nums.IsMatch(datos["Longitud2"]) != true)
                {
                    message = message + "Solo es permitido numeros ,";
                    res = false;
                }
                if (res)
                {
                    return View("../Maps/Maps");
                }
                else
                {
                    @ViewBag.Message1 = message;

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
            else
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
}