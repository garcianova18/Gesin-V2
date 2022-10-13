using System;
using System.Collections.Generic;

#nullable disable

namespace gesin_app.Models
{
    public partial class EmpresaMantenedora
    {
        public EmpresaMantenedora()
        {
            Personas = new HashSet<Persona>();
        }

        public int IdEmpresamantenedora { get; set; }
        public string Nombre { get; set; }

        public virtual ICollection<Persona> Personas { get; set; }
    }
}
