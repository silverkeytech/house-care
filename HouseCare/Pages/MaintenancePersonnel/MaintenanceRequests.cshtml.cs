using Microsoft.AspNetCore.Mvc.RazorPages;
using EdgeDB;
using HouseCare.Models; 

namespace HouseCare.Pages.MaintenancePersonnel
{
    public class MaintenanceRequestsModel : PageModel
    {

        private readonly EdgeDBClient _edgeDbClient;
        public List<MaintenanceRequest> Requests { get; set; }

        public MaintenanceRequestsModel(EdgeDBClient edgeDbClient)
        {
<<<<<<< Updated upstream
            private readonly EdgeDBClient _client;
            public List<MaintenanceRequest> Requests { get; set; }

            public MaintenanceRequestsModel(EdgeDBClient edgeDBClient)
            {
                _client = edgeDBClient;
            }

            public async Task OnGetAsync()
            {
                // Fetch all data from EdgeDB and populate the Requests property
                // Example query without filtering:
                var query = "SELECT MaintenanceRequest { requester_name, city, assigned_date, request_category }";
                var requests = await _client.QueryAsync<MaintenanceRequest>(query);
                Requests = requests.ToList();
            }
=======
            _edgeDbClient = edgeDbClient;
>>>>>>> Stashed changes
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
