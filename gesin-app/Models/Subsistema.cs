using System;
using System.Collections.Generic;

#nullable disable

namespace gesin_app.Models
{
    public partial class Subsistema
    {
        public Subsistema()
        {
            Activos = new HashSet<Activo>();
            Reportes = new HashSet<Reporte>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; }
        public int? IdSistema { get; set; }

        public virtual Sistema IdSistemaNavigation { get; set; }
        public virtual ICollection<Activo> Activos { get; set; }
        public virtual ICollection<Reporte> Reportes { get; set; }
    }
}
