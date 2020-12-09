## Install MSSQL - MAC (docker)

* `docker pull microsoft/mssql-server-linux`
* `docker run -d --name MySQLServer -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=1234@jkl#' -p 1433:1433 microsoft/mssql-server-linux`
    * Name can be any custom name of your choice
    * Password can be of your choice provided it is the combination of uppercase, lowercase, numbers and special characters
* Download azure data studio from https://docs.microsoft.com/en-us/sql/azure-data-studio/download?view=sql-server-2017
* Open azure data studio and provide connection parameters:
    * host: localhost
    * authentication type: SQL Login
    * user: sa
    * password: 1234@jkl#
    * Database : Default
    * Server Group: Default

## crear solución

* mkdir NETCORE
* dotnet new sln
* mkdir LeerData
* cd LeerData
* dotnet new console

## Intalar Nugets

* Microsoft.EntityFrameworkCore
* Microsoft.EntityFrameworkCore.SqlServer

## Compilar solución 

`dotnet run --project LeerData`

## N O T E S

* **DbSet<Entidad>** combierte las clases en entidades, para que este DbSet funciones debe estar en un tipo contexto de entityFramework `AppVentaCursosContext.cs`, esta clase va ser la encargada de tener la conexión con MSSQL, `AppVentaCursosContext.cs` es una instancia ó representacion a la base de datos que estamos trabajado.
* **DbContex:** es una parte integral del EntityFramework, una instacia del DBContext representa una seción con la base de datos a la cual se desea conectar consumir y agregar recursos, en otras palabras, un DBContext corresponde a la representación de la base de datos, por lo tanto tiene acceso a las tablas, vistas, etc
* **LINQ:** nos permite realizar consultas a diferentes bases de datos en sí. Link es un componente del punto net Framework que provee una estructura en tiempos de acción para administrar va a ser base de datos relacionales como si fueran objetos dentro de C#.
````c#
var curso = db.Curso.Where(p => p.Titulo.StartWith("ASP")).First();
````
##### Mecanismos de consulta de BD

* **Eager Loading** carga data de todas las entidades relacionadas entre si, un ejemplo es el que se muestra a continuación, se trae la información de tres tablas
````c#
  var cursos   = db.Curso
                    .Include(p=>p.InstructorLink)
                    .ThenInclude(ci=>ci.Instructor);

````
* **Select ó Lazy Loading** cuando se especifica que tipo de columnas se desea obtener de  tu query
````c#
    var cursos   = db.Curso(
        c => new {
            c.Titulo,
            c.Descripcion
        }
    )
````
* **Explicit Loading:** retorna las consultas en un query y dependiendo de la lógica que continue va ir cargando más y más data

 