using System;
using System.Collections.Generic;

#nullable disable

namespace gesin_app.Models
{
    public partial class Reporte
    {
        public int Id { get; set; }
        public int IdSubsistema { get; set; }
        public string Ubicacion { get; set; }
        public int IdEstacion { get; set; }
        public string OperadorReporte { get; set; }
        public string Descripcion { get; set; }
        public DateTime Fechaaveria { get; set; }
        public int IdCriticidad { get; set; }
        public int IdSm { get; set; }
        public int? Ot { get; set; }
        public int IdEstadoOt { get; set; }
        public string Comentario { get; set; }
        public DateTime? Fechanotificacion { get; set; }
        public string MantenedorNotificar { get; set; }
        public DateTime? Fechainicio { get; set; }
        public DateTime? Fechafinal { get; set; }
        public int IdUsuarios { get; set; }
        public string MantenedorReparo { get; set; }
        public string OperadorCierre { get; set; }
        public int? IdUsuarioActualizo { get; set; }
        public string CodigoOperadorReporte { get; set; }
        public string CodigoOperadorCierre { get; set; }
        public int IdSistema { get; set; }
        public int Idmantenedor { get; set; }

        //Propiedades de navegacion
        public virtual Criticidad Criticidad { get; set; }
        public virtual Estacion Estaciones { get; set; }
        public virtual EstadoOt EstadoOT { get; set; }
        public virtual Sistema Sistemas { get; set; }
        public virtual Subsistema Subsistemas { get; set; }
        public virtual Usuario Usuarios { get; set; }
        public virtual Usuario UsuarioActualizo { get; set; }
        public virtual Sm Sm { get; set; }
        public virtual Mantenedor Mantenedor { get; set; }
    }
}
