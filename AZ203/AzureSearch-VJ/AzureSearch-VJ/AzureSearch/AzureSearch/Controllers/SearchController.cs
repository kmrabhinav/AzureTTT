using AzureSearch.Models;
using AzureSearch.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace AzureSearch.Controllers
{
    public class SearchController : Controller
    {
        public async Task<ActionResult> Index(string search)
        {
            var products = new List<ProductIndex>();
            if (Request.QueryString["search"] != null)
            {
                var searchService = new SearchService();
                products = await searchService.SearchAsync(search);
            }
            return View(products);
        }
    }
}