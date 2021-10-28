using ProyectoVialidadASP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text.RegularExpressions;
using System.IO;
using System.Threading.Tasks;

namespace ProyectoVialidadASP.Controllers
{
    /// <summary>
    /// Nombre de la aplicación: LocationsController
    /// Nombre del desarrollador: Valeria Delgarillo ,Kevin Bautista 
    /// Fecha de creación: 16/10/2021 
    /// Fecha de modficación: 17/10/2021 
    /// </summary>
    /// <param name="datos"></param>
    /// <param name="file"></param>
    /// <returns>Inserta los datos de parqueo en la base de datos</returns
    /// 
    public class LocationsController : Controller
    {
        // GET: Locations
        #region Insert
        public async Task<ActionResult> Locations(FormCollection datos, HttpPostedFileBase file, HttpPostedFileBase fileDesign)
        {
            if (datos["name"] != null)
            {

                Location location = new Location();
                Location_model lp = new Location_model();
                File_model file_Model = new File_model();
                File_model file_ModelDesign = new File_model();
                FileStream stream, streamDesign;
                if (file.ContentLength > 0 && fileDesign.ContentLength > 0)
                {
                    string path = Path.Combine(Server.MapPath("~/Imagen/ImgFile/"), file.FileName);
                    string pathDesign = Path.Combine(Server.MapPath("~/Imagen/ImgDesign/"), fileDesign.FileName);
                    file.SaveAs(path);
                    fileDesign.SaveAs(pathDesign);
                    stream = new FileStream(Path.Combine(path), FileMode.Open);
                    streamDesign = new FileStream(Path.Combine(pathDesign), FileMode.Open);
                    Task<string> linkImage = null;
                    Task<string> linkImageDesign = null;
                    await Task.Run(() => linkImage = file_Model.Upload(stream, file.FileName));
                    await Task.Run(() => linkImageDesign = file_ModelDesign.Upload(streamDesign, fileDesign.FileName));

                    location = new Location('V', datos["name"], datos["nameStreet"], datos["latitude"], datos["lenght"], byte.Parse(datos["parkingSpaces"]), datos["price"], datos["description"], linkImage.Result, file.FileName, linkImageDesign.Result, fileDesign.FileName);
                }
                Location locationCloud = lp.AddLocationsTofirebase(location);
                LocationCloud_model locationCloud_Model = new LocationCloud_model();
                locationCloud_Model.AddCloudDataBase(locationCloud);
                return Redirect("LocationsList");
            }
            else
            {
                return View();
            }
        }
        #endregion

        #region Deshabilitar parqueo
        public ActionResult DisableParking(FormCollection form)
        {

            Location_model location_Model = new Location_model();
            Location location = new Location();

            location = location_Model.UpdateLocationFromFirebase(form["txtdelete"]);
            location.StatusLocation = 'F';
            location_Model.DisableParking(location);

            return Redirect("LocationsList");

        }
        #endregion

        #region habilitar parqueo
        public ActionResult EnableLocation(FormCollection form)
        {
            Location_model location_Model = new Location_model();
            Location location = new Location();

            location = location_Model.UpdateLocationFromFirebase(form["txtdelete"]);
            location.StatusLocation = 'V';
            location_Model.EnableLocation(location);
            return Redirect("LocationsList");
        }
        #endregion

        #region Listado de Parqueo
        public ActionResult LocationsList()
        {
            if (Session["user"] == null && Session["psw"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                Location_model location_Model = new Location_model();

                return View(location_Model.listLocationView());
            }
        }
        #endregion

        #region Vista de Actualizar parqueo
        public ActionResult UpdateLocation(FormCollection datos)
        {

            if (Session["user"] == null && Session["psw"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                Location location = new Location();
                Location_model location_Model = new Location_model();

                location = location_Model.UpdateLocationFromFirebase(datos["txtidedit"]);

                return View(location);
            }


        }
        #endregion

        #region Metodo para actualizar parqueo en Firebase
        public async Task<ActionResult> UpdateLocationRedirect(FormCollection datos, HttpPostedFileBase file, HttpPostedFileBase fileDesign)
        {
            try
            {
                Location location = new Location();
                File_model file_Model = new File_model();
                File_model file_ModelDesign = new File_model();
                FileStream stream, streamDesign;
                Task<string> linkImage = null;
                Task<string> linkImageDesign = null;
                string UrlImage = null;
                string nameImage = null;
                string UrlImageDesign = null;
                string nameImageDesign = null;
                if (file != null)
                {
                    string path = Path.Combine(Server.MapPath("~/Imagen/ImgFile/"), file.FileName);
                    file.SaveAs(path);
                    stream = new FileStream(Path.Combine(path), FileMode.Open);
                    await Task.Run(() => linkImage = file_Model.Upload(stream, file.FileName));
                    UrlImage = linkImage.Result;
                    nameImage = file.FileName;
                }
                else
                {
                    UrlImage = datos["txtUrlImg"];
                    nameImage = datos["txtNameImg"];
                }
                if (fileDesign != null)
                {
                    string pathDesign = Path.Combine(Server.MapPath("~/Imagen/ImgDesign/"), fileDesign.FileName);
                    fileDesign.SaveAs(pathDesign);
                    streamDesign = new FileStream(Path.Combine(pathDesign), FileMode.Open);
                    await Task.Run(() => linkImageDesign = file_ModelDesign.Upload(streamDesign, fileDesign.FileName));
                    UrlImageDesign = linkImageDesign.Result;
                    nameImageDesign = fileDesign.FileName;
                }
                else
                {
                    UrlImageDesign = datos["txtUrlImgDesign"];
                    nameImageDesign = datos["txtNameImgDesign"];
                }
                location = new Location(datos["txtId"], char.Parse(datos["txtStatus"]), datos["name"], datos["nameStreet"], datos["latitude"], datos["lenght"], byte.Parse(datos["parkingSpaces"]), datos["price"], datos["description"], UrlImage, nameImage, UrlImageDesign, nameImageDesign);

                Location_model location_Model = new Location_model();
                Location locationCloud = location_Model.UpdateLocationFromFirebaseRedirect(location);
                LocationCloud_model locationCloud_Model = new LocationCloud_model();
                await Task.Run(() => locationCloud_Model.UpdateCloudLocation(locationCloud));
                return RedirectToAction("LocationsList");
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        #endregion
    }
}
