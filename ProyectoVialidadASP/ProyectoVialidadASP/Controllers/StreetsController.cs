using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using ProyectoVialidadASP.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace ProyectoVialidadASP.Controllers
{
    /// <summary>
    /// Nombre de la aplicación: StreetController
    /// Nombre del desarrollador:  Daril Alexander Lopez Valverde, Kevin Bautista Coro, Jose Bascope
    /// Fecha de creación: 29/09/2021 
    /// Fecha de modficación: 20/10/2021 
    /// </summary>
    /// <param name="datos"></param>
    /// <param name="file"></param>
    /// <returns>Vista Lugares no disponibles</returns>
    /// 
    public class StreetsController : Controller
    {
        // GET: Streets
        #region Inserta una calle no disponible
        public async Task<ActionResult> Streets(FormCollection datos, HttpPostedFileBase file)
        {
            if (datos["nameSite"] != null)
            {
                string cutPrograming = datos["programmingDate"];
                string programmingDate = cutPrograming.Substring(0, 10);

                Street street = new Street();
                Street_model street_Model = new Street_model();
                File_model file_Model = new File_model();
                FileStream stream;
                if (file.ContentLength > 0)
                {
                    string path = Path.Combine(Server.MapPath("~/Imagen/ImgFile/"), file.FileName);
                    file.SaveAs(path);
                    stream = new FileStream(Path.Combine(path), FileMode.Open);
                    Task<string> linkImage = null;
                    await Task.Run(() => linkImage = file_Model.Upload(stream, file.FileName));
                    string b = linkImage.Result;
                    street = new Street('V', datos["nameSite"], datos["nameStreet"], datos["description"], programmingDate, datos["initialTime"], datos["endTime"], datos["latitudeOne"], datos["lenghtOne"], datos["latitudeTwo"], datos["lenghtTwo"], linkImage.Result, file.FileName);
                }
                Street streetCloud = street_Model.AddStreetTofirebase(street);
                StreestCloud_model streestCloud_Model = new StreestCloud_model();
                streestCloud_Model.AddCloudDataBase(streetCloud);

                ServicesNotification_model serviceNotification = new ServicesNotification_model();

                serviceNotification = new ServicesNotification_model();
                serviceNotification.TitleMessage = streetCloud.SiteStreet;
                serviceNotification.MessageText = streetCloud.Description;
                Thread send = new Thread(new ThreadStart(serviceNotification.SendMessage));
                send.Start();

                return Redirect("StreetsList");
            }
            else
            {
                return View();
            }

        }
        #endregion

        #region Metodo de inhabilitar
        public ActionResult DisableStreet(FormCollection form)
        {
            Street_model street_Model = new Street_model();
            Street street = new Street();

            street = street_Model.UpdateStreetFromFirebase(form["txtdelete"]);
            street.StatusStreet = 'F';
            street_Model.DisableStreet(street);

            return Redirect("StreetsList");
        }
        #endregion

        #region Metodo de habilitar
        public ActionResult EnableStreet(FormCollection form)
        {
            Street_model street_Model = new Street_model();
            Street street = new Street();

            street = street_Model.UpdateStreetFromFirebase(form["txtdelete"]);
            street.StatusStreet = 'V';
            street_Model.EnableStreet(street);

            return Redirect("StreetsList");
        }
        #endregion

        #region Vista de las calles no disponibles
        public ActionResult StreetsList()
        {
            if (Session["user"] == null && Session["psw"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                Street_model street_Model = new Street_model();

                return View(street_Model.StreetListView());
            }
        }
        #endregion

        #region Vista de actualizar Calles no disponibles
        public ActionResult UpdateStreets(FormCollection datos)
        {
            if (Session["user"] == null && Session["psw"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                Street street = new Street();
                Street_model street_Model = new Street_model();

                street = street_Model.UpdateStreetFromFirebase(datos["txtIdEdit"]);

                return View(street);
            }
        }
        #endregion

        #region Metodo de actualizar calle no diponible en Firebase
        public async Task<ActionResult> UpdateStreetsRedirect(FormCollection datos, HttpPostedFileBase file)
        {
            string cutPrograming = datos["programmingDate"];
            string programmingDate = cutPrograming.Substring(0, 10);

            File_model file_Model = new File_model();
            FileStream stream;
            Street street = new Street();
            if (file != null)
            {
                string path = Path.Combine(Server.MapPath("~/Imagen/ImgFile/"), file.FileName);
                file.SaveAs(path);
                stream = new FileStream(Path.Combine(path), FileMode.Open);
                Task<string> linkImage = null;
                await Task.Run(() => linkImage = file_Model.Upload(stream, file.FileName));
                street = new Street(datos["txtId"], char.Parse(datos["txtStatus"]), datos["nameStreet"], datos["nameSite"], datos["description"], programmingDate, datos["initialTime"], datos["endTime"], datos["latitudeOne"], datos["lenghtOne"], datos["latitudeTwo"], datos["lenghtTwo"], linkImage.Result, file.FileName);
            }
            else
            {
                string UrlImage = datos["txtUrlImg"];
                string nameImage = datos["txtNameImg"];
                street = new Street(datos["txtId"], char.Parse(datos["txtStatus"]), datos["nameStreet"], datos["nameSite"], datos["description"], programmingDate, datos["initialTime"], datos["endTime"], datos["latitudeOne"], datos["lenghtOne"], datos["latitudeTwo"], datos["lenghtTwo"], UrlImage, nameImage);
            }
            Street_model street_Model = new Street_model();
            Street streetCloud= street_Model.UpdateStreetFromFirebaseRedirect(street);
            StreestCloud_model streestCloud_Model = new StreestCloud_model();
            await Task.Run(() => streestCloud_Model.UpdateCloudStreet(streetCloud));
            ServicesNotification_model serviceNotification = new ServicesNotification_model();

            serviceNotification = new ServicesNotification_model();
            serviceNotification.TitleMessage = streetCloud.SiteStreet;
            serviceNotification.MessageText = streetCloud.Description;
            Thread send = new Thread(new ThreadStart(serviceNotification.SendMessage));
            send.Start();
            return RedirectToAction("StreetsList");
        }
        #endregion
    }
}