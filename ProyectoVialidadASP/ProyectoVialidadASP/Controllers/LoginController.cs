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
        //Conexion a Firebase
        IFirebaseConfig config = new FirebaseConfig
        {
            AuthSecret = "F23JUcUtvSmaKQAZh1ZlzSEPL4WQ4wQirbrl3xpT",
            BasePath = "https://proyectovialidadasp-default-rtdb.firebaseio.com/"
        };
        IFirebaseClient client;


        // GET: Login
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Validar(FormCollection datos)
        {
            bool verificado = false;
            Regex r = new Regex("^[a-zA-Z0-9]+$");
            if (r.IsMatch(datos["userText"]) && r.IsMatch(datos["passText"]))
            {
                client = new FireSharp.FirebaseClient(config);
                FirebaseResponse response = client.Get("Administrators");
                dynamic data = JsonConvert.DeserializeObject<dynamic>(response.Body);
                var list = new List<Administrator>();
                foreach (var item in data)
                {
                    list.Add(JsonConvert.DeserializeObject<Administrator>(((JProperty)item).Value.ToString()));
                }

                foreach (var item in list)
                {
                    string password = string.Empty;
                    byte[] decryted = Convert.FromBase64String(item.password);
                    password = System.Text.Encoding.Unicode.GetString(decryted);
                    if (item.userName.Equals(datos["userText"]) && password.Equals(datos["passText"]))
                    {
                        verificado = true;
                    }
                }

                if (verificado)
                {
                    Session["user"] = datos["userText"];
                    Session["psw"] = datos["passText"];
                    return View("../Maps/Maps");
                }

                else
                {
                    ViewBag.MessagePass = "Nombre de Usuario o Contraseña incorrectos";
                    return View("Login");
                }

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