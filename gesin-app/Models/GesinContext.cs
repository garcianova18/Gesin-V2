using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace gesin_app.Models
{
    public partial class GesinContext : DbContext
    {
        public GesinContext()
        {
        }

        public GesinContext(DbContextOptions<GesinContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Activo> Activos { get; set; }
        public virtual DbSet<Criticidad> Criticidads { get; set; }
        public virtual DbSet<EmpresaMantenedora> EmpresaMantenedoras { get; set; }
        public virtual DbSet<Estacion> Estacions { get; set; }
        public virtual DbSet<EstadoOt> EstadoOts { get; set; }
        public virtual DbSet<Funcion> Funcions { get; set; }
        public virtual DbSet<FuncionPersona> FuncionPersonas { get; set; }
        public virtual DbSet<Persona> Personas { get; set; }
        public virtual DbSet<Reporte> Reportes { get; set; }
        public virtual DbSet<Rol> Rols { get; set; }
        public virtual DbSet<Sistema> Sistemas { get; set; }
        public virtual DbSet<Subsistema> Subsistemas { get; set; }
        public virtual DbSet<Ubicacion> Ubicacions { get; set; }
        public virtual DbSet<Usuario> Usuarios { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {

                //optionsBuilder.UseSqlServer("Server= DESKTOP-BP6RUJQ\\SQLEXPRESS; Initial catalog = Gesin; Trusted_Connection = true;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Latin1_General_CI_AI");

            modelBuilder.Entity<Activo>(entity =>
            {
                entity.Property(e => e.Descripcion).HasMaxLength(200);

                entity.HasOne(d => d.IdsubsistemaNavigation)
                    .WithMany(p => p.Activos)
                    .HasForeignKey(d => d.Idsubsistema)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DescripcionSelect_Subsistema");
            });

            modelBuilder.Entity<Criticidad>(entity =>
            {
                entity.ToTable("Criticidad");

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(15);
            });

            modelBuilder.Entity<EmpresaMantenedora>(entity =>
            {
                entity.HasKey(e => e.IdEmpresamantenedora)
                    .HasName("PK_Empresa_mantenedora");

                entity.ToTable("Empresa_Mantenedora");

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(20);
            });

            modelBuilder.Entity<Estacion>(entity =>
            {
                entity.ToTable("Estacion");

                entity.Property(e => e.Nombre).HasMaxLength(20);
            });

            modelBuilder.Entity<EstadoOt>(entity =>
            {
                entity.ToTable("EstadoOT");

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(20);
            });

            modelBuilder.Entity<Funcion>(entity =>
            {
                entity.ToTable("Funcion");

                entity.Property(e => e.Funcion1)
                    .IsRequired()
                    .HasMaxLength(20)
                    .HasColumnName("Funcion");
            });

            modelBuilder.Entity<FuncionPersona>(entity =>
            {
                entity.HasKey(e => e.Idfuncionmantenedor)
                    .HasName("PK_Funcionmantenedor_1");

                entity.ToTable("Funcion_Persona");

                entity.HasOne(d => d.IdFuncionNavigation)
                    .WithMany(p => p.FuncionPersonas)
                    .HasForeignKey(d => d.IdFuncion)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Funcion_Persona_Funcion");

                entity.HasOne(d => d.IdPersonaNavigation)
                    .WithMany(p => p.FuncionPersonas)
                    .HasForeignKey(d => d.IdPersona)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Funcion_Persona_Persona");
            });

            modelBuilder.Entity<Persona>(entity =>
            {
                entity.ToTable("Persona");

                entity.Property(e => e.Codigo)
                    .IsRequired()
                    .HasMaxLength(10);

                entity.Property(e => e.IdEmpresaMantenedora).HasColumnName("IdEmpresa_mantenedora");

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(20);

                entity.HasOne(d => d.IdEmpresaMantenedoraNavigation)
                    .WithMany(p => p.Personas)
                    .HasForeignKey(d => d.IdEmpresaMantenedora)
                    .HasConstraintName("FK_Persona_Empresa_Mantenedora");
            });

            modelBuilder.Entity<Reporte>(entity =>
            {
                entity.Property(e => e.Comentario).HasMaxLength(200);

                entity.Property(e => e.Descripcion).HasMaxLength(200);

                entity.Property(e => e.Fechaaveria).HasColumnType("datetime");

                entity.Property(e => e.Fechafinal).HasColumnType("datetime");

                entity.Property(e => e.Fechainicio).HasColumnType("datetime");

                entity.Property(e => e.Fechanotificacion).HasColumnType("datetime");

                entity.Property(e => e.IdEstadoOt).HasColumnName("IdEstadoOT");

                entity.Property(e => e.IdMantenedorNotificar).HasColumnName("IdMantenedor_notificar");

                entity.Property(e => e.IdOperadorCierre).HasColumnName("IdOperador_Cierre");

                entity.Property(e => e.IdOperadorReporte).HasColumnName("IdOperador_reporte");

                entity.Property(e => e.IdUsuarioActualizo).HasColumnName("IdUsuario_Actualizo");

                entity.Property(e => e.IdmantenedorReparo).HasColumnName("Idmantenedor_reparo");

                entity.Property(e => e.Ot).HasColumnName("OT");

                entity.HasOne(d => d.Criticidad)
                    .WithMany(p => p.Reportes)
                    .HasForeignKey(d => d.IdCriticidad)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Reportes_Criticidad");

                entity.HasOne(d => d.Estaciones)
                    .WithMany(p => p.Reportes)
                    .HasForeignKey(d => d.IdEstacion)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Reportes_Estacion");

                entity.HasOne(d => d.EstadoOT)
                    .WithMany(p => p.Reportes)
                    .HasForeignKey(d => d.IdEstadoOt)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Reportes_EstadoOT");

                entity.HasOne(d => d.Mantenedornotificar)
                    .WithMany(p => p.ReporteIdMantenedorNotificarNavigations)
                    .HasForeignKey(d => d.IdMantenedorNotificar)
                    .HasConstraintName("FK_Reportes_mantenedor_notificar");

                entity.HasOne(d => d.Operadorcierre)
                    .WithMany(p => p.ReporteIdOperadorCierreNavigations)
                    .HasForeignKey(d => d.IdOperadorCierre)
                    .HasConstraintName("FK_Reportes_operador_cierre");

                entity.HasOne(d => d.Operadorreporte)
                    .WithMany(p => p.ReporteIdOperadorReporteNavigations)
                    .HasForeignKey(d => d.IdOperadorReporte)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Reportes_operador_reporte");

                entity.HasOne(d => d.Sistemas)
                    .WithMany(p => p.Reportes)
                    .HasForeignKey(d => d.IdSistemas)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Reportes_Sistema");

                entity.HasOne(d => d.Subsistemas)
                    .WithMany(p => p.Reportes)
                    .HasForeignKey(d => d.IdSubsistema)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Reportes_Subsistema");

                entity.HasOne(d => d.Ubicaciones)
                    .WithMany(p => p.Reportes)
                    .HasForeignKey(d => d.IdUbicacion)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Reportes_Ubicacion");

                entity.HasOne(d => d.UsuarioActualizo)
                    .WithMany(p => p.ReporteIdUsuarioActualizoNavigations)
                    .HasForeignKey(d => d.IdUsuarioActualizo)
                    .HasConstraintName("FK_Reportes_Usuario_actualizo");

                entity.HasOne(d => d.Usuarios)
                    .WithMany(p => p.ReporteIdUsuariosNavigations)
                    .HasForeignKey(d => d.IdUsuarios)
                    .HasConstraintName("FK_Reportes_Usuario");

                entity.HasOne(d => d.Mantenedorreparo)
                    .WithMany(p => p.ReporteIdmantenedorReparoNavigations)
                    .HasForeignKey(d => d.IdmantenedorReparo)
                    .HasConstraintName("FK_Reportes_mantenedor_reparo");
            });

            modelBuilder.Entity<Rol>(entity =>
            {
                entity.ToTable("Rol");

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(20);
            });

            modelBuilder.Entity<Sistema>(entity =>
            {
                entity.ToTable("Sistema");

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(20);
            });

            modelBuilder.Entity<Subsistema>(entity =>
            {
                entity.ToTable("Subsistema");

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Ubicacion>(entity =>
            {
                entity.ToTable("Ubicacion");

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Usuario>(entity =>
            {
                entity.ToTable("Usuario");

                entity.Property(e => e.Apellido)
                    .IsRequired()
                    .HasMaxLength(20);

                entity.Property(e => e.Fecha).HasColumnType("datetime");

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(20);

                entity.Property(e => e.UserName)
                    .IsRequired()
                    .HasMaxLength(10);

                entity.HasOne(d => d.IdRolNavigation)
                    .WithMany(p => p.Usuarios)
                    .HasForeignKey(d => d.IdRol)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Usuario_Rol");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
