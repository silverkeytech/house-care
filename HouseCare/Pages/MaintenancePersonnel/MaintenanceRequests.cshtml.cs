using EdgeDB;
using HouseCare.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;


namespace HouseCare.Pages.MaintenancePersonnel{

        [BindProperties]
        public class MaintenanceRequestsModel : PageModel
        {
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
        }
}
