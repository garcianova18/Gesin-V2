using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace gesin_app.ViewModel
{
    public class ReportesView
    {
        public int Id { get; set; }
        public int IdSubsistema { get; set; }
        public int IdUbicacion { get; set; }
        public int IdEstacion { get; set; }

        [Required(ErrorMessage = "Digite una descripcion")]
        public string Descripcion { get; set; }

        [DisplayFormat(DataFormatString = "{0: yyyy-MM-dd }", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        public DateTime Fechaaveria { get; set; }

        public int? IdUsuarios { get; set; }

        [Required(ErrorMessage = "Digite una fecha")]
        [Display(Name ="Fecha Averia")]
        public string fechaaveriaGuardarMostrar { get; set; }

        [Required(ErrorMessage = "Seleccione la criticidad")]
        public int IdCriticidad { get; set; }
        [Required(ErrorMessage = "Seleccione un sistema")]
        public int IdSistemas { get; set; }
        public int? Ot { get; set; }

        [Required(ErrorMessage = "seleccione un estado")]
        public int IdEstadoOt { get; set; }
        public string Comentario { get; set; }
       

       

        [Display(Name = "Usuario actualizo")]
        public string UsuarioActualizoNombre { get; set; }

        [Display(Name = "Fecha notificacion")]

        public DateTime? Fechanotificacion { get; set; }
        public DateTime Fechanotificacionprueba { get; set; }
        public string Fechanotificacionguardarmostrar { get; set; }

         public int? IdUsuarioActualizo { get; set; }

        public DateTime? Fechainicio { get; set; }

        [Display(Name = "Fecha Inicio")]
        public string Fechainicioguardarmostrar { get; set; }



        public DateTime? Fechafinal { get; set; }

        [Display(Name = "Fecha Final")]
        public string Fechafinalguardarmostrar { get; set; }



        [Display(Name = "Usuario registro")]
        public string UsuariosNombre { get; set; }

        [Display(Name = "Codigo usuario")]
        public string UsuariosCodigo { get; set; }
        [Display(Name = "Criticidad")]

        public string CriticidadNombre { get; set; }
        [Display(Name = "Estado")]
        public string EstadoOtNombre { get; set; }
        [Display(Name = "Mantenedor")]
        public string MantenedorNotificarNombre { get; set; }
        [Display(Name = "Cod. Mantenedor")]
      

        public string OperadorReporteNombre { get; set; }

        [Display(Name = "Cod. Operador")]
      
        public string OperadorreporteCodigo { get; set; }
        [Display(Name = "Sistema")]
        public string SistemasNombre { get; set; }
        [Display(Name = "Subsistema")]
        [Required(ErrorMessage = "Seleccione un subsistema")]
        public string SubsistemasNombre { get; set; }
        [Display(Name = "Ubicacion")]
        [Required(ErrorMessage = "Seleccione una ubicacion")]
        public string UbicacionesNombre { get; set; }
        [Display(Name = "Estacion")]
        [Required(ErrorMessage = "Seleccione una estacion")]
        public string EstacionesNombre { get; set; }

        [Display(Name = "Operador cierre")]
        public string OperadorCierreNombre { get; set; }

        [Display(Name = "Cod. Operador cierre")]
        public string OperadorCierreCodigo { get; set; }

        [Display(Name = "Mantenedor cierre")]
        public string MantenedorReparoNombre { get; set; }

        [Display(Name = "Cod. Mantenedor cierre")]
        public string MantenedorReparoCodigo { get; set; }

        public string OperadorReporte { get; set; }
        public string CodigoOperadorReporte { get; set; }
       

        public string MantenedorNotificar { get; set; }
        public string MantenedorReparo { get; set; }

        public string OperadorCierre { get; set; }

        public string CodigoOperadorCierre { get; set; }



    }
}
