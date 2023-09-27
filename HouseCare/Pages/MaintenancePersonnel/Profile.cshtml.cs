using EdgeDB;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Security.Claims;

namespace HouseCare.Pages.MaintenancePersonnel
{
    [BindProperties]
    public class ProfileModel : PageModel
    {
        private readonly EdgeDBClient _edgeclient;
        public Models.MaintenancePersonnel Personnel { get; set; }

        public ProfileModel(EdgeDBClient client)
        {
            _edgeclient = client;
        }

        public async Task<IActionResult> OnGetAsync()
        {
            string email = User.FindFirst(ClaimTypes.Email)?.Value;

            var personnelCollection = await _edgeclient.QueryAsync<Models.MaintenancePersonnel>(
                @"
                SELECT MaintenancePersonnel {
                    FirstName := .first_name,
                    LastName := .last_name,
                    Email := .email,
                    Phone := .phone,
                    Image := .image,
                    Id := .id
                }
                FILTER .email = <str>$email", new { email });

            Personnel = personnelCollection.FirstOrDefault();

            if (Personnel == null)
            {
                return NotFound();
            }

            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            string email = User.FindFirst(ClaimTypes.Email)?.Value;

            var updateQuery = @"
            UPDATE MaintenancePersonnel
                FILTER .email = <str>$email
                SET {first_name := <str>$FirstName,
                last_name := <str>$LastName,
                phone := <str>$PhoneNumber,
                email := <str>$email
            }";

            await _edgeclient.ExecuteAsync(updateQuery, new Dictionary<string, object?>
            {
               {"FirstName", Request.Form["FirstName"]},
               {"LastName", Request.Form["LastName"]},
               {"PhoneNumber", Request.Form["PhoneNumber"]},
               {"email", email}
            });
            
            // Redirect back to the profile page after updating
            return RedirectToPage("/Profile");
        }

    }
}
