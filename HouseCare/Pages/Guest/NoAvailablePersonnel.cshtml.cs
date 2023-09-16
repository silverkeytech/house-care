using EdgeDB;
using HouseCare.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace HouseCare.Pages.Guest
{
    public class NoAvailablePersonnelModel : PageModel
    {
        private readonly EdgeDBClient _edgeclient;
        public MaintenanceRequest RecentRequest { get; set; }
        public NoAvailablePersonnelModel(EdgeDBClient client)
        {
            _edgeclient = client;
        }
        public async Task<IActionResult> OnGetAsync()
        {
            RecentRequest = await _edgeclient.QuerySingleAsync<MaintenanceRequest>("SELECT MaintenanceRequest {Id := .custom_id , RequestStatus := .request_status} Order by .custom_id DESC LIMIT 1 ");
            RecentRequest.RequestStatus = "Cancelled";
            var query = "Update MaintenanceRequest FILTER .custom_id = <uuid>$custom_id SET {request_status := <str>$request_status} ";
            await _edgeclient.ExecuteAsync(query, new Dictionary<string, object?>
            {
               {"custom_id", RecentRequest.Id},
               {"request_status", RecentRequest.RequestStatus }
            });
            return Page();
        }
    }
}
