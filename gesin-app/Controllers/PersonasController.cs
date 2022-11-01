using gesin_app.Models;
using gesin_app.Servicios;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using System.Threading.Tasks;

namespace gesin_app.Controllers
{
    public class PersonasController : Controller
    {
        private readonly IrepositoryGeneric<Persona> repository;
        private readonly GesinV2Context context;

        public PersonasController(IrepositoryGeneric<Persona> repository,GesinV2Context context)
        {
            this.repository = repository;
            this.context = context;
        }
        public IActionResult Index()
        {
            return View();
        }

        public async Task<ActionResult> ListarPersonas()
        {
            var estaciones = await repository.GetAllAsync();

            return Json(estaciones);
        }


        [HttpPost]
        public async Task< ActionResult >CrearEditar([FromBody] Persona persona)
        {
            if (persona.Nombre == null)
            {
                return Ok(4);
            }
             //buscamos si existe una con este mismo nombre 
            var BuscarEstacion =  context.Personas.Where(e => e.Nombre.Trim() == persona.Nombre.Trim()).Count();

            //si entra aqui la estacion existe y devolvemo mensaje
            if (BuscarEstacion == 1)
            {
                return Ok(3);
            }
            //si entra aqui es que no existe la escion y se va a crear o editar segun el caso
            else
            {

                //crear
                if (persona.Id == 0)
                {

                    if (ModelState.IsValid)
                    {

                        var personaCreate = await repository.CreateAsync(persona);


                        return Ok(personaCreate);

                    }
                }
                //editar
                else
                {
                    if (ModelState.IsValid)
                    {

                        var personaUpdate = await repository.UpdateAsync(persona);


                        return Ok(2);

                    }
                }


            }



            return Ok(0);


        }


        public ActionResult CargarData_editar(int id)
        {
            if (id == 0)
            {

                return RedirectToAction("Index");
            }

            var buscarestacion = repository.GetByIdAsync(id);

            if (buscarestacion != null)
            {
                return Ok(buscarestacion);
            }


            return Ok(0);


        }


        public async Task< ActionResult >Eliminar(int id)
        {

            if (id == 0)
            {

                return RedirectToAction("Index");
            }

            var buscarpersona = await repository.GetByIdAsync(id);

            if (buscarpersona != null)
            {
                //buscamos si existen reportes con esta estacion si existe no podra ser eliminada dicha persona
                var buscarreRortes = repository.GetByIdAsync(buscarpersona.Id);

               //si no existen reporte con esta persona la eliminamos
                if (buscarreRortes == null)
                {

                    var personaDelete = await repository.DeleteAsync(buscarpersona);

                    return Ok(1);
                }
                else
                {

                    return Ok(2);
                }

            }



            return Json(buscarpersona);

        }
    }
}
