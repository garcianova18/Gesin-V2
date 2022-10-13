using System;
using System.Collections.Generic;

#nullable disable

namespace gesin_app.Models
{
    public partial class Mantenedor
    {
        public Mantenedor()
        {
            FuncionMantenedors = new HashSet<FuncionMantenedor>();
            Reportes = new HashSet<Reporte>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Codigo { get; set; }
        public int? IdEmpresaMantenedor { get; set; }

        public virtual EmpresaMantenedora IdEmpresaMantenedorNavigation { get; set; }
        public virtual ICollection<FuncionMantenedor> FuncionMantenedors { get; set; }
        public virtual ICollection<Reporte> Reportes { get; set; }
    }
}
