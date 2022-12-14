using System;
using System.ComponentModel.DataAnnotations;

namespace gesin_app.ViewModel
{
    public class UsuarioCreateView
    {
    
        public int Id { get; set; }

        [Required]
        public string Nombre { get; set; }
        [Required]
        public string Apellido { get; set; }
        [Required]
        public string Codigo { get; set; }
        [Required]
        public string UserName { get; set; }
        [Required]
        public string Password { get; set; }

        [Required]
        public bool ActivoInativo { get; set; } = true;

        [Required]
        [Range(1, int.MaxValue)]
        public int IdRol { get; set; }
       
    }
}
