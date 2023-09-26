using Microsoft.AspNetCore.Mvc.RazorPages;
using HouseCare.Models;
using EdgeDB;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace HouseCare.Pages.MaintenancePersonnel
{
    public class MaintenanceRequestsModel : PageModel
    {

        private readonly EdgeDBClient _edgeDbClient;
        public List<MaintenanceRequest> Requests { get; set; } = new();
        public List<MaintenanceRequest> SelectedRequests { get; set; } = new();

        public MaintenanceRequestsModel(EdgeDBClient edgeDbClient)
        {
            _edgeDbClient = edgeDbClient;
        }

       
        public async Task<IActionResult> OnGetAsync()
        {
            string email = User.FindFirst(ClaimTypes.Email)?.Value;
            var results = await _edgeDbClient.QueryAsync<MaintenanceRequest>("SELECT MaintenanceRequest {Id:= .id , RequestCategory := .request_category,RequestStatus := .request_status,RequestDate := .request_date, Description := .description,RequesterName := .requester_name,RequesterEmail := .requester_email, RequesterPhone :=.requester_phone, Street := .street, ImageString := .image , Neighbourhood := MaintenanceRequest.neighbourhood{Name := .name},AssignedTo := MaintenanceRequest.assigned_to{FirstName := .first_name , LastName := .last_name , Email := .email}} ");
            Requests = results.ToList();
            if(Requests.Count>0)
            {
                foreach (var request in Requests)
                {
                    
                    if (request.AssignedTo.Email == email && request.RequestStatus == "Scheduled")
                    {
                        SelectedRequests.Add(request);
                    }
                }
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            string id = Request.Form["id"];
            HttpContext.Session.SetString("ID", id);
            return RedirectToPage("MaintenanceRequestDetails");
        }
    }
}
