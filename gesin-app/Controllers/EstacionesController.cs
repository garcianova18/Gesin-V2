using gesin_app.Models;
using gesin_app.Servicios;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace gesin_app.Controllers
{
    [Authorize(Roles = "Administrador")]
    public class EstacionesController : Controller
    {

        private readonly GesinV2Context Db;
        private readonly IrepositoryGeneric<Estacion> repositoryGeneric;

        public EstacionesController(GesinV2Context context, IrepositoryGeneric<Estacion> repositoryGeneric)
        {
            Db = context;
            this.repositoryGeneric = repositoryGeneric;
        }
        public IActionResult Index()
        {


            return View();
        }

        public async Task<ActionResult> Listarestaciones()
        {
            var estaciones = await Db.Estacions.Where(e=> e.ActivoInactivo==true).ToListAsync();

            return Json(estaciones);
        }


        [HttpPost]
        public async Task< ActionResult> CrearEditar([FromBody] Estacion estacion)
        {
          
                //crear
                if (estacion.Id == 0)
                {

                    if (ModelState.IsValid)

                    {

                        var BuscarEstacion = Db.Estacions.Where(e => e.Nombre.Trim() == estacion.Nombre.Trim()).Count();

                        //si entra aqui la estacion existe y devolvemo mensaje
                        if (BuscarEstacion == 1)
                        {
                            return Ok(3);
                        }

                        Db.Add(estacion);
                        Db.SaveChanges();


                        return Ok(1);

                    }

                    

                }
                //editar
                else
                {
                    if (ModelState.IsValid)
                    {

                    // verificamos que con el id que envio el usuario exista un registro 
                        var existeRegistro = await Db.Estacions.AnyAsync(e => e.Id == estacion.Id);

                        if (existeRegistro == false)
                        {
                            //si no existe un registro con ese id  es que el id no es valido y devolvemos 0
                            //que en el frontend 0 muestra la alerta de recurso no encontrado.
                            return Ok(0);


                        }

                         var BuscarEstacion = Db.Estacions.Where(e => e.Nombre.Trim() == estacion.Nombre.Trim() && e.Id != estacion.Id).Count();

                        //si entra aqui la estacion existe y devolvemo mensaje
                        if (BuscarEstacion == 1)
                        {
                            return Ok(3);
                        }

                        Db.Update(estacion);
                        Db.SaveChanges();


                        return Ok(2);

                    }

                    
                }



            return Ok(0);



        }


        public ActionResult CargarData_editar(int? id)
        {
            if (id == 0 || id == null)
            {

                return Ok(0);
            }

            var buscarestacion = Db.Estacions.Find(id);

            if (buscarestacion != null)
            {
                return Ok(buscarestacion);
            }


            return Ok(0);


        }


        public async Task< ActionResult<int> >Eliminar(int? id)
        {
           

            if (id == null || id ==0)
            {

                return Ok(0);
            }

           
            var buscarestacion = await Db.Estacions.FindAsync(id);


            if (buscarestacion == null)
            {

                return  Ok(0);
            }

            buscarestacion.ActivoInactivo = false;

            return await repositoryGeneric.UpdateAsync(buscarestacion);

        }
    }
}
