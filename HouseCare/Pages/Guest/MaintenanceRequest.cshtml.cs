using EdgeDB;
using HouseCare.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace HouseCare.Pages.Guest
{
    [BindProperties]
    public class MaintenanceRequestModel : PageModel
    {
        private readonly EdgeDBClient _edgeclient;
        public MaintenanceRequestModel(EdgeDBClient client)
        {
            _edgeclient = client;
        }
        public string Type { get; set; }
        public string NeighbourhoodName { get; set; }

        private static int RequestNumber  = 0;
        public List<MaintenanceRequest> ListOfRequests { get; set; } = new();

        public List<int> RequestIds { get; set; } = new();

        public MaintenanceRequest MaintenanceRequest { get; set; }
        public List<City> Cities { get; set; } = new();
        public Neighbourhood SelectedNeighbourhood { get; set; } 

        public Dictionary<string, List<string>> CityAreas = new Dictionary<string, List<string>>();
        public List<string> ListOfImages { get; set; } = new();
        public async Task<IActionResult> OnGetAsync()
        {
            Type = Request.Query["type"];
            var result = await _edgeclient.QueryAsync<City>("SELECT City { Id := .id, Name := .name, Neighbourhoods := (SELECT .neighbourhoods { Id := .id, Name := .name }) }");
            Cities = result.ToList();
            return Page();
        }
        public async Task<IActionResult> OnPost()
        {
            if (string.IsNullOrEmpty(MaintenanceRequest.RequestCategory) || string.IsNullOrEmpty(MaintenanceRequest.Description)  || string.IsNullOrEmpty(MaintenanceRequest.RequestDate.ToString()) || string.IsNullOrEmpty(MaintenanceRequest.RequesterName) || string.IsNullOrEmpty(MaintenanceRequest.RequesterPhone) || string.IsNullOrEmpty(MaintenanceRequest.RequesterEmail) || string.IsNullOrEmpty(MaintenanceRequest.Street))
            {
                ModelState.AddModelError("ContactError", "All fields must be filled");
                return Page();
            }
            RequestNumber++;
            await AddRequest(MaintenanceRequest);
            return RedirectToPage("ListOfPersonnel");
        }
        public static Guid Int2Guid(int value)
        {
            byte[] bytes = new byte[16];
            BitConverter.GetBytes(value).CopyTo(bytes, 0);
            return new Guid(bytes);
        }

        public static int Guid2Int(Guid value)
        {
            byte[] b = value.ToByteArray();
            int bint = BitConverter.ToInt32(b, 0);
            return bint;
        }

        public async Task AddRequest(MaintenanceRequest Req)
        {
            var result = await _edgeclient.QueryAsync<MaintenanceRequest>("SELECT MaintenanceRequest {Id := .custom_id }");
            if(result.Count ==0)
            {
                RequestNumber = 0;
            }
            else
            {
                ListOfRequests = result.ToList();
                foreach (var item in ListOfRequests)
                {
                    int num = Guid2Int(item.Id);
                    RequestIds.Add(num);
                }
                RequestNumber = RequestIds.Max();
            }
            RequestNumber++;
            var query = "INSERT MaintenanceRequest {custom_id := <uuid>$custom_id , request_category := <FieldOfWorkEnum>$request_category, request_status := <RequestStatusEnum>$request_status, request_date := <datetime>$request_date,assigned_date := <datetime>$assigned_date, description := <str>$description, requester_name := <str>$requester_name, requester_email := <str>$requester_email, requester_phone := <str>$requester_phone, street := <str>$street , image := <array<str>>$image , neighbourhood := (SELECT Neighbourhood FILTER .id = <uuid>$neighbourhood_id) }";
            var res = await _edgeclient.QueryAsync<Neighbourhood>("SELECT Neighbourhood{Id := .id , Name := .name , City := Neighbourhood.city{Id := .id, Name:= .name }} FILTER .name = <str>$name", new Dictionary<string, object?> { { "name", NeighbourhoodName } });
            SelectedNeighbourhood = res.ToList().First();
            MaintenanceRequest.RequestStatus = "Pending";
            MaintenanceRequest.AssignedDate = DateTime.Now;
            Guid guid = Int2Guid(RequestNumber);
            MaintenanceRequest.Id = guid;
            if (MaintenanceRequest.Image != null && MaintenanceRequest.Image.Count > 0)
            {
                foreach(var image in MaintenanceRequest.Image)
                {
                    var filePath = Path.Combine("wwwroot/Assets/Images/Issues", image.FileName);
                    using (var fileStream = new FileStream(filePath, FileMode.Create))
                    {
                        image.CopyTo(fileStream);
                    }
                    ListOfImages.Add(image.FileName);
                }
                MaintenanceRequest.ImageString = ListOfImages;
                await _edgeclient.ExecuteAsync(query, new Dictionary<string, object?>
                {
                    {"custom_id", MaintenanceRequest.Id},
                    {"request_category", MaintenanceRequest.RequestCategory},
                    {"request_status", MaintenanceRequest.RequestStatus},
                    {"request_date", MaintenanceRequest.RequestDate},
                    {"assigned_date", MaintenanceRequest.AssignedDate},
                    {"description", MaintenanceRequest.Description},
                    {"requester_name", MaintenanceRequest.RequesterName},
                    {"requester_email", MaintenanceRequest.RequesterEmail},
                    {"requester_phone", MaintenanceRequest.RequesterPhone},
                    {"street", MaintenanceRequest.Street},
                    {"image", MaintenanceRequest.ImageString.ToArray()},
                    {"neighbourhood_id", SelectedNeighbourhood.Id}
                });
            }
            else
            {
                MaintenanceRequest.ImageString=ListOfImages;
                await _edgeclient.ExecuteAsync(query, new Dictionary<string, object?>
                {
                    {"custom_id", MaintenanceRequest.Id},
                    {"request_category", MaintenanceRequest.RequestCategory},
                    {"request_status", MaintenanceRequest.RequestStatus},
                    {"request_date", MaintenanceRequest.RequestDate},
                    {"assigned_date", MaintenanceRequest.AssignedDate},
                    {"description", MaintenanceRequest.Description},
                    {"requester_name", MaintenanceRequest.RequesterName},
                    {"requester_email", MaintenanceRequest.RequesterEmail},
                    {"requester_phone", MaintenanceRequest.RequesterPhone},
                    {"street", MaintenanceRequest.Street},
                    {"image", MaintenanceRequest.ImageString.ToArray()},
                    {"neighbourhood_id", SelectedNeighbourhood.Id}
                });
            }
            
        }

    }
}


