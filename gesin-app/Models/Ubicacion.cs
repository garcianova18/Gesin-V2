using System;
using System.Collections.Generic;

#nullable disable

namespace gesin_app.Models
{
    public partial class Ubicacion
    {
        public Ubicacion()
        {
            Reportes = new HashSet<Reporte>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; }

        public virtual ICollection<Reporte> Reportes { get; set; }
    }
}
