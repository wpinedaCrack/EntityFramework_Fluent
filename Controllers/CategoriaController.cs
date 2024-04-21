using DatabaseFirst.Datos;
using DatabaseFirst.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;

namespace DatabaseFirst.Controllers
{
    public class CategoriaController : Controller
    {
        public readonly ApplicationDbContext _context;

        public CategoriaController(ApplicationDbContext contexto)
        {
             _context = contexto;
        }
        [HttpGet]
        public IActionResult Index()
        {
            //Consulta filtrando por fecha
            //DateTime fechaComparacion = new DateTime(2021, 11, 05);
            //List<Categoria> listaCategorias = _context.Categoria.Where(f => f.FechaCreacion >= fechaComparacion).OrderByDescending(f => f.FechaCreacion).ToList();
            //return View(listaCategorias);

            //Seleccionar columnas espefificas
            //var categorias = _context.Categoria.Where(n => n.Nombre == "Test 5").Select(n => n).ToList();
            //List<Categoria> listaCategorias = _context.Categoria.ToList();            

            ////Consultas sql convencioinales
            //var listaCategorias = _context.Categoria.FromSqlRaw("select * from categoria where nombre like 'categoría%' and Activo = 1").ToList();

            //Consultas sql convencioinales
            //var listaCategorias = _context.Categoria.FromSqlRaw("select * from categoria where nombre like 'categoría%' and Activo = 1").ToList();



            //Agrupar
            //var listaCategoriasAgrupadas = _context.Categoria
            //.GroupBy(c => new { c.Activo })
            //.Select(c => new { c.Key, Count = c.Count() }).ToList();

            //foreach(var item in listaCategoriasAgrupadas)
            //{
            //    Console.WriteLine("key "+item.Key+" Cantidad "+item.Count );
            //}


            //take y skip Paginar
            //List<Categoria> listaCategorias = _context.Categoria.Skip(3).Take(5).ToList();

            //Interpolacion de string (string interpolation)
            //var id = 4;
            //var categoria = _context.Categoria.FromSqlRaw($"select * from categoria where categoria_id = {id}").ToList();
            //List<Categoria> listaCategorias = _context.Categoria.ToList();

            List<Categoria> listaCategorias = _context.Categoria.ToList();

            return View(listaCategorias);
        }

        [HttpGet]
        public IActionResult Crear()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Crear(Categoria categoria)
        {
            if (ModelState.IsValid)
            {
                _context.Categoria.Add(categoria);
                _context.SaveChanges();
                return RedirectToAction(nameof(Index));
            }
            return View();
        }

        [HttpGet]
        public IActionResult CrearMultipleOpcion2()
        {
            List<Categoria> categorias = new List<Categoria>();
            for (int i = 0; i < 2; i++)
            {
                categorias.Add(new Categoria { Nombre = Guid.NewGuid().ToString() });
                //_context.Categoria.Add(new Categoria { Nombre = Guid.NewGuid().ToString() });
            }
            _context.Categoria.AddRange(categorias);
            _context.SaveChanges();
            return RedirectToAction(nameof(Index));
        }
        [HttpGet]
        public IActionResult CrearMultipleOpcion5()
        {
            List<Categoria> categorias = new List<Categoria>();
            for (int i = 0; i < 5; i++)
            {
                categorias.Add(new Categoria { Nombre = Guid.NewGuid().ToString() });
            }
            _context.Categoria.AddRange(categorias);
            _context.SaveChanges();
            return RedirectToAction(nameof(Index));
        }

        [HttpGet]
        public IActionResult VistaCrearMultipleOpcionFormulario()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult CrearMultipleOpcionFormulario()
        {
            string categoriasForm = Request.Form["Nombre"];
            var listaCategorias = from val in categoriasForm.Split(new[] { "," }, StringSplitOptions.RemoveEmptyEntries) select (val);

            List<Categoria> categorias = new List<Categoria>();

            foreach (var categoria in listaCategorias)
            {
                categorias.Add(new Categoria
                {
                    Nombre = categoria
                });
            }
            _context.Categoria.AddRange(categorias);
            _context.SaveChanges();
            return RedirectToAction(nameof(Index));
        }

        [HttpGet]
        public IActionResult Editar(int? id)
        {
            if (id == null)
            {
                return View();
            }

            var categoria = _context.Categoria.FirstOrDefault(c => c.Categoria_Id == id);
            return View(categoria);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Editar(Categoria categoria)
        {
            if (ModelState.IsValid)
            {
                categoria.FechaCreacion=DateTime.Now;
                _context.Categoria.Update(categoria);
                _context.SaveChanges();
                return RedirectToAction(nameof(Index));
            }
            return View(categoria);
        }
        [HttpGet]
        public IActionResult Borrar(int? id)
        {
            var categoria = _context.Categoria.FirstOrDefault(c => c.Categoria_Id == id);
            _context.Categoria.Remove(categoria);
            _context.SaveChanges();
            return RedirectToAction(nameof(Index));
        }

        [HttpGet]
        public IActionResult BorrarMultiple2()
        {
            IEnumerable<Categoria> categorias = _context.Categoria.OrderByDescending(c => c.Categoria_Id).Take(2);
            _context.Categoria.RemoveRange(categorias);
            _context.SaveChanges();
            return RedirectToAction(nameof(Index));
        }

        [HttpGet]
        public IActionResult BorrarMultiple5()
        {
            IEnumerable<Categoria> categorias = _context.Categoria.OrderByDescending(c => c.Categoria_Id).Take(5);
            _context.Categoria.RemoveRange(categorias);
            _context.SaveChanges();
            return RedirectToAction(nameof(Index));
        }

        [HttpGet]
        public void EjecucionDiferida()
        {
            //1-Cuando se hace una iteración sobre ellos Ejemplo:
            var categorias = _context.Categoria;

            foreach (var categoria in categorias)
            {
                var nombreCat = "";
                nombreCat = categoria.Nombre;
            }

            //2-Cuando se llama a cualquiera de los métodos: ToDictionary, ToList, ToArray
            var categorias2 = _context.Categoria.ToList();

            foreach (var categoria in categorias)
            {
                var nombreCat = "";
                nombreCat = categoria.Nombre;
            }

            //3-Cuando se llama cualquier método que retorna un solo objeto:
            //First, Single, Count, Max, entre otros
            var categorias3 = _context.Categoria;
            var totalCategorias = categorias3.Count();

            var totalCategorias2 = _context.Categoria.Count();

            var test = "";

        }
        public void TestIEnumerable()
        {
            //1- Código con IEnumerable
            IEnumerable<Categoria> listaCategorias = _context.Categoria;
            var categoriasActivas = listaCategorias.Where(a => a.Activo == true).ToList();
            //2- Consulta resultante
            /*
            SELECT [c].[Categoria_Id], [c].[Activo], [c].[FechaCreacion], [c].[Nombre]
            FROM[Categoria] AS[c]
            */
            //3-El filtro del where se aplica en memoria del lado del cliente

        }

        public void TestIQueryable()
        {
            //1- Código con IQueryable
            //IQueryable hereda de IEnumerable
            //Todo lo que se puede hacer con IEnumerable se puede hacer con IQueryable
            IQueryable<Categoria> listaCategorias = _context.Categoria;
            var categoriasActivas = listaCategorias.Where(a => a.Activo == true).ToList();
            //-Consulta resultante
            /*
            SELECT [c].[Categoria_Id], [c].[Activo], [c].[FechaCreacion], [c].[Nombre]
            FROM[Categoria] AS[c]
            WHERE[c].[Activo] = CAST(1 AS bit)
            */
        }

        public void TestUpdate()
        {
            //Código
            var datoUsuario = _context.Usuario.Include(d => d.DetalleUsuario).FirstOrDefault(d => d.Id == 2);
            datoUsuario.DetalleUsuario.Deporte = "Natación";
            _context.Update(datoUsuario);
            _context.SaveChanges();

        }

        public void TestAttach()
        {
            //Código
            var datoUsuario = _context.Usuario.Include(d => d.DetalleUsuario).FirstOrDefault(d => d.Id == 2);
            datoUsuario.DetalleUsuario.Deporte = "Ciclismo";
            _context.Attach(datoUsuario);
            _context.SaveChanges();
        }
        //Crear el método para llamar a la vista sql
        public void ObtenerCategoriasDesdeVistaSql()
        {
            var usarVista1 = _context.CategoriaDesdeVista.ToList();
            var usarVista2 = _context.CategoriaDesdeVista.FirstOrDefault();
            var usarVista3 = _context.CategoriaDesdeVista.Where(c => c.Activo == true);
        }

        public void CosultasFromSql()
        {
            //Consulta directa es menos segura
            var usuario = _context.Usuario.FromSqlRaw("select * from dbo.Usuario").ToList();

            //Consulta con parámetros para evitar inyección sql
            var idUsuario = 2;
            var usuario2 = _context.Usuario.FromSqlInterpolated($"select * from dbo.Usuario where Id = {idUsuario}").ToList();

            var usuarioPorProcemiento = _context.Usuario.FromSqlInterpolated($" EXEC dbo.SpObtenerUsuarioId {idUsuario}").ToList();

            //Solo de .NET 5 en adelante
            var etiquetasEnArticulo = _context.Articulo.Include(e => e.ArticuloEtiqueta.Where(a => a.Etiqueta_Id == 1)).ToList();
        }
    }
}
