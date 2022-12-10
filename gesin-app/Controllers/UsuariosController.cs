﻿
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
//using ClosedXML.Excel;
using System.IO;
using gesin_app.Models;
using gesin_app.Controllers;
using gesin_app.Servicios;
using gesin_app.ViewModel;
//using Agendatelefonica.Services;

namespace gesin_app.Controllers
{
    public class UsuariosController : Controller
    {
        private readonly GesinV2Context context;
        private readonly IMapper mapper;
        private readonly IHubContext<GesinHub> hubContext;
        private readonly IrepositoryGeneric<Usuario> repositoryGenerico;

        public UsuariosController(GesinV2Context context, IMapper mapper, IHubContext<GesinHub> hubContext, IrepositoryGeneric<Usuario> repositoryGenerico)
        {
            this.context = context;
            this.mapper = mapper;
            this.hubContext = hubContext;
            this.repositoryGenerico = repositoryGenerico;
        }

        public ActionResult Index()
        {

            ViewBag.rol = SelectRol();

            return View();
        }

        public ActionResult ListarUsuarios()
        {

            var usuarios = context.Usuarios.ProjectTo<UsuariosView>(mapper.ConfigurationProvider);

            //var usuarios = context.Usuarios.Include(r => r.IdRolNavigation).ToList();
            //var klk = mapper.Map<List<UsuariosView>>(usuarios);

            return Json(usuarios);
        }

        public async Task<ActionResult<int>> CrearEditarUsuarios([FromBody] UsuarioCreateView usuario)
        {
            if (usuario.Id == 0)
            {

                var verificaExisteUser = context.Usuarios.Where(u => u.UserName.Trim() == usuario.UserName.Trim()).Count();

                if (verificaExisteUser == 1)
                {
                    return 3;
                }

             

                //Crear

                if (ModelState.IsValid)
                {
                    

                    var mapUsuario = mapper.Map<Usuario>(usuario);

                    mapUsuario.Fecha = DateTime.Now;

                    var usuarioCreate = await repositoryGenerico.CreateAsync(mapUsuario);
                    await hubContext.Clients.All.SendAsync("recibir");



                    return usuarioCreate;
                }

            }
            else
            {
                //Editar

                var verificaExisteUser = context.Usuarios.Where(u => u.UserName.Trim() == usuario.UserName.Trim() && u.Id != usuario.Id).Count();


                if (verificaExisteUser == 1)
                {
                    return 3;
                }

                if (ModelState.IsValid)
                {

                    var mapUsuario = mapper.Map<Usuario>(usuario);

                    var usuarioUpdate= await repositoryGenerico.UpdateAsync(mapUsuario);

                    
                    await hubContext.Clients.All.SendAsync("recibir");

                    return usuarioUpdate;


                }
            }


            return 0;
        }

        public async Task<ActionResult<UsuariosView>> buscarUsuarios(int? id)
        {
           
            if (id == 0 || id == null)
            {
                return Ok(0);
            }
            var Usuario = await context.Usuarios.Include(r => r.IdRolNavigation).FirstOrDefaultAsync(u => u.Id == id);

            if (Usuario == null)
            {
                return Ok(0);
            }

            var mapUsuario =mapper.Map<UsuariosView>(Usuario);

            return mapUsuario;

        }


        public async Task<int> EliminarUsuarios(int? id)
        {
            if (id == 0 || id == null)
            {
                return 0;
            }

            var usuario = await repositoryGenerico.GetByIdAsync(id);


            if (usuario == null)
            {
                return 0;
            }

            var usuarioDelete = await repositoryGenerico.DeleteAsync(usuario);

            await hubContext.Clients.All.SendAsync("recibir");

            return usuarioDelete;
        }


        public List<SelectListItem> SelectRol()
        {

            var roles = context.Rols.Select(r => new SelectListItem
            {

                Text = r.Nombre,
                Value = r.Id.ToString()

            }).ToList();

            roles.Insert(0, new SelectListItem
            {
                Text = "Seleccione un rol",
                Value = ""
            });


            return roles;



        }



        //#region Metodo para imprimir los reportes de los registro
        //public async Task<FileResult> ReportesExcel()
        //{
        //    DataTable tabla_Electromecanica = new DataTable();
        //    DataTable tabla_Mantenedor = new DataTable();

        //    List<DataTable> tables = new List<DataTable>();


        //    creamos las columnas que contendra nuestro tabla y las nombramos

        //    tabla_Mantenedor.Columns.AddRange(new DataColumn[]
        //       {

        //            new DataColumn("Mantenedor"),
        //            new DataColumn("Nombre"),
        //            new DataColumn("Funcion"),
        //            new DataColumn("Telefono"),
        //            new DataColumn("Extension"),
        //            new DataColumn("Subsistema"),





        //       });

        //    tabla_Electromecanica.Columns.AddRange(new DataColumn[5]
        //       {
        //            new DataColumn("Nombre"),
        //            new DataColumn("Telefono"),
        //            new DataColumn("Extension"),
        //            new DataColumn("Correo"),
        //            new DataColumn("Subsistema"),



        //       });

        //    var mantenedores = await context.Mantenedores.ToListAsync();
        //    var Electromecanica = await context.Electromecanicas.ToListAsync();

        //    aqui recorremos nuestro listado de usuarios para asignarselo a las fila de nuestra tabla

        //    foreach (var mantenedor in mantenedores)
        //    {
        //        tabla_Mantenedor.Rows.Add(mantenedor.Mantenedor, mantenedor.Nombre, mantenedor.Funcion, mantenedor.Telefono, mantenedor.Extension, mantenedor.Subsistema);


        //    }
        //    foreach (var electro in Electromecanica)
        //    {
        //        tabla_Electromecanica.Rows.Add(electro.Nombre, electro.Telefono, electro.Extension, electro.Correo, electro.Subsistema);

        //    }

        //    crear libro de excel

        //    using (var libro = new XLWorkbook())
        //    {
        //        le damos un bombre a la tabla la cual sera el nombre de la hoja excel
        //        tabla_Electromecanica.TableName = "Electromecanica";
        //        tabla_Mantenedor.TableName = "Mantenedores";

        //        crear hoja de excel
        //        var hoja_electromecanica = libro.AddWorksheet(tabla_Electromecanica);
        //        hoja_electromecanica.ColumnsUsed().AdjustToContents();

        //        var hoja_mantenedores = libro.AddWorksheet(tabla_Mantenedor).ColumnsUsed().AdjustToContents();





        //        guardamos el libro en memoria

        //        using (var memoria = new MemoryStream())
        //        {
        //            libro.SaveAs(memoria);

        //            le damos un nombre al archivo de excel y la extension en que se guardara
        //            var NombreArchivo_Excel = string.Concat("Listado_Telefonico", ".xlsx");

        //            return File(memoria.ToArray(), "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", NombreArchivo_Excel);

        //        }


        //    }




        //}

        //#endregion

    }
}
