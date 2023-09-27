using EdgeDB;
using HouseCare.Models;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Security.Claims;
using static System.Net.Mime.MediaTypeNames;

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

            Personnel = await _edgeclient.QuerySingleAsync<Models.MaintenancePersonnel>("SELECT MaintenancePersonnel {FirstName := .first_name , LastName := .last_name , Image := .image , Phone := .phone , Email := .email} FILTER .email = <str>$email", new Dictionary<string, object?> { { "email", email } });
            if (Personnel == null)
            {
                return NotFound();
            }

            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (string.IsNullOrEmpty(Personnel.Phone) || string.IsNullOrEmpty(Personnel.Email) || string.IsNullOrEmpty(Personnel.FirstName) || string.IsNullOrEmpty(Personnel.LastName))
            {
                ModelState.AddModelError("ContactError", "All fields must be filled");
                return Page();
            }
            string email = User.FindFirst(ClaimTypes.Email)?.Value;
            if (Personnel.ImageFile != null)
            {
                var filePath = Path.Combine("wwwroot/Assets/Images/Personnel", Personnel.ImageFile.FileName);
                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    Personnel.ImageFile.CopyTo(fileStream);
                }
                Personnel.Image = Personnel.ImageFile.FileName;
                var query = "Update MaintenancePersonnel FILTER .email = <str>$email SET {first_name := <str>$FirstName,  last_name := <str>$LastName, phone := <str>$PhoneNumber, email := <str>$Email ,  image := <str>$image } ";
                await _edgeclient.ExecuteAsync(query, new Dictionary<string, object?>
                {
                   {"email",email},
                   {"FirstName", Personnel.FirstName},
                   {"LastName", Personnel.LastName},
                   {"PhoneNumber", Personnel.Phone},
                   {"Email", Personnel.Email},
                   {"image", Personnel.Image},


                });
            }
            else
            {
                var query = "Update MaintenancePersonnel FILTER .email = <str>$email SET {first_name := <str>$FirstName,  last_name := <str>$LastName, phone := <str>$PhoneNumber, email := <str>$Email } ";
                await _edgeclient.ExecuteAsync(query, new Dictionary<string, object?>
                {
                   {"email",email},
                   {"FirstName", Personnel.FirstName},
                   {"LastName", Personnel.LastName},
                   {"PhoneNumber", Personnel.Phone},
                   {"Email", Personnel.Email},

                });

            }
            if (email != Personnel.Email)
            {
                await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
                return RedirectToPage("Login");
            }
            // Redirect back to the profile page after updating
            return RedirectToPage("Profile");
        }

    }
}
