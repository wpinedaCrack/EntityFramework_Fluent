using DatabaseFirst.Models;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace DatabaseFirst.ViewModels
{
    public class ArticuloCategoriaVM
    {
        public Articulo Articulo { get; set; }
        public IEnumerable<SelectListItem> ListaCategorias { get; set; }
    }
}
