﻿using DatabaseFirst.Models;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace DatabaseFirst.ViewModels
{
    public class ArticuloEtiquetaVM
    {
        public ArticuloEtiqueta ArticuloEtiqueta { get; set; }
        public Articulo Articulo { get; set; }
        public IEnumerable<ArticuloEtiqueta> ListaArticuloEtiquetas { get; set; }
        public IEnumerable<SelectListItem> ListaEtiquetas { get; set; }
    }
}
