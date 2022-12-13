using System;
using System.ComponentModel.DataAnnotations;

namespace gesin_app.ViewModel
{
    public class UsuariosView
    {

        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }

        public string NombreCompleto {

            get { return Nombre.Trim() +" " + Apellido.Trim(); }
            
            }
        public string Codigo { get; set; }

        public int IdRol { get; set; }

        [Display(Name = "Usuario")]
        public string UserName { get; set; }
        public string Password { get; set; }


        [Display(Name="Perfil")]
        public string IdRolNavigationNombre { get; set; }
    }
}
