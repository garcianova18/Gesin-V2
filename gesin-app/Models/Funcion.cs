using System;
using System.Collections.Generic;

#nullable disable

namespace gesin_app.Models
{
    public partial class Funcion
    {
        public Funcion()
        {
            Personas = new HashSet<Persona>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; }

        public virtual ICollection<Persona> Personas { get; set; }
    }
}
