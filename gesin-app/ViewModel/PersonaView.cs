using gesin_app.Models;
using System.ComponentModel.DataAnnotations;

namespace gesin_app.ViewModel
{
    public class PersonaView
    {

        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Codigo { get; set; }



        [Display(Name ="Funcion")]
        public string IdFuncionNavigationNombre { get; set; }
    }
}
