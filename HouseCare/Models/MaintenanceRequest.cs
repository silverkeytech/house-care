namespace HouseCare.Models
{
    public class MaintenanceRequest
    {
        public string RequesterName { get; set; }
        public string City { get; set; }
        public DateTime AssignedDate { get; set; }
        public string RequestCategory { get; set; }
        public string RequestStatus { get; set; }
    }
}
