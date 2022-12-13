using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace gesin_app.Models
{
    public partial class Estacion
    {
        public Estacion()
        {
            Reportes = new HashSet<Reporte>();
        }

        public int Id { get; set; }

        [Required]
        public string Nombre { get; set; }

        public virtual ICollection<Reporte> Reportes { get; set; }
    }
}
