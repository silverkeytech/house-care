using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace HouseCare.Pages.Guest
{
    public class MaintenanceRequestModel : PageModel
    {

        public string Type { get; private set; }
        public async Task<IActionResult> OnGetAsync()
        {
            Type = Request.Query["type"];
            return Page();
        }
        public async Task<IActionResult> OnPostAsync()
        {

            return RedirectToPage("/ListOfPersonnel");
        }

    }
}


