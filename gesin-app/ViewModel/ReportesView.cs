﻿using System;
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

        [Required]
        public string Descripcion { get; set; }

        [DisplayFormat(DataFormatString = "{0: yyyy-MM-dd }", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        [Required]
        public DateTime Fechaaveria { get; set; }

        public int? IdUsuarios { get; set; }

        [Required]
        [Display(Name ="Fecha Averia")]
        public string fechaaveriaGuardarMostrar { get; set; }

        [Required]
        public int IdCriticidad { get; set; }

        [Required]
        public int IdSistemas { get; set; }
        public int? Ot { get; set; }

        [Required]
        public int IdEstadoOt { get; set; }
        public string Comentario { get; set; }
       

       

        [Display(Name = "Usuario actualizo")]
        public string UsuarioActualizoNombre { get; set; }

        [Display(Name = "Fecha notificacion")]

        public DateTime? Fechanotificacion { get; set; }
     
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
       
      
       
        public string SistemasNombre { get; set; }
        [Display(Name = "Subsistema")]

        public string SubsistemasNombre { get; set; }
        [Display(Name = "Ubicacion")]

        public string UbicacionesNombre { get; set; }

        [Display(Name = "Estacion")]
        public string EstacionesNombre { get; set; }




        [Display(Name = "Operador")]
        [Required]
        public string OperadorReporte { get; set; }

        [Display(Name = "Cod. Operador")]
        [Required]
        public string CodigoOperadorReporte { get; set; }

        [Display(Name = "Mantenedor")]
        public string MantenedorNotificar { get; set; }

        [Display(Name = "Mant. Reparo")]
        public string MantenedorReparo { get; set; }

        [Display(Name = "Operador Cierre")]
        public string OperadorCierre { get; set; }

        [Display(Name = "Cod. Operador Cierre")]
        public string CodigoOperadorCierre { get; set; }



    }
}
