using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using HouseCare.Models;
using EdgeDB;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace HouseCare.Pages.MaintenancePersonnel
{
    public class MaintenanceRequestDetailsModel : PageModel
    {
        [BindProperty]
        public string Id { get; set; }

        private readonly EdgeDBClient _edgeDbClient;

        public MaintenanceRequest Request { get; set; }

        public MaintenanceRequestDetailsModel(EdgeDBClient edgeDbClient)
        {
            _edgeDbClient = edgeDbClient;
        }

        public async Task<IActionResult> OnGetAsync()
        {
            string id = HttpContext.Session.GetString("ID");
            Guid newId = new Guid(id);
            Request = await _edgeDbClient.QuerySingleAsync<MaintenanceRequest>("SELECT MaintenanceRequest {RequestCategory := .request_category,RequestStatus := .request_status,RequestDate := .request_date, Description := .description,RequesterName := .requester_name,RequesterEmail := .requester_email, RequesterPhone :=.requester_phone, Street := .street, ImageString := .image , Neighbourhood := MaintenanceRequest.neighbourhood{Name := .name}} FILTER .id = <uuid>$id", new Dictionary<string, object?> { { "id", newId} });
            return Page();
        }

    }
}
