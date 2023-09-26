using EdgeDB;
using HouseCare.Models;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Security.Claims;

namespace HouseCare.Pages.MaintenancePersonnel
{
    [BindProperties]
    public class LoginModel : PageModel
    {
        private readonly EdgeDBClient _edgeclient;
        public LoginModel(EdgeDBClient client)
        {
            _edgeclient = client;
        }
        public LoginInput LoginInput { get; set; }
        public Models.MaintenancePersonnel MaintenancePersonnel { get; set; }
        public async Task<IActionResult> OnPost()
        {
            string email = LoginInput.Email;
            string password = LoginInput.Password;
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                ModelState.AddModelError("", "username and password fields must be entered");
                return Page();
            }
           
            MaintenancePersonnel = await _edgeclient.QuerySingleAsync<Models.MaintenancePersonnel>("SELECT MaintenancePersonnel{Email := .email , Password := .password , FirstName := .first_name , LastName := .last_name} FILTER .email = <str>$email", new Dictionary<string, object?> { { "email", email } });
            if (MaintenancePersonnel!=null)
            {
                var passwordHasher = new PasswordHasher<string>();
                var passwordVerificationResult = passwordHasher.VerifyHashedPassword(null, MaintenancePersonnel.Password, password);
                if (passwordVerificationResult == PasswordVerificationResult.Success)
                {
                    var fullName = MaintenancePersonnel.FirstName + " " + MaintenancePersonnel.LastName;
                    var claims = new List<Claim>
                    {
                       new Claim(ClaimTypes.Email,MaintenancePersonnel.Email),
                       new Claim(ClaimTypes.Role,"Personnel"),
                       new Claim(ClaimTypes.Name , fullName ),

                    };
                    var scheme = CookieAuthenticationDefaults.AuthenticationScheme;
                    var claimsIdentity = new ClaimsIdentity(
                    claims, CookieAuthenticationDefaults.AuthenticationScheme);
                    var authProperties = new AuthenticationProperties
                    {
                        AllowRefresh = true,
                        IsPersistent = false,


                    };
                    var user = new ClaimsPrincipal(claimsIdentity);
                    await HttpContext.SignInAsync(scheme, user, authProperties);
                    return RedirectToPage("MaintenanceRequests");
                }
                else
                {
                    ModelState.AddModelError("", "Invalid password");
                    return Page();
                }
            }
            else
            {
                ModelState.AddModelError("", "Unsuccessful login attempt ");
                return Page();

            }
            
        }
    }
}
