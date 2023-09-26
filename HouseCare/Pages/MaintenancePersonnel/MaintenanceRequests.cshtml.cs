using Microsoft.AspNetCore.Mvc.RazorPages;
using HouseCare.Models;
using EdgeDB;

namespace HouseCare.Pages.MaintenancePersonnel
{
    public class MaintenanceRequestsModel : PageModel
    {

        private readonly EdgeDBClient _edgeDbClient;
        public List<MaintenanceRequest> Requests { get; set; }

        public MaintenanceRequestsModel(EdgeDBClient edgeDbClient)
        {
            _edgeDbClient = edgeDbClient;
        }

        public async Task OnGetAsync()
        {
            Requests = await GetRequestsAsync();
        }

        private async Task<List<MaintenanceRequest>> GetRequestsAsync()
        {
            var result = await _edgeDbClient.QueryAsync<MaintenanceRequest>("SELECT MaintenanceRequest {RequesterName := .requester_name,  AssignedDate := .assigned_date, RequestCategory := .request_category, RequestStatus := .request_status }");
            return result.ToList();
        }
    }
}
