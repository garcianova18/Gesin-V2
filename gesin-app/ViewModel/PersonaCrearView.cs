using System.ComponentModel.DataAnnotations;

namespace gesin_app.ViewModel
{
    public class PersonaCrearView
    {

        public int Id { get; set; }

        [Required]
        public string Nombre { get; set; }

        [Required]
        public string Codigo { get; set; }

        [Required]
        [Range(1, int.MaxValue)]
        public int IdFuncion { get; set; }
    }
}
