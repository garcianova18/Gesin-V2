using System;
using System.Collections.Generic;

#nullable disable

namespace gesin_app.Models
{
    public partial class FuncionMantenedor
    {
        public int Idfuncionmantenedor { get; set; }
        public int IdMantenedor { get; set; }
        public int IdFuncion { get; set; }

        public virtual Funcion IdFuncionNavigation { get; set; }
        public virtual Mantenedor IdMantenedorNavigation { get; set; }
    }
}
