using AutoMapper;
using AutoMapper.QueryableExtensions;
using gesin_app.Models;
using gesin_app.Servicios;
using gesin_app.ViewModel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace gesin_app.Controllers
{
    public class PersonasController : Controller
    {
        private readonly IrepositoryGeneric<Persona> repository;
        private readonly GesinV2Context context;
        private readonly IMapper mapper;

        public PersonasController(IrepositoryGeneric<Persona> repository,GesinV2Context context, IMapper mapper)
        {
            this.repository = repository;
            this.context = context;
            this.mapper = mapper;
        }
        public IActionResult Index()
        {

            ViewBag.funciones = Funciones();

            var listaPersonas =  context.Personas.ProjectTo<PersonaView>(mapper.ConfigurationProvider).ToList();


            return View(listaPersonas);
        }

        public async Task<ActionResult> ListarPersonas()
        {
            var persona = await repository.GetAllAsync();

         

           var  listaPersonas = await context.Personas.ProjectTo<PersonaView>(mapper.ConfigurationProvider).ToListAsync();
          
     
            return Json(listaPersonas);
        }


        [HttpPost]
        public async Task< ActionResult >CrearEditar([FromBody] Persona persona)
        {
           
          
                //crear
                if (persona.Id == 0)
                {

                    if (ModelState.IsValid)
                    {

                        //buscamos si existe una con este mismo nombre y codigo
                        var BuscarExistePersona = await context.Personas.Where(p => p.Nombre.Trim() == persona.Nombre.Trim() && p.Codigo.Trim() == persona.Codigo.Trim() && p.Id != persona.Id).CountAsync();

                        //si entra aqui la persona existe y devolvemo mensaje
                        if (BuscarExistePersona == 1)
                        {
                            return Ok(3);
                        }

                        var personaCreate = await repository.CreateAsync(persona);


                        return Ok(personaCreate);




                     }




                 }
                //editar
                else
                {


                    if (ModelState.IsValid)
                    {
                        // verificamos que con el id que envio el usuario exista un registro 
                        var existeRegistro = await context.Personas.AnyAsync(p => p.Id == persona.Id);

                        if (existeRegistro == false)
                        {
                            //si no existe un registro con ese id  es que el id no es valido y devolvemos 0

                            //recurso no encontrado.
                            return Ok(0);

                        }

                        //buscamos si existe una con este mismo nombre y codigo
                        var BuscarExistePersona = await context.Personas.Where(p => p.Nombre.Trim() == persona.Nombre.Trim() && p.Codigo.Trim() == persona.Codigo.Trim() && p.Id != persona.Id).CountAsync();

                        //si entra aqui la persona existe y devolvemo mensaje
                        if (BuscarExistePersona == 1)
                        {
                        //La persona ya existe con ese nombre y el mismo codigo
                            return Ok(3);
                        }

                         var personaUpdate = await repository.UpdateAsync(persona);


                        return Ok(personaUpdate);

                    }


                }


            return Ok(4);


        }


        public async Task< ActionResult> CargarData_editar(int? id)
        {
            if (id == 0 || id == null)
            {

                return Ok(0);
            }

            var buscarestacion = await repository.GetByIdAsync(id);

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

           
               //si no existen reporte con esta persona la eliminamos
                if (buscarpersona == null)
                {

                return Ok(0);
                    
                }

            var personaDelete = await repository.DeleteAsync(buscarpersona);



            return Ok(personaDelete);

        }


        public List<SelectListItem> Funciones()
        {

            var funciones = context.Funcions.Select(f => new SelectListItem
            {
                Text = f.Nombre,
                Value = f.Id.ToString()


            }).ToList();


            funciones.Insert(0, new SelectListItem
            {
                Text ="---seleccione una funcion----",
                Value = ""
            } );
            return funciones;
        }
    }
}
