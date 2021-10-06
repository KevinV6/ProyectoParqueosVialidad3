using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text.RegularExpressions;

namespace ProyectoVialidadASP.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Validar(FormCollection datos)
        {
            Regex r = new Regex("^[a-zA-Z0-9]+$");
            


                if (r.IsMatch(datos["userText"]) && r.IsMatch(datos["passText"]))
                {
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    if (r.IsMatch(datos["userText"]))
                    {
                        ViewBag.MessagePass = "No usar Caracteres especiales en el user ,";
                        return View("Login");
                    }
                    else
                    {
                        ViewBag.MessageUser = "No usar Caracteres especiales en la contraseña ,";
                        return View("Login");
                    }

                }
            
        }
    }
}