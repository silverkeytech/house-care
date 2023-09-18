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
        private readonly EdgeDBClient _edgeDbClient;

        public MaintenanceRequest Request { get; set; }

        public MaintenanceRequestDetailsModel(EdgeDBClient edgeDbClient)
        {
            _edgeDbClient = edgeDbClient;
        }

        public async Task<IActionResult> OnGetAsync(Guid id)
        {
                var result = await _edgeDbClient.QueryAsync<MaintenanceRequest>(
                    "SELECT MaintenanceRequest {RequesterName := .requester_name, City := .city, AssignedDate := .assigned_date, RequestCategory := .request_category, RequestStatus := .request_status } FILTER .Id = <uuid>$id",
                    new { id }
                );

                // Get the first element from the result (assuming there's only one)
                Request = result.FirstOrDefault();

                if (Request == null)
                {
                    return NotFound(); // Return "Not Found" if no result is found
                }

            return Page();
        }
    }
}
