using gesin_app.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace gesin_app.Controllers
{
    [Authorize(Roles = "administrador")]
    public class EstacionesController : Controller
    {

        private readonly GesinV2Context Db;


        public EstacionesController(GesinV2Context context)
        {
            Db = context;

        }
        public IActionResult Index()
        {


            return View();
        }

        public async Task<ActionResult> Listarestaciones()
        {
            var estaciones = await Db.Estacions.ToListAsync();

            return Json(estaciones);
        }


        [HttpPost]
        public ActionResult CrearEditar([FromBody] Estacion estacion)
        {
            if (estacion.Nombre == "")
            {
                return Ok(4);
            }

            var BuscarEstacion = Db.Estacions.Where(e => e.Nombre.Trim() == estacion.Nombre.Trim()).Count();

            //si entra aqui la estacion existe y devolvemo mensaje
            if (BuscarEstacion == 1)
            {
                return Ok(3);
            }
            //si entra aqui es que no existe la escion y se va a crear o editar segun el caso
            else
            {

                //crear
                if (estacion.Id == 0)
                {

                    if (ModelState.IsValid)
                    {

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

                        Db.Update(estacion);
                        Db.SaveChanges();


                        return Ok(2);

                    }
                }


            }



            return Ok(0);


        }


        public ActionResult CargarData_editar(int? id)
        {
            if (id == null)
            {

                return RedirectToAction("Index");
            }

            var buscarestacion = Db.Estacions.Find(id);

            if (buscarestacion != null)
            {
                return Ok(buscarestacion);
            }


            return Ok(0);


        }


        public ActionResult Eliminar(int? id)
        {

            if (id == null)
            {

                return RedirectToAction("Index");
            }

            var buscarestacion = Db.Estacions.Find(id);

            if (buscarestacion != null)
            {
                var buscarreportes = Db.Reportes.FirstOrDefault(r => r.IdEstacion == buscarestacion.Id);

                // si existen reportes que contengan esta estacion no se eliminara dicha estacion de lo contrario podra ser eliminada
                if (buscarreportes == null)
                {

                    Db.Remove(buscarestacion);
                    Db.SaveChanges();

                    return Ok(1);
                }
                else
                {

                    return Ok(2);
                }

            }



            return Json(buscarestacion);

        }
    }
}
