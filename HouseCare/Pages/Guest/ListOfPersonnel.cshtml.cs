using EdgeDB;
using HouseCare.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Text.Json;

namespace HouseCare.Pages.Guest
{
    [BindProperties]
    public class ListOfPersonnelModel : PageModel
    {
        private readonly EdgeDBClient _edgeclient;
        public MaintenanceRequest RecentRequest { get; set; }
        public List<Models.MaintenancePersonnel> ListOfPersonnel { get; set; } = new();
        public List<Models.MaintenancePersonnel> AvailablePersonnel { get; set; } = new();
        public ListOfPersonnelModel(EdgeDBClient client)
        {
            _edgeclient = client;
        }
        public async Task<IActionResult> OnGetAsync()
        {
            RecentRequest = await _edgeclient.QuerySingleAsync<MaintenanceRequest>("SELECT MaintenanceRequest {RequestCategory := .request_category , City := .city , Neighbourhood := .neighbourhood} Order by .custom_id DESC LIMIT 1 ");
            var result = await _edgeclient.QueryAsync<Models.MaintenancePersonnel>("SELECT MaintenancePersonnel {Id := .id , FirstName := .first_name , LastName := .last_name , Email := .email , Phone := .phone , Street := .street , Neighbourhood := .neighbourhood , City := .city , FieldOfWork := .field_of_work , Image := .image}");
            ListOfPersonnel = result.ToList();
            foreach (var personnel in ListOfPersonnel)
            {
                if(personnel.FieldOfWork == RecentRequest.RequestCategory  && personnel.City == RecentRequest.City && personnel.Neighbourhood == RecentRequest.Neighbourhood)
                {
                    AvailablePersonnel.Add(personnel);
                }
            }
            if(AvailablePersonnel.Count==0)
            {
                return RedirectToPage("NoAvailablePersonnel");
            }
            return Page();
        }

        
    }
}
