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
    /// <summary>
    /// Nombre de la aplicación: LoginController
    /// Nombre del desarrollador: Daril Alexander Lopez Valverde, Nicole Milenka Paredes Medrano
    /// Fecha de creación: 28/09/2021 
    /// Fecha de modficación: 07/10/2021 
    /// </summary>
    /// <param name="datos"></param>
    /// <param name="file"></param>
    /// <returns>Vista Login</returns>
    /// 
    public class LoginController : Controller
    {

        // GET: Login
        #region Vista Login
        public ActionResult Login()
        {
            return View();
        }
        #endregion

        #region Cierre de sesion
        public ActionResult Logout()
        {
            Session.Abandon();
            return RedirectToAction("Login", "Login");
        }
        #endregion

        #region Valida si el usuario se encuentra en la base de datos
        [HttpPost]
        public ActionResult Validate(FormCollection datos)
        {
            User_Model user_Model = new User_Model();
            bool verified = user_Model.Login(new User(datos["userText"], datos["passText"]));

            if (verified)
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
        #endregion
    }
}