using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace gesin_app.Models
{
    public partial class GesinV2Context : DbContext
    {
        public GesinV2Context()
        {
        }

        public GesinV2Context(DbContextOptions<GesinV2Context> options)
            : base(options)
        {
        }

        public virtual DbSet<Activo> Activos { get; set; }
        public virtual DbSet<ConfigUsuario> ConfigUsuarios { get; set; }
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
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server= MCFLOW-PC\\SQLEXPRESS; Initial catalog =GesinV2 ; Trusted_Connection = true;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Modern_Spanish_CI_AS");

            modelBuilder.Entity<Activo>(entity =>
            {
                entity.Property(e => e.Descripcion).HasMaxLength(200);

                entity.HasOne(d => d.IdsubsistemaNavigation)
                    .WithMany(p => p.Activos)
                    .HasForeignKey(d => d.Idsubsistema)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DescripcionSelect_Subsistema");
            });

            modelBuilder.Entity<ConfigUsuario>(entity =>
            {
                entity.ToTable("Config_Usuario");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Background).HasMaxLength(60);

                entity.HasOne(d => d.IdNavigation)
                    .WithOne(p => p.ConfigUsuario)
                    .HasForeignKey<ConfigUsuario>(d => d.Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Config_Usuario_Usuario");
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
                    .HasMaxLength(100);
            });

            modelBuilder.Entity<Estacion>(entity =>
            {
                entity.ToTable("Estacion");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Nombre).HasMaxLength(100);
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
                    .HasMaxLength(100)
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

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Codigo)
                    .IsRequired()
                    .HasMaxLength(20);

                entity.Property(e => e.IdEmpresaMantenedora).HasColumnName("IdEmpresa_mantenedora");

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(60);

                entity.HasOne(d => d.IdEmpresaMantenedoraNavigation)
                    .WithMany(p => p.Personas)
                    .HasForeignKey(d => d.IdEmpresaMantenedora)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Persona_Empresa_Mantenedora");
            });

            modelBuilder.Entity<Reporte>(entity =>
            {
                entity.Property(e => e.CodigoOperadorCierre)
                    .HasMaxLength(50)
                    .HasColumnName("CodigoOperador_Cierre");

                entity.Property(e => e.CodigoOperadorReporte)
                    .HasMaxLength(50)
                    .HasColumnName("CodigoOperador_reporte");

                entity.Property(e => e.Comentario).HasMaxLength(400);

                entity.Property(e => e.Descripcion)
                    .IsRequired()
                    .HasMaxLength(400);

                entity.Property(e => e.Fechaaveria).HasColumnType("datetime");

                entity.Property(e => e.Fechafinal).HasColumnType("datetime");

                entity.Property(e => e.Fechainicio).HasColumnType("datetime");

                entity.Property(e => e.Fechanotificacion).HasColumnType("datetime");

                entity.Property(e => e.IdEstadoOt).HasColumnName("IdEstadoOT");

                entity.Property(e => e.IdUsuarioActualizo).HasColumnName("IdUsuario_Actualizo");

                entity.Property(e => e.MantenedorNotificar)
                    .HasMaxLength(50)
                    .HasColumnName("Mantenedor_notificar");

                entity.Property(e => e.MantenedorReparo)
                    .HasMaxLength(50)
                    .HasColumnName("Mantenedor_reparo");

                entity.Property(e => e.OperadorCierre)
                    .HasMaxLength(50)
                    .HasColumnName("Operador_Cierre");

                entity.Property(e => e.OperadorReporte)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("Operador_reporte");

                entity.Property(e => e.Ot).HasColumnName("OT");

                entity.Property(e => e.Ubicacion)
                    .IsRequired()
                    .HasMaxLength(100);

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

                entity.HasOne(d => d.Sistemas)
                    .WithMany(p => p.Reportes)
                    .HasForeignKey(d => d.IdSistemas)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Reportes_Sistema");

                entity.HasOne(d => d.Subsistemas)
                    .WithMany(p => p.Reportes)
                    .HasForeignKey(d => d.IdSubsistema)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Reportes_Subsistemas");

                entity.HasOne(d => d.UsuarioActualizo)
                    .WithMany(p => p.ReporteIdUsuarioActualizoNavigations)
                    .HasForeignKey(d => d.IdUsuarioActualizo)
                    .HasConstraintName("FK_Reportes_Usuario_actualizo");

                entity.HasOne(d => d.Usuarios)
                    .WithMany(p => p.ReporteIdUsuariosNavigations)
                    .HasForeignKey(d => d.IdUsuarios)
                    .HasConstraintName("FK_Reportes_Usuario");
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

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(100);
            });

            modelBuilder.Entity<Ubicacion>(entity =>
            {
                entity.ToTable("Ubicacion");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(100);
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
                    .HasMaxLength(20);

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
