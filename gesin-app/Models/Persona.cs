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
        }

        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Codigo { get; set; }
        public int IdEmpresaMantenedora { get; set; }

        public virtual EmpresaMantenedora IdEmpresaMantenedoraNavigation { get; set; }
        public virtual ICollection<FuncionPersona> FuncionPersonas { get; set; }
    }
}
