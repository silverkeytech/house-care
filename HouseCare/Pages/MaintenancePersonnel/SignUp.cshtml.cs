using EdgeDB;
using HouseCare.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Identity;
using static System.Net.Mime.MediaTypeNames;


namespace HouseCare.Pages.MaintenancePersonnel
{
    [BindProperties]
    public class SignUpModel : PageModel
    {
        private readonly EdgeDBClient _edgeclient;
        public SignUpModel(EdgeDBClient client)
        {
            _edgeclient = client;
        }
        public List<City> Cities { get; set; } = new();

        public Dictionary<string, List<string>> CityAreas = new Dictionary<string, List<string>>();
        public Models.MaintenancePersonnel MaintenancePersonnel { get; set; }
        public List<string> NeighbourhoodNames { get; set; } = new();
        public List<Neighbourhood> SelectedNeighbourhoods { get; set; } = new();
        public List<Guid> NeighbourhoodIds { get; set; } = new();
        public async Task<IActionResult> OnGetAsync()
        {
            var result = await _edgeclient.QueryAsync<City>("SELECT City { Id := .id, Name := .name, Neighbourhoods := (SELECT .neighbourhoods { Id := .id, Name := .name }) }");
            Cities = result.ToList();
            return Page();
        }

        public async Task<IActionResult> OnPost()
        {
            if (string.IsNullOrEmpty(MaintenancePersonnel.FirstName) || string.IsNullOrEmpty(MaintenancePersonnel.LastName) || string.IsNullOrEmpty(MaintenancePersonnel.Phone) || string.IsNullOrEmpty(MaintenancePersonnel.Email) || string.IsNullOrEmpty(MaintenancePersonnel.Password))
            {
                ModelState.AddModelError("", "username and password fields must be entered");
                return Page();
            }
            var result = await _edgeclient.QueryAsync<Models.MaintenancePersonnel>("SELECT MaintenancePersonnel{Email := .email} FILTER .email = <str>$email", new Dictionary<string, object?> { { "email", MaintenancePersonnel.Email } });
            if(result.ToList().Count >0)
            {
                ModelState.AddModelError("", "Email already exists");
                return Page();
            }
            await AddPersonnel(MaintenancePersonnel);
            return RedirectToPage("Login");
        }

        public async Task AddPersonnel(Models.MaintenancePersonnel Personnel)
        {
            var NeighbourhoodNamesArray = NeighbourhoodNames.ToArray();
            var passwordHasher = new PasswordHasher<string>();
            MaintenancePersonnel.Password = passwordHasher.HashPassword(null, MaintenancePersonnel.Password);
            var query = "INSERT MaintenancePersonnel { first_name := <str>$first_name, last_name := <str>$last_name, email := <str>$email , phone := <str>$phone, password := <str>$password, field_of_work := <FieldOfWorkEnum>$field_of_work, image := <str>$image , areas_of_operation := (SELECT Neighbourhood FILTER .id IN array_unpack(<array<uuid>>$ids)) }";
            var res = await _edgeclient.QueryAsync<Neighbourhood>("SELECT Neighbourhood{Id := .id , Name := .name , City := Neighbourhood.city{Id := .id, Name:= .name }} FILTER .name IN array_unpack(<array<str>>$names)", new Dictionary<string, object?> { { "names", NeighbourhoodNamesArray } });
            SelectedNeighbourhoods = res.ToList();
            foreach(var item in SelectedNeighbourhoods)
            {
                NeighbourhoodIds.Add(item.Id);
            }
            var NeighbourhoodIdsArray = NeighbourhoodIds.ToArray();
            var filePath = Path.Combine("wwwroot/Assets/Images/Personnel", MaintenancePersonnel.ImageFile.FileName);
            using (var fileStream = new FileStream(filePath, FileMode.Create))
            {
                MaintenancePersonnel.ImageFile.CopyTo(fileStream);
            }
            MaintenancePersonnel.Image = MaintenancePersonnel.ImageFile.FileName;
            await _edgeclient.ExecuteAsync(query, new Dictionary<string, object?>
            {
                {"first_name", MaintenancePersonnel.FirstName},
                {"last_name", MaintenancePersonnel.LastName},
                {"email", MaintenancePersonnel.Email},
                {"phone", MaintenancePersonnel.Phone},
                {"password", MaintenancePersonnel.Password},
                {"field_of_work", MaintenancePersonnel.FieldOfWork},
                {"image", MaintenancePersonnel.Image},
                {"ids", NeighbourhoodIdsArray},
            });
        }

    }
}
