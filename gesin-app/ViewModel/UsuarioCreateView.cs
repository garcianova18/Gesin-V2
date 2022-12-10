using System;
using System.ComponentModel.DataAnnotations;

namespace gesin_app.ViewModel
{
    public class UsuarioCreateView
    {
        [Required]
        public int Id { get; set; }

        [Required]
        public string Nombre { get; set; }
        [Required]
        public string Apellido { get; set; }
        [Required]
        public int Codigo { get; set; }
        [Required]
        public string UserName { get; set; }
        [Required]
        public string Password { get; set; }
        [Required]
        public int IdRol { get; set; }
       
    }
}
