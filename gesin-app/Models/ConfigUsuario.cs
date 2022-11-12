using System;
using System.Collections.Generic;

#nullable disable

namespace gesin_app.Models
{
    public partial class ConfigUsuario
    {
        public int Id { get; set; }
        public string Background { get; set; }
        public int IdUsuario { get; set; }

        public virtual Usuario IdUsuarioNavigation { get; set; }
    }
}
