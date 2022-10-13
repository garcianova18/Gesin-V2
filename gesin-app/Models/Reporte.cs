using System;
using System.Collections.Generic;

#nullable disable

namespace gesin_app.Models
{
    public partial class Reporte
    {
        public int Id { get; set; }
        public int IdSubsistema { get; set; }
        public int IdUbicacion { get; set; }
        public int IdEstacion { get; set; }
        public int IdOperadorReporte { get; set; }
        public string Descripcion { get; set; }
        public DateTime Fechaaveria { get; set; }
        public int IdCriticidad { get; set; }
        public int IdSistemas { get; set; }
        public int? Ot { get; set; }
        public int IdEstadoOt { get; set; }
        public string Comentario { get; set; }
        public DateTime? Fechanotificacion { get; set; }
        public int? IdMantenedorNotificar { get; set; }
        public DateTime? Fechainicio { get; set; }
        public DateTime? Fechafinal { get; set; }
        public int? IdUsuarios { get; set; }
        public int? IdmantenedorReparo { get; set; }
        public int? IdOperadorCierre { get; set; }
        public int? IdUsuarioActualizo { get; set; }

        public virtual Criticidad Criticidad { get; set; }
        public virtual Estacion Estaciones { get; set; }
        public virtual EstadoOt EstadoOT { get; set; }
        public virtual Persona Mantenedornotificar { get; set; }
        public virtual Persona Operadorcierre { get; set; }
        public virtual Persona Operadorreporte { get; set; }
        public virtual Sistema Sistemas { get; set; }
        public virtual Subsistema Subsistemas { get; set; }
        public virtual Ubicacion Ubicaciones { get; set; }
        public virtual Usuario Usuarios { get; set; }
        public virtual Persona Mantenedorreparo { get; set; }
        public virtual Usuario UsuarioActualizo { get; set; }
    }
}
