using System;
using System.Collections.Generic;

#nullable disable

namespace gesin_app.Models
{
    public partial class Persona
    {
        public Persona()
        {
            FuncionPersonas = new HashSet<FuncionPersona>();
            ReporteIdMantenedorNotificarNavigations = new HashSet<Reporte>();
            ReporteIdOperadorCierreNavigations = new HashSet<Reporte>();
            ReporteIdOperadorReporteNavigations = new HashSet<Reporte>();
            ReporteIdmantenedorReparoNavigations = new HashSet<Reporte>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Codigo { get; set; }
        public int? IdEmpresaMantenedora { get; set; }

        public virtual EmpresaMantenedora IdEmpresaMantenedoraNavigation { get; set; }
        public virtual ICollection<FuncionPersona> FuncionPersonas { get; set; }
        public virtual ICollection<Reporte> ReporteIdMantenedorNotificarNavigations { get; set; }
        public virtual ICollection<Reporte> ReporteIdOperadorCierreNavigations { get; set; }
        public virtual ICollection<Reporte> ReporteIdOperadorReporteNavigations { get; set; }
        public virtual ICollection<Reporte> ReporteIdmantenedorReparoNavigations { get; set; }
    }
}
