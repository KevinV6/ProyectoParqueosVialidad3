using FireSharp.Config;
using FireSharp.Interfaces;
using FireSharp.Response;
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
    public class LoginController : Controller
    {

        // GET: Login
        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Logout()
        {
            Session.Abandon();
            return RedirectToAction("Login", "Login");
        }

        [HttpPost]
        public ActionResult Validar(FormCollection datos)
        {
            User_Model user_Model = new User_Model();
            bool verificado = user_Model.Login(new User(datos["userText"], datos["passText"]));

            if (verificado)
            {
                Session["user"] = datos["userText"];
                Session["psw"] = datos["passText"];

                if (Session["user"] == null && Session["psw"] == null)
                {
                    return RedirectToAction("Login", "Login");
                }
                else
                {
                    return RedirectToAction("Index", "Home");
                }

            }

            else
            {
                ViewBag.MessagePass = "Nombre de Usuario o Contraseña incorrectos";

                return View("Login");

            }
        }
    }
}