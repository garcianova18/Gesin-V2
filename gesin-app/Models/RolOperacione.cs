using System;
using System.Collections.Generic;

#nullable disable

namespace gesin_app.Models
{
    public partial class RolOperacione
    {
        public int Id { get; set; }
        public int IdRol { get; set; }
        public int IdPeraciones { get; set; }

        public virtual Operacione IdPeracionesNavigation { get; set; }
        public virtual Rol IdRolNavigation { get; set; }
    }
}
