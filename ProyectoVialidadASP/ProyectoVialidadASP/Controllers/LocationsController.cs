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
    public class LocationsController : Controller
    {
        // GET: Locations
        public async Task<ActionResult> Locations(FormCollection datos, HttpPostedFileBase file)
        {
            if (datos["name"] != null)
            {
                
                Location location=new Location();
                Location_model lp = new Location_model();
                File_model fm = new File_model();
                FileStream stream;
                if (file.ContentLength > 0)
                {
                    string path = Path.Combine(Server.MapPath("~/Imagen/ImgFile/"), file.FileName);
                    file.SaveAs(path);
                    stream = new FileStream(Path.Combine(path), FileMode.Open);
                    Task<string> linkImage = null;
                    await Task.Run(() => linkImage = fm.Upload(stream, file.FileName));
                    string b = linkImage.Result;
                    location = new Location('V', datos["name"], datos["nameStreet"], datos["latitude"], datos["lenght"], byte.Parse(datos["parkingSpaces"]), datos["price"], datos["description"], linkImage.Result, file.FileName);
                }
                lp.AddLocationsTofirebase(location);
                return Redirect("LocationsList");
            }
            else
            {
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
        public ActionResult EnableLocation(FormCollection form)
        {
            Location_model lm = new Location_model();
            Location lo = new Location();

            lo = lm.UpdateLocationFromFirebase(form["txtdelete"]);
            lo.StatusLocation = 'V';
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
                    Location location = new Location();
                    Location_model lm = new Location_model();

                    location = lm.UpdateLocationFromFirebase(datos["txtidedit"]);

                    return View(location);
                }
            }

        }

        public async Task<ActionResult> UpdateLocationRedirect(FormCollection datos, HttpPostedFileBase file)
        {
            Location location = new Location();
            File_model fm = new File_model();
            FileStream stream;
            if (file != null)
            {
                string path = Path.Combine(Server.MapPath("~/Imagen/ImgFile/"), file.FileName);
                file.SaveAs(path);
                stream = new FileStream(Path.Combine(path), FileMode.Open);
                Task<string> linkImage = null;
                await Task.Run(() => linkImage = fm.Upload(stream, file.FileName));
                location = new Location(datos["txtId"], char.Parse(datos["txtStatus"]), datos["name"], datos["nameStreet"], datos["latitude"], datos["lenght"], byte.Parse(datos["parkingSpaces"]), datos["price"], datos["description"], linkImage.Result, file.FileName);
            }
            else
            {
                string UrlImage = datos["txtUrlImg"];
                string nameImage = datos["txtNameImg"];
                location = new Location(datos["txtId"], char.Parse(datos["txtStatus"]), datos["name"], datos["nameStreet"], datos["latitude"], datos["lenght"], byte.Parse(datos["parkingSpaces"]), datos["price"], datos["description"], UrlImage, nameImage);

            }

            Location_model lm = new Location_model();
            lm.UpdateLocationFromFirebaseRedirect(location);

            return RedirectToAction("LocationsList");
        }

    }
}
