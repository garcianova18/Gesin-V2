using AutoMapper;
using AutoMapper.QueryableExtensions;
using gesin_app.Models;
using gesin_app.ViewModel;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.SignalR;
using gesin_app.Servicios;
using System.Runtime.CompilerServices;
using System.Diagnostics;

namespace gesin_app.Controllers
{

    [Authorize]
    public class ReportesController : Controller
    {

        private readonly GesinV2Context Db;
        private readonly IMapper mapper;
        private readonly IHubContext<GesinHub> hubContext;
        private readonly IrepositoryGeneric<Reporte> repository;
        public ReportesController(GesinV2Context context, IMapper mapper, IHubContext<GesinHub> hubContext, IrepositoryGeneric<Reporte> irepository)
        {
            Db = context;
            this.mapper = mapper;
            this.hubContext = hubContext;
            this.repository = irepository;
        }
        public async Task< IActionResult >Index(ReportesView reporteview)
        {
            

            //  //con esta linea nos envitamos estar usando include para poder incluir toda la data relacionada que en este caso es mucha
            var reportes = await Db.Reportes.ProjectTo<ReportesView>(mapper.ConfigurationProvider).CountAsync();

            //para mostrar la cantiad de reportes creada en la vista
            ViewBag.conteo = reportes;

            ////  var reportess = Db.Reportes.ToList();

            ////var  reportes = mapper.Map<List<ReportesView>>(reportess);

            ViewBag.estaciones = Estaciones();
            ViewBag.subsistema = Subsistema();
            ViewBag.ubicacion = Ubicacion();
            ViewBag.criticidad = Criticidad();
            ViewBag.SM = SM();
            ViewBag.mantenedornotificar = Mantenedornotificar();
            ViewBag.estadoOTs = Estado();

            ViewBag.Combosubsistema = ComboSubsistema();

            ViewBag.mantenedorreparo = mantenedorreparo();

            ViewBag.fitroestaciones = Filtroestaciones();

            ViewBag.filtrosubsistema = Filtrosubsistema();

            ViewBag.fitrousuario = Usuario();

            ViewBag.sistema = Sistema();


            return View();


          
        }



        //Metodo para listar y filtrar
        public ActionResult<ReportesView> Listarasincrono(ReportesView reportesView)
        {


            //con esta linea nos envitamos estar usando include para poder incluir toda la data relacionada que en este caso es mucha
            var reportes = Db.Reportes.ProjectTo<ReportesView>(mapper.ConfigurationProvider);


            //para realizar el filtrado combinado
            
            if (reportesView.Ot != null)
            {
                reportes = reportes.Where(t => t.Ot == reportesView.Ot);
            }

            if (reportesView.IdEstacion != 0)
            {
                reportes = reportes.Where(t => t.IdEstacion == reportesView.IdEstacion);
            }

            if (reportesView.IdSubsistema != 0)
            {
                reportes = reportes.Where(t => t.IdSubsistema == reportesView.IdSubsistema);
            }

            if (reportesView.fechaaveriaGuardarMostrar != null)
            {
                var fechas = Convert.ToDateTime(reportesView.fechaaveriaGuardarMostrar);

                reportes = reportes.Where(t => t.Fechaaveria.Year == fechas.Year && t.Fechaaveria.Month == fechas.Month && t.Fechaaveria.Day == fechas.Day);
            }

            if (reportesView.IdEstadoOt != 0)
            {


                reportes = reportes.Where(r => r.IdEstadoOt == reportesView.IdEstadoOt);
            }

            if (reportesView.IdUsuarios != null)
            {
                reportes = reportes.Where(r => r.IdUsuarios == reportesView.IdUsuarios);
            }




            //convertimos a reportes en array para asi poder aplicarle un idexador mas abajo ya que iquerable que devolvia reportes no permites indexadores y aqui necesitamos recorre cada regstro para aplicar formatos
            var reportesArray = reportes.ToArray();


            int acumulador = 0;

            //con este bucle recorremos la lista de reporte para hacer tareas de eviatar que me envie nulos a la vista asi como evitar que si la fecha es nula en la base de dato  me muestre la fecha por defecto 
            foreach (var item in reportesArray)
            {

                //---------para fecha reporte de averia se muestre con este formato de fecha y no la que trae desde la Db-----//
                var fechaaveriaconvertida = item.Fechaaveria.ToString("dd/MM/yyyy HH:mm");

                //para aplicarle este idexador convertimos a reportes en un array ya que iquerable no permite idexadores
                reportesArray[acumulador].fechaaveriaGuardarMostrar = fechaaveriaconvertida;

                #region //-----------para fecha notificacion al mantenedor---------------------------//

                //convertimos la fecha que viene desde base de datos en tipo datetime? a Datetime
                //la recibimos de tipo datetime? para que esta pueda ser null y esta no sea obligatoria 

                var FechanotificacionConvertiDatetime = Convert.ToDateTime(item.Fechanotificacion);


                //aqui decimos si la fecha ya convertida a datemite recibio un null, esta me devuelve su tipo por defecto con convert.datetime y ese tipo por defecto es formato 01/01/01 si me devuelve esto entonces a reportes[acumulador].Fechanotificacionguardarmostrar le pasamos una cadena vacia para que no me muestre esa fecha que no es valida en la vista 
                if (FechanotificacionConvertiDatetime == default)
                {
                    reportesArray[acumulador].Fechanotificacionguardarmostrar = "";
                }
                else
                {
                    //aqui si recibimos una fecha desde base de datos entonces esa fecha ya convertida a datetime arriba la convertimos a string y le pasamos el formato en que queremos que se muestre
                    reportesArray[acumulador].Fechanotificacionguardarmostrar = FechanotificacionConvertiDatetime.ToString("dd/MM/yyyy HH:mm");
                }
                #endregion

                #region //--------------para fecha inicio de reparo de averia----------//

                var FechainicioConvertiDatetime = Convert.ToDateTime(item.Fechainicio);

                if (FechainicioConvertiDatetime == default)
                {
                    reportesArray[acumulador].Fechainicioguardarmostrar = "";
                }
                else
                {

                    reportesArray[acumulador].Fechainicioguardarmostrar = FechainicioConvertiDatetime.ToString("dd/MM/yyyy HH:mm");
                }


                #endregion

                #region //--------------para fecha final de reparo de averia----------//

                var FechafinalConvertiDatetime = Convert.ToDateTime(item.Fechafinal);

                if (FechafinalConvertiDatetime == default)
                {
                    reportesArray[acumulador].Fechafinalguardarmostrar = "";
                }
                else
                {

                    reportesArray[acumulador].Fechafinalguardarmostrar = FechafinalConvertiDatetime.ToString("dd/MM/yyyy HH:mm");
                }


                #endregion

              // aqui estamos comparando estas propiedades para si vienen null no me nuestre eso en el frontend y me lo muestre vacio

                item.MantenedorNotificar = item.MantenedorNotificar == null ? item.MantenedorNotificar = "" : item.MantenedorNotificar;
              
                item.OperadorCierre = item.OperadorCierre == null ? item.OperadorCierre = "" : item.OperadorCierre;
                item.CodigoOperadorCierre = item.CodigoOperadorCierre == null ? item.CodigoOperadorCierre = "" : item.CodigoOperadorCierre;

                item.MantenedorReparo = item.MantenedorReparo == null ? item.MantenedorReparo = "" : item.MantenedorReparo;

                item.Ot = item.Ot == null ? item.Ot = 0 : item.Ot = item.Ot;

                item.UsuarioActualizoNombre = item.UsuarioActualizoNombre == null ? item.UsuarioActualizoNombre = "" : item.UsuarioActualizoNombre = item.UsuarioActualizoNombre;

                
                acumulador = acumulador + 1;
            }


            return Json(reportesArray.OrderByDescending(r=> r.Id).Take(300));
        }



        //mantenedor reparo averia
        public List<Persona>mantenedorreparo()
        {

            //var mantenedor = (from p in Db.Personas
            //                  join fp in Db.Funcions
            //                  on p.IdFuncion equals (fp.Id)
            //                  where fp.Id == 2
            //                  select p).ToList();


            // 2  es el id de los tecnico

            var listPersonaTecnico =  Db.Personas.Where(n => n.IdFuncion == 2).Select(nom => new Persona
            {

                Nombre = nom.Nombre


            }).ToList();



            return listPersonaTecnico;


        }


        //Listar estaciones
        public List<Estacion> Estaciones()
        {
            var estaciones = Db.Estacions.ToList();


            return estaciones;

        }

        //Listar subsistemas
        public List<Subsistema> Subsistema()
        {

            var subsistema = Db.Subsistemas.ToList();

            return subsistema;

        }
        //Listar ComboList subsistemas
        public List<Subsistema> ComboSubsistema()
        {
            var subsistema = Db.Subsistemas.ToList();

            return subsistema;

        }

        //Listar sistemas
        public List<Sistema> Sistema()
        {

            var sistema = Db.Sistemas.ToList();

            return sistema;

        }
        //Listar ComboList Sistema
        public List<Sistema> ComboSistema()
        {
            var sistema = Db.Sistemas.ToList();

            return sistema;

        }

        //Listar Ubicacion
        public List<Ubicacion> Ubicacion()
        {
            var ubicacion = Db.Ubicacions.ToList();


            return ubicacion;

        }

        //Listar Criticidad
        public List<SelectListItem> Criticidad()
        {
            var criticidad = Db.Criticidads.Select(e => new SelectListItem
            {

                Text = e.Nombre,
                Value = e.Id.ToString()


            }).ToList();


            //criticidad.Insert(0, new SelectListItem
            //{Criticidad",
            //    Value = ""
            //});

            return criticidad;
            //    Text = "Seleccionar 

        }


        //Listar Usuarios
        public List<SelectListItem> Usuario()
        {
            var criticidad = Db.Usuarios.Select(u => new SelectListItem
            {

                Text = u.Nombre,
                Value = u.Id.ToString()

               
            }).ToList();


            criticidad.Insert(0, new SelectListItem
            {
                Text = "Seleccionar Usuario",
                Value = ""
            });

            return criticidad;

        }

        //Listar SM
        public List<SelectListItem> SM()
        {
            var SM = Db.Sms.Select(e => new SelectListItem
            {

                Text = e.Nombre,
                Value = e.Id.ToString()


            }).ToList();


            //SM.Insert(0, new SelectListItem
            //{
            //    Text = "Seleccionar S.M",
            //    Value = ""
            //});

            return SM;

        }


        //Listar Mantenedor a notificar
        public List<Persona> Mantenedornotificar()
        {

            //var mantenedor = (from p in Db.Personas
            //                  join fp in Db.FuncionPersonas
            //                  on p.Id equals (fp.IdPersona)
            //                  join f in Db.Funcions
            //                  on fp.IdFuncion equals (f.Id)
            //                  where f.Id == 1
            //                  select p).ToList();


            // 1 es el id de Call center
            var listPersonaCallCenter = Db.Personas.Where(n => n.IdFuncion == 1).Select(nom => new Persona
            {
              
                Nombre = nom.Nombre


            }).ToList();

            //var ListPersonas =  Db.Funcions.Where(n => n.Nombre == "Call Center").Select(p => new MantenedorNotificarViewcs
            //{

            //   Nombres = p.Personas.Select(p=> p.Nombre).ToList()
              

            //}).ToList();


            //var personas = ListPersonas[0].Nombres;

            return listPersonaCallCenter;


        }

        //Listar por Estado de las OT
        //tambien es usado para filtrar
        public List<SelectListItem> Estado()
        {
            var mantenedor = Db.EstadoOts.Select(e => new SelectListItem
            {

                Text = e.Nombre,
                Value = e.Id.ToString()


            }).ToList();

            mantenedor.Insert(0, new SelectListItem
            {
                Text = "Estado",
                Value = ""
            });

            return mantenedor;

        }


        //Listar Operadores
        public IActionResult Operador(string op)
        {

            //var operador = Db.Operadors.FirstOrDefault(o => o.Codigo == op);

            var operador = Db.Personas.Where(o => o.Codigo == op).Select(o => new
            {

                nombre = o.Nombre

            }).ToList();



            return Json(operador);


        }

        //metodo para cargar la descripcion de activos y el mantenedor segun el subsistema esto para crear combolist en cascada con las descripciones

        public async Task< IActionResult >Descripcion(string subsistema)
        {

            var Buscarsubsistema = await Db.Subsistemas.Where(s => s.Nombre == subsistema).Select(b=>new
            {

                // para acceder a la data relacionada debemos con include indicarle en este caso no lo hicimos 
                //porque estamos devolviendo un objeto anonimo y el hacede a la data relacionada si indiarlo


                //mantenedor es padre de susbsistema 
               // asi novegamos de hijo a padre a travez de su propiedad de navegacion
                mantenedor = b.IdMantenedorNavigation.Nombre,


                //despcricion es hijo de subsistema
                //asi navegamos de padre a hijos y obtenemos una lista de hijos
                descripcion = b.Activos.Select(d=> d.Descripcion).ToList()

            }).FirstOrDefaultAsync();

          


            return Json(Buscarsubsistema);




        }

        //metodo para cargar los subsistema segun el sistema que se elija  esto para crear un combolist en cascada
        public async Task< IActionResult >SubsistemaCascada(string sistema)
        {

            var idsistema = await Db.Sistemas.Where(s => s.Nombre == sistema).FirstOrDefaultAsync();

           

            var Subsistema = await Db.Subsistemas.Where(o => o.IdSistema == idsistema.Id).Select(o => new
            {

                nombre = o.Nombre,
                
                
            }).ToListAsync();

            if (Subsistema == null)
            {
                return Json("");
            }
       

            return Json(Subsistema);


        }


        //metodo para el filtrado de estaciones
        public List<SelectListItem> Filtroestaciones()
        {
            var estaciones = Db.Estacions.Select(e => new SelectListItem
            {

                Text = e.Nombre,
                Value = e.Id.ToString()


            }).ToList();


            estaciones.Insert(0, new SelectListItem
            {
                Text = "Seleccionar Estacion",
                Value = ""
            });

            return estaciones;

        }

        //metodo para el filtrado de subsistemas
        public List<SelectListItem> Filtrosubsistema()
        {
            var subsistema = Db.Subsistemas.Select(e => new SelectListItem
            {

                Text = e.Nombre,
                Value = e.Id.ToString()


            }).ToList();


            subsistema.Insert(0, new SelectListItem
            {
                Text = "Selecionar Subsistema",
                Value = ""
            });

            return subsistema;

        }

    // con este metodo buscamo si existe por lo menos un registro con un numero de ot 
    //para pasar la al frontend y indicar si es duplicada en caso de que exista 1 por lo menos
       public int BuscarOt(long? ot)
        {

            if (ot == 0)
            {
                ot = null;
            }
            var Ots = Db.Reportes.Where(r => r.Ot == ot).Select(r => new
            {

                ot = r.Ot

            }).Count();

            
            
            return Ots;
            

        }


      


        


        //Metodo para crear y Editar los reportes
        [HttpPost]
        public async Task< IActionResult> CrearEditarReportes([FromBody] ReportesCreateView reporte)
        
        {

            if (reporte !=null )
            {
                //darle formato a la fecha yyyy-MM-dd que es la que la base de dato soporta
                var fechareporte = convertircadenafecha(reporte.fechaaveriaGuardarMostrar);
                var fechanotificacion = convertircadenafecha(reporte.Fechanotificacionguardarmostrar);
                var fechainicio = convertircadenafecha(reporte.Fechainicioguardarmostrar);
                var fechafinal = convertircadenafecha(reporte.Fechafinalguardarmostrar);



                //----aqui buscamos el id de cada uno de esto ya que por usar datalist no podemos traer su  id desde la vista
                //----pero traemos lo que se digite en el campo lo buscamos y estraemos su id para luego gardar en base de datos

                //var operadorreporte = Db.Personas.FirstOrDefault(o => o.Codigo == reporte.OperadorreporteCodigo);



                var sistema = Db.Sistemas.FirstOrDefault(o => o.Nombre == reporte.Sistema);
                var subsistema = Db.Subsistemas.FirstOrDefault(o => o.Nombre == reporte.Subsistema);
                var estacion = Db.Estacions.FirstOrDefault(o => o.Nombre == reporte.Estacion);


                if (sistema == null || subsistema ==null || estacion == null)
                {
                    return Ok(3);
                }
                //var ubicacion = Db.Ubicacions.FirstOrDefault(o => o.Nombre == reporte.UbicacionesNombre);
                //var mantenedornotificar = Db.Personas.FirstOrDefault(m => m.Nombre == reporte.MantenedorNotificarNombre);
                //var mantenedorreparo = Db.Personas.FirstOrDefault(m => m.Nombre == reporte.MantenedorReparoNombre);
                //var operadorcierre = Db.Personas.FirstOrDefault(o => o.Codigo == reporte.OperadorCierreCodigo);

                //reporte.IdMantenedorNotificar = (mantenedornotificar != null) ? reporte.IdMantenedorNotificar = mantenedornotificar.Id : reporte.IdMantenedorNotificar = null;

                //reporte.IdmantenedorReparo = (mantenedorreparo != null) ? reporte.IdmantenedorReparo = mantenedorreparo.Id : reporte.IdmantenedorReparo = null;

                //reporte.IdOperadorCierre = (operadorcierre != null) ? reporte.IdOperadorCierre = operadorcierre.Id : reporte.IdOperadorCierre = null;



               

                if (reporte.Id == 0)
                 {
                     //Crear
                    if (ModelState.IsValid)
                    {

                        var userName = HttpContext.User.Claims.ToList();

                       

                        reporte.IdUsuarios = Convert.ToInt32(userName[2].Value);


                        //este metodo lo hacemos  porque si reutilizamos un registro vendra con el estado que tenga el registro a reutilizar o copiar, entonces si no hacemos esto podria pasar que reutilicemos por ej. un registro con estado creada y al reutilizarlo no nos creara el nuevo registro con estadoot duplicada mas bien heredara el estado del registro reutilizado.

                        var CompararOT = BuscarOt(reporte.Ot);
                        
                      
                         // si el registro a reutilizar trae una ot que existe le ponemos el estado duplicada asi le quitamos el que trae heredado del registro original 
                        if (CompararOT != 0)
                        {
                            reporte.IdEstadoOt = 7;
                        }

                        //si el estado de OT es 0 el registro se guardara con el estado de OT sin estado
                        // al crear un registro nuevo donde el campo ot y el campo mantenedor notf esten vacio se gardaran con estado sin estado por default
                        if (reporte.IdEstadoOt ==0)
                        {
                            reporte.IdEstadoOt = 8;
                        }
                       
                     
                            var mapReporte = mapper.Map<Reporte>(reporte);

                            mapReporte.IdSistema= sistema.Id;
                            mapReporte.Idmantenedor = subsistema.IdMantenedor;
                            mapReporte.IdSubsistema = subsistema.Id;
                            mapReporte.IdEstacion = estacion.Id;
                            mapReporte.Fechaaveria = Convert.ToDateTime(fechareporte);
                            mapReporte.Fechanotificacion = fechanotificacion;
                            mapReporte.Fechainicio = fechainicio;
                            mapReporte.Fechafinal = fechafinal;
                       

                        var reporteCreate = await repository.CreateAsync(mapReporte);

                        await hubContext.Clients.All.SendAsync("recibir");

                        

                        return Ok(reporteCreate);


                     }

                 }

                else
                {
                    //Actualizar

                    if (ModelState.IsValid)
                    {

                            var existeResgistro =await Db.Reportes.AnyAsync(r => r.Id == reporte.Id);

                            if (existeResgistro == false)
                            {
                                return Ok(4);
                            }

                         var userName = HttpContext.User.Claims.ToList();

                         reporte.IdUsuarioActualizo = Convert.ToInt32(userName[2].Value);

                            if (reporte.IdEstadoOt == 0)
                            {
                                reporte.IdEstadoOt = 8;
                            }


                        
                            var mapReporte = mapper.Map<Reporte>(reporte);
                            mapReporte.IdSistema = sistema.Id;
                            mapReporte.Idmantenedor = subsistema.IdMantenedor;
                            mapReporte.IdSubsistema = subsistema.Id;
                            mapReporte.IdEstacion = estacion.Id;
                            mapReporte.Fechaaveria = Convert.ToDateTime(fechareporte);
                            mapReporte.Fechanotificacion = fechanotificacion;
                            mapReporte.Fechainicio = fechainicio;
                            mapReporte.Fechafinal = fechafinal;

                            var reporteUpdate = await repository.UpdateAsync(mapReporte);

                        await hubContext.Clients.All.SendAsync("recibir");

                        

                            return Ok(reporteUpdate);


                    }
                }


            }

            return Ok(0);


        }



        //Metodo para darle formato a la fecha que se va enviar a la base de datos
        public DateTime? convertircadenafecha(string fecha)
        {


            //convertir fecha al formato y tipo de dato que recibe SQL
            //recibimos una cadena en formato dd-MM-yyy hh:mm y convertimos en yyy-MM-dd hh:mm
            //luego de convertir al formato que necesitamos la convertimos la cadena a  datatime


            if (fecha != null && fecha != "")
            {
                //convertir la cadena al formato necesario
                //con split(new char[] {}) podemos espeficicar vairos deparadores para cortar nuestra cadenasin indicar el limitador
                var splisfecha = fecha.Split(new char[] { '/', ' '});

                string dias = splisfecha[0], meses = splisfecha[1], anios = splisfecha[2], horas = splisfecha[3];

                var Fechaformatoconvertido = new DateTime().ToString($"{anios}/{meses}/{dias}' '{horas}");


                // ahora convertirmos la cadema obtenida en datatime que es el tipo de dato que recibe SQL

                return Convert.ToDateTime(Fechaformatoconvertido);
            }
            else
            {
                return null;
            }


        }


        //Metodo para recuperar la informacion y luego editar
        [HttpGet]
        public IActionResult BuscarEditar(int id)
        {


            var cargarreporte = Db.Reportes.ProjectTo<ReportesView>
                (mapper.ConfigurationProvider).FirstOrDefault(p => p.Id == id);

            //var buscarreporte = Db.Reportes.Include(e => e.Estaciones).Include(s => s.Subsistemas).Include(s => s.Sistemas).FirstOrDefault(i => i.Id == id);



            //var cargarreporte = mapper.Map<ReportesView>(buscarreporte);


            var fechaaveriaconvertida = cargarreporte.Fechaaveria.ToString("dd/MM/yyyy HH:mm");

            cargarreporte.fechaaveriaGuardarMostrar = fechaaveriaconvertida;

            #region //---------------fecha notificacion mantenedor ----------------//

            var fechanotificacionconvertida = Convert.ToDateTime(cargarreporte.Fechanotificacion);

            if (fechanotificacionconvertida == default)
            {
                cargarreporte.Fechanotificacionguardarmostrar = "";
            }
            else
            {
                cargarreporte.Fechanotificacionguardarmostrar = fechanotificacionconvertida.ToString("dd/MM/yyyy HH:mm");
            }

            #endregion


            #region //---------------fecha inicio reparo averia ----------------//

            var fechainicioconvertida = Convert.ToDateTime(cargarreporte.Fechainicio);

            if (fechainicioconvertida == default)
            {
                cargarreporte.Fechainicioguardarmostrar = "";
            }
            else
            {
                cargarreporte.Fechainicioguardarmostrar = fechainicioconvertida.ToString("dd/MM/yyyy HH:mm");
            }

            #endregion


            #region //---------------fecha inicio reparo averia ----------------//

            var fechafinalconvertida = Convert.ToDateTime(cargarreporte.Fechafinal);

            if (fechafinalconvertida == default)
            {
                cargarreporte.Fechafinalguardarmostrar = "";
            }
            else
            {
                cargarreporte.Fechafinalguardarmostrar = fechafinalconvertida.ToString("dd/MM/yyyy HH:mm");
            }

            #endregion



            return Json(cargarreporte);
        }


        [HttpPost]
        public async Task<ActionResult> ConfigStyle([FromBody] ConfigUsuario background_color)
        {
            //obtenemos el usario activo
            var userName = HttpContext.User.Claims.ToList();

            //le asignamo e usuario al nuestro objeto que viene desde el front
            background_color.IdUsuario = Convert.ToInt32(userName[2].Value);

            //aqui verifiamos si este usuario tiene ya un registro
            var buscarId = await Db.ConfigUsuarios.FirstOrDefaultAsync(u => u.IdUsuario == background_color.IdUsuario);

            // si no existe registro Crear new
            if (buscarId == null)
            {
                Db.ConfigUsuarios.Add(background_color);

                
                await Db.SaveChangesAsync();

                return Ok(background_color);
            }

            //Actualizar si ya existe
            buscarId.Background = background_color.Background;

            Db.ConfigUsuarios.Update(buscarId);
            await Db.SaveChangesAsync();


            return Ok(background_color);


         }


        public async Task<ActionResult> RecuperarStyle()
        {
            var userName = HttpContext.User.Claims.ToList();
            var recuperarStyle = await Db.ConfigUsuarios.FirstOrDefaultAsync(u => u.IdUsuario == Convert.ToInt32(userName[2].Value));

            if (recuperarStyle == null)
            {
                return Ok("#ffffff");
            }

            return Ok(recuperarStyle);

        }

        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

    }

   


}
