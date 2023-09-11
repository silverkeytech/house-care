CREATE MIGRATION m1ehabme52tymexhlkstmpaw2lybcobzmiqsuaxa5jkfj7hiu7uqza
    ONTO m12jl7rltzpneaz6taqh5n4mwvijvcv4gmzgzhegrhpwhwtokrhava
{
  ALTER SCALAR TYPE default::FieldOfWorkEnum EXTENDING enum<Plumbing, Electrity, Refrigerator, Carpentry, AC, Painting, Stove, Dishwasher, `Washing Machine`, `Electric Heater`, Dryer, Microwave, `Water Heater`, `Ceiling Fans`, `Wood Repairs`>;
  ALTER SCALAR TYPE default::NeighbourhoodEnum EXTENDING enum<Mohandseen, Manial, Dokki, NasrCity, `First Settlement`, `Fifth Settlement`, `Maadi Corniche`, `Sheikh Zayed`, Downtown, `Masr El Gedida`, Giza, Mokattam, `Zahraa el Maadi`, Shorouk, Madinaty, Oraby>;
  CREATE SCALAR TYPE default::StreetEnum EXTENDING enum<`Al Sheikh Mostafa Tomom`, `Gamal El Raafy`, `Ahmed Oraby`, `South Teseen`, `Oxford Street`, `Regent Street`, `Champs-Elysees`, `Rue de Rivoli`, `Hollywood Boulevard`, `Magnificent Mile`, `Nanjing Road`, `Via Margutta`>;
};
