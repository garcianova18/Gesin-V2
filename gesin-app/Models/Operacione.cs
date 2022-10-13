using System;
using System.Collections.Generic;

#nullable disable

namespace gesin_app.Models
{
    public partial class Operacione
    {
        public Operacione()
        {
            RolOperaciones = new HashSet<RolOperacione>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; }

        public virtual ICollection<RolOperacione> RolOperaciones { get; set; }
    }
}
