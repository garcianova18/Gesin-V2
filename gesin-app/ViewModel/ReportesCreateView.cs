using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;
using System;

namespace gesin_app.ViewModel
{
    public class ReportesCreateView
    {
        public int Id { get; set; }

        public string Sistema { get; set; }

        public string Subsistema{ get; set; }

        public string Estacion { get; set; }


        public string Ubicacion { get; set; }

        [Required]
        public string Descripcion { get; set; }


        [Required]
        public string CodigoOperadorReporte { get; set; }

        [Required]
        public string OperadorReporte { get; set; }

        [Required]
        public string fechaaveriaGuardarMostrar { get; set; }

        [Required]
        public int IdCriticidad { get; set; }

        [Required]
        public int IdSm { get; set; }

        [Required]
        public int IdEstadoOt { get; set; }

        public int? Ot { get; set; }

        public string Comentario { get; set; }

        public string Fechanotificacionguardarmostrar { get; set; }

        public string MantenedorNotificar { get; set; }

        public string Fechainicioguardarmostrar { get; set; }

        public string Fechafinalguardarmostrar { get; set; }

        public string OperadorCierre { get; set; }

        public string CodigoOperadorCierre { get; set; }

        public string MantenedorReparo { get; set; }

        public int? IdUsuarios { get; set; }

        public int? IdUsuarioActualizo { get; set; }

        
















    }
}
