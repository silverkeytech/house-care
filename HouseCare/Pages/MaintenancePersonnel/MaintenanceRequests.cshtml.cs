using Microsoft.AspNetCore.Mvc.RazorPages;
using EdgeDB;
using HouseCare.Models; 

namespace HouseCare.Pages.MaintenancePersonnel
{
    public class MaintenanceRequestsModel : PageModel
    {

        private readonly EdgeDBClient _edgeDbClient;
        public List<MaintenanceRequest> Requests { get; set; }


        public MaintenanceRequestsModel(EdgeDBClient edgeDBClient)
        {
            _edgeDbClient = edgeDBClient;
        }

        public async Task OnGetAsync()
        {
            Requests = await GetRequestsAsync();
        }

        private async Task<List<MaintenanceRequest>> GetRequestsAsync()
        {
            var result = await _edgeDbClient.QueryAsync<MaintenanceRequest>("SELECT MaintenanceRequest { requester_name, city, assigned_date, request_category }");
            return result.ToList();
        }
    }
}
