using Microsoft.Azure.Search;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using AzureSearch.Models;
using Microsoft.Azure.Search.Models;
using System.Threading.Tasks;

namespace AzureSearch.Services
{
    public class SearchService
    {
        private static ISearchIndexClient _searchIndexClient;
        static SearchService()
        {
            var searchServiceName = "vatansearch";
            var indexName = "azuresql-index";
            var searchApiKey = ConfigurationManager.AppSettings["Search:ServiveKey"].ToString();
            _searchIndexClient = new SearchIndexClient(searchServiceName, indexName, new SearchCredentials(searchApiKey));
        }
        public async Task<List<ProductIndex>> SearchAsync(string searchTerm)
        {
            //var parameters = new SearchParameters
            //{
            //    Filter = $"CategoryID eq '{categoryID.ToString().ToLower()}'", OrderBy = new[] { "ProductName desc" }
            //};
            var searchResult = await _searchIndexClient.Documents.SearchAsync<ProductIndex>(searchTerm.ToLower());
            return new List<ProductIndex>(searchResult.Results.Select(s => s.Document));
        }
    }
}