using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace gesin_app.Models
{
    public partial class Persona
    {
        public int Id { get; set; }

        [Required]
        public string Nombre { get; set; }

        [Required]
        public string Codigo { get; set; }

        [Required]
        public int IdFuncion { get; set; }

        public virtual Funcion IdFuncionNavigation { get; set; }
    }
}
