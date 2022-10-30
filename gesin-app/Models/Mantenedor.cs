using System;
using System.Collections.Generic;

#nullable disable

namespace gesin_app.Models
{
    public partial class Mantenedor
    {
        public Mantenedor()
        {
            Personas = new HashSet<Persona>();
            Reportes = new HashSet<Reporte>();
            Subsistemas = new HashSet<Subsistema>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; }

        public virtual ICollection<Persona> Personas { get; set; }
        public virtual ICollection<Reporte> Reportes { get; set; }
        public virtual ICollection<Subsistema> Subsistemas { get; set; }
    }
}
