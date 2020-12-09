using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.SqlServer;

namespace LeerData {
    
    class Program {
        
        static void Main(string[] args) {
            // crea instancia
            using (var db = new AppVentaCursosContext()){
                // AsNoTracking : no gurda la data en cache o memoria del entityFramework
                // AsNoTracking : llama a la libreria LINQ para convertir mi sentencia C# a una consulta sql, posteriormente
               // sqlServer retorna toda la data a travez de un arreglo de tipo IQueryable
               /**
                * curso
                */
               /*var cursos = db.Curso.AsNoTracking();  //arreglo IQueryable
                foreach (var curso in cursos){
                    Console.WriteLine(curso.Titulo +" - "+curso.Descripcion);
                }*/
                /**
                 * Precio
                 */
                /*var cursos = db.Curso.Include(p=>p.PrecioPromocion).AsNoTracking();
                foreach (var curso in cursos){
                    Console.WriteLine(curso.Titulo +" - "+curso.PrecioPromocion.PrecioActual);
                }*/
                /*
                 * Comentario
                 * AsNoTracking: evitar mantener en cache la data que traiga
                 */
                /*var cursos   = db.Curso.Include(p=>p.ComentarioLista).AsNoTracking();
                foreach (var curso in cursos){
                    Console.WriteLine(":::::::::::"+curso.Titulo);
                    foreach (var comentario in curso.ComentarioLista){
                        Console.WriteLine(comentario.Alumno+" : "+comentario.Comentariotexto+" : "+comentario.Puntaje);
                    }
                    
                }*/
                
                /*
                 * Curso - Instructor
                 */
                
                var cursos   = db.Curso
                    .Include(p=>p.InstructorLink)
                    .ThenInclude(ci=>ci.Instructor);
                foreach (var curso in cursos){
                    Console.WriteLine(":::::::::::"+curso.Titulo);
                    foreach (var insLink in curso.InstructorLink){
                        Console.WriteLine("__________________"+insLink.Instructor.Nombre);
                    }
                }
            }
        }
    }
}
