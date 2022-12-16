using gesin_app.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace gesin_app.Controllers  
{

   
    public class AccesoController : Controller
    {

        private readonly GesinV2Context Db;
        private readonly IDataProtector dataProtector;

        public AccesoController( GesinV2Context context, IDataProtectionProvider dataProtector)
        {
            Db = context;
            this.dataProtector = dataProtector.CreateProtector("llave_Protecion");
        }

        public IActionResult Index()
        {



            return View();
        }


        [HttpPost]
        public async Task< IActionResult> Login( Usuario usuario)
        {

            var usuarios = await Db.Usuarios.Include(R=> R.IdRolNavigation).Where(u => u.UserName == usuario.UserName).FirstOrDefaultAsync();




            if (usuarios != null)
            {

                var passUnprotector = dataProtector.Unprotect(usuarios.Password);

                if (usuario.Password == passUnprotector)
                {
                    ViewBag.usuario = usuarios.UserName;


                    var Claims = new List<Claim>
                    {
                       new Claim("Username", usuarios.UserName),
                       new Claim (ClaimTypes.Name, usuarios.Nombre),
                       new Claim("id", usuarios.Id.ToString()),
                       new Claim(ClaimTypes.Role, usuarios.IdRolNavigation.Nombre)
                    };

                    var claimidentity = new ClaimsIdentity(Claims, CookieAuthenticationDefaults.AuthenticationScheme);


                    await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimidentity));

                    return RedirectToAction("Index", "Reportes");
                }

                else
                {
                    return View(nameof(Index));
                }

            }
            else
            {
                ViewBag.errorusuario = "El usuario o contraseña que ha ingresado es incorrecto vuelva a intentarlo";
                return View(nameof(Index));
            }
        }


          

        public async Task< IActionResult > Logout()
        {

            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);

            return RedirectToAction(nameof(Index), "acceso");
        }

        public IActionResult Restringido()
        {

            return View();

        }
    }
}
