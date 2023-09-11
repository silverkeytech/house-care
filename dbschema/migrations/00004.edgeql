CREATE MIGRATION m1ec6cy3ptqwv4x3tlbq7slzeepz2fr7yrszw5j2vo3hbs7rwvalxq
    ONTO m1s4utlkwkiur4jvpkkffvz22btf3emjvag4qc5bd5igix7cffmvvq
{
  CREATE SCALAR TYPE default::CountryEnum EXTENDING enum<Egypt, USA, France, China, Japan, Russia, Indonesia, Syria, Jordon, Iraq, Tunisia, Germany, India, Italy, Greece, Canada, Oman, Qatar, Spain, England, Ireland, Ukrain, Libya>;
  ALTER TYPE default::User {
      ALTER PROPERTY country {
          SET TYPE default::CountryEnum;
      };
  };
  ALTER TYPE default::MaintenanceRequest {
      ALTER PROPERTY country {
          SET TYPE default::CountryEnum;
      };
      DROP PROPERTY is_logged_in;
  };
  CREATE SCALAR TYPE default::CityEnum EXTENDING enum<Cairo, Giza, Alexandria, Texas, London, California, Tokyo, Gedda, Riyad>;
  ALTER SCALAR TYPE default::FieldOfWorkEnum EXTENDING enum<Plumbing, Electrity, Refrigerator, Carpentry, AC, Painting, Stove, Dishwasher, WashingMachine, ElectricHeater, Dryer, Microwave, WaterHeater, CeilingFans, WoodRepairs>;
  ALTER SCALAR TYPE default::NeighbourhoodEnum EXTENDING enum<Mohandseen, Manial, Dokki, NasrCity, FirstSettlement, FifthSettlement, MaadiCorniche, SheikhZayed, Downtown, MasrElGedida, Giza, Mokattam, ZahraaelMaadi, Shorouk, Madinaty, Oraby>;
};
