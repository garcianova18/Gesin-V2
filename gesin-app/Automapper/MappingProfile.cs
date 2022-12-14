using AutoMapper;
using gesin_app.Models;
using gesin_app.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace gesin_app.Automapper
{
    public class MappingProfile:Profile
    {

        public MappingProfile()
        {
            CreateMap<Reporte, ReportesView>().ReverseMap();
            CreateMap<Reporte, ReportesCreateView>().ReverseMap();
            CreateMap<Persona, PersonaView>().ReverseMap();
            CreateMap<Persona, PersonaCrearView>().ReverseMap();
            CreateMap<Usuario, UsuariosView>().ReverseMap();
            CreateMap<Usuario, UsuarioCreateView>().ReverseMap();

            //CreateMap<Reporte, ReportesView>().ForMember(destino => destino.usuarionombre, opt => opt.MapFrom(fuente => fuente.Usuarios.Nombre)).ReverseMap();

        }
    }
}
