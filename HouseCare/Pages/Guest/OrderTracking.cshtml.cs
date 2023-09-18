using EdgeDB;
using HouseCare.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace HouseCare.Pages.Guest
{
    [BindProperties]
    public class OrderTrackingModel : PageModel
    {
        private readonly EdgeDBClient _edgeclient;
        public MaintenanceRequest RecentRequest { get; set; }

        public OrderTrackingModel(EdgeDBClient client)
        {
            _edgeclient = client;
        }
        public async Task<IActionResult> OnGetAsync()
        {
            RecentRequest = await _edgeclient.QuerySingleAsync<MaintenanceRequest>("SELECT MaintenanceRequest {RequestCategory := .request_category , RequestStatus := .request_status , RequestDate := .request_date , AssignedDate := .assigned_date, Description := .description, AssignedTo := MaintenanceRequest.assigned_to{FirstName := .first_name , LastName := .last_name , Phone := .phone}} Order by .custom_id DESC LIMIT 1 ");
            return Page();
        }

    }
}
