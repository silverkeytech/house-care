namespace HouseCare.Models
{
    public class City
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public List<Neighbourhood> Neighbourhoods { get; set; }


    }
}
