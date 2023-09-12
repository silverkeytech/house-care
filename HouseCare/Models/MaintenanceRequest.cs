namespace HouseCare.Models
{
    public class MaintenanceRequest
    {
        public Guid Id { get; set; }
        public string RequestCategory { get; set; }
        public string RequestStatus { get; set; }
        public DateTime RequestDate { get; set; }
        public DateTime AssignedDate { get; set; }
        public string Description { get; set; }
        public string RequesterName { get; set; }
        public string RequesterEmail { get; set; }
        public string RequesterPhone { get; set; }
        public string City { get; set; }
        public string Street { get; set; }
        public string Neighbourhood { get; set; }
        public List<IFormFile> Image { get; set; }
        public List<string> ImageString { get; set; }
        public MaintenancePersonnel AssignedTo { get; set; }
    }
}
