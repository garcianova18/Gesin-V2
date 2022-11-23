using System;
using System.Collections.Generic;

#nullable disable

namespace gesin_app.Models
{
    public partial class Activo
    {
        public int Id { get; set; }
        public string Descripcion { get; set; }
        public int Idsubsistema { get; set; }

        public virtual Subsistema IdsubsistemaNavigation { get; set; }

        public static implicit operator List<object>(Activo v)
        {
            throw new NotImplementedException();
        }
    }
}
