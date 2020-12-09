using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.SqlServer;
namespace LeerData
{
    public class AppVentaCursosContext: DbContext
    {
        private const string connectionString = @"
                                                  Server=127.0.0.1,1433;
                                                  Database=CursosOnline;
                                                  User Id=sa;
                                                  Password=1234@jkl#
                                               ";
         protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder){
             optionsBuilder.UseSqlServer(connectionString);
         }
         
         /*
          * Se indica a Entity Framework que se tiene mas de una clave primaria (clave primaria compuesta )
          */
         protected override void OnModelCreating(ModelBuilder modelBuilder)
         {
             modelBuilder.Entity<CursoInstructor>().HasKey(ci => new {ci.CursoId, ci.InstructorId});
         }

         public DbSet<Curso> Curso{get;set;} 
         public DbSet<Precio> Precio{get;set;} 
         public DbSet<Comentario> Comentario{get;set;} 
         public DbSet<Instructor> Instructor { get; set; }
         public DbSet<CursoInstructor> CursoInstructor { get; set; }
    }
}