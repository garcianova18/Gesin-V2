using System;
using System.Collections.Generic;

#nullable disable

namespace gesin_app.Models
{
    public partial class Usuario
    {
        public Usuario()
        {
            ReporteIdUsuarioActualizoNavigations = new HashSet<Reporte>();
            ReporteIdUsuariosNavigations = new HashSet<Reporte>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public int Codigo { get; set; }
        public string UserName { get; set; }
        public int Password { get; set; }
        public int IdRol { get; set; }
        public DateTime? Fecha { get; set; }

        public virtual Rol IdRolNavigation { get; set; }
        public virtual ConfigUsuario ConfigUsuario { get; set; }
        public virtual ICollection<Reporte> ReporteIdUsuarioActualizoNavigations { get; set; }
        public virtual ICollection<Reporte> ReporteIdUsuariosNavigations { get; set; }
    }
}
