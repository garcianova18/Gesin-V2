using System;
using System.Collections.Generic;

#nullable disable

namespace gesin_app.Models
{
    public partial class Persona
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Codigo { get; set; }
        public int IdFuncion { get; set; }

        public virtual Funcion IdFuncionNavigation { get; set; }
    }
}
