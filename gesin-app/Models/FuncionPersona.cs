using System;
using System.Collections.Generic;

#nullable disable

namespace gesin_app.Models
{
    public partial class FuncionPersona
    {
        public int Idfuncionmantenedor { get; set; }
        public string IdPersona { get; set; }
        public int IdFuncion { get; set; }

        public virtual Funcion IdFuncionNavigation { get; set; }
        public virtual Persona IdPersonaNavigation { get; set; }
    }
}
