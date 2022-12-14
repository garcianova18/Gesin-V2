using System;
using System.Collections.Generic;

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
        public string Nombre { get; set; }
        public bool ActivoInactivo { get; set; } = true;

        public virtual ICollection<Reporte> Reportes { get; set; }
    }
}
