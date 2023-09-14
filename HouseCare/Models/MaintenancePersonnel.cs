namespace HouseCare.Models
{
    public class MaintenancePersonnel
    {
        public Guid Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string Neighbourhood { get; set; }
        public string Password { get; set; }
        public string FieldOfWork { get; set; }
        public string Image { get; set; }
        public IFormFile ImageFile { get; set; }
    }
}
