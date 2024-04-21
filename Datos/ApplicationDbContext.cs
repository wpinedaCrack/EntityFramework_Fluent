using DatabaseFirst.Models;
using Microsoft.EntityFrameworkCore;

namespace DatabaseFirst.Datos
{
    public partial class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext()
        {
        }

        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<nota> notas { get; set; }
        public DbSet<Usuario> Usuario { get; set; }
        public DbSet<Articulo> Articulo { get; set; }
        public DbSet<Categoria> Categoria { get; set; }
        public DbSet<DetalleUsuario> DetalleUsuario { get; set; }
        public DbSet<Etiqueta> Etiqueta { get; set; }
       
        //Agregamos dbset para la tabla de realación ArticuloEtiqueta
        public DbSet<ArticuloEtiqueta> ArticuloEtiqueta { get; set; }

        //Desde vista SQL
        public DbSet<CategoriaDesdeVista> CategoriaDesdeVista { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //modelBuilder.Entity<ArticuloEtiqueta>().HasKey(ae => new { ae.Etiqueta_Id , ae.Articulo_Id });

            //Fluent API para Categoria
            modelBuilder.Entity<Categoria>().HasKey(c => c.Categoria_Id);
            modelBuilder.Entity<Categoria>().Property(c => c.Nombre).IsRequired();
            modelBuilder.Entity<Categoria>().Property(c => c.FechaCreacion).HasColumnType("date");

            //Fluent API para Articulo
            modelBuilder.Entity<Articulo>().HasKey(c => c.Articulo_Id);
            modelBuilder.Entity<Articulo>().Property(c => c.TituloArticulo).IsRequired().HasMaxLength(20);
            modelBuilder.Entity<Articulo>().Property(c => c.Descripcion).IsRequired().HasMaxLength(500);
            modelBuilder.Entity<Articulo>().Property(c => c.Fecha).HasColumnType("date");

            //Fluent API nombre de tabla y nombre columna
            modelBuilder.Entity<Articulo>().ToTable("Tbl_Articulo");
            modelBuilder.Entity<Articulo>().Property(c => c.TituloArticulo).HasColumnName("Titulo");

            //Fluent API para Usuario
            modelBuilder.Entity<Usuario>().HasKey(c => c.Id);
            modelBuilder.Entity<Usuario>().Ignore(u => u.Edad);  //Esta columna no la Mapea en la BD

            //Fluent API para DetalleUsuario
            modelBuilder.Entity<DetalleUsuario>().HasKey(c => c.DetalleUsuario_Id);
            modelBuilder.Entity<DetalleUsuario>().Property(c => c.Cedula).IsRequired();

            //Fluent API para Etiqueta
            modelBuilder.Entity<Etiqueta>().HasKey(c => c.Etiqueta_Id);
            modelBuilder.Entity<Etiqueta>().Property(c => c.Fecha).HasColumnType("date");

            //Fluent API: relación de uno a uno entre Usuario y DetalleUsuario
            modelBuilder.Entity<Usuario>()
                .HasOne(c => c.DetalleUsuario)
                .WithOne(c => c.Usuario).HasForeignKey<Usuario>("DetalleUsuario_Id");

            //Fluent API: relación de uno a muchos entre Categoria y Articulo
            modelBuilder.Entity<Articulo>()
                .HasOne(c => c.Categoria)
                .WithMany(c => c.Articulo).HasForeignKey(c => c.Categoria_Id);

            //Fluent API: relación de muchos a muchos entre Articulo y Etiqueta
            modelBuilder.Entity<ArticuloEtiqueta>().HasKey(ae => new { ae.Etiqueta_Id, ae.Articulo_Id });
            modelBuilder.Entity<ArticuloEtiqueta>()
                .HasOne(a => a.Articulo)
                .WithMany(a => a.ArticuloEtiqueta).HasForeignKey(c => c.Articulo_Id);
            modelBuilder.Entity<ArticuloEtiqueta>()
                .HasOne(a => a.Etiqueta)
                .WithMany(a => a.ArticuloEtiqueta).HasForeignKey(c => c.Etiqueta_Id);

            //Carga desde una vista SQL sin llave primaria
            modelBuilder.Entity<CategoriaDesdeVista>().HasNoKey().ToView("ObtenerCategorias");

            base.OnModelCreating(modelBuilder);
        }
    }
}
