using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace HouseCare.Pages.MaintenancePersonnel
{
    public class ProfileModel : PageModel
    {
        // Define properties for the profile information
        [BindProperty]
        public string ProfileImage { get; set; }

        [BindProperty]
        public string Username { get; set; }

        [BindProperty]
        public string Address { get; set; }

        [BindProperty]
        public string Email { get; set; }

        [BindProperty]
        public string PhoneNumber { get; set; }

        [BindProperty]
        public string Location { get; set; }

        public void OnGet()
        {
            // Load the profile information from the database and populate the properties
            // Example code: You need to replace this with actual database retrieval logic
            ProfileImage = "path_to_profile_image.jpg";
            Username = "JohnDoe";
            Address = "123 Main Street";
            Email = "johndoe@example.com";
            PhoneNumber = "123-456-7890";
            Location = "City, State";
        }

        public IActionResult OnPost()
        {
            // Handle the form submission here
            // Update the profile information in the database
            // Redirect to the profile page or display a success message
            // Example code: You need to replace this with your actual update logic

            // After successfully updating the profile, you can redirect to the profile page
            return RedirectToPage("/profile");
        }
    }
}
