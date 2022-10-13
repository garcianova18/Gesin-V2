using System;
using System.Collections.Generic;

#nullable disable

namespace gesin_app.Models
{
    public partial class Funcion
    {
        public Funcion()
        {
            FuncionPersonas = new HashSet<FuncionPersona>();
        }

        public int Id { get; set; }
        public string Funcion1 { get; set; }

        public virtual ICollection<FuncionPersona> FuncionPersonas { get; set; }
    }
}
