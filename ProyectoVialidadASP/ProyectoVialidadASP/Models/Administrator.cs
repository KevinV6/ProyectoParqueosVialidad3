using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoVialidadASP.Models
{
    public class Administrator
    {
        #region Atributos
        public string userName { get; set; }
        public string password { get; set; }
        #endregion


        #region Constructor
        public Administrator(string userName, string password)
        {
            this.userName = userName;
            this.password = password;
        }
        #endregion
    }
}