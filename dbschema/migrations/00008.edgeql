CREATE MIGRATION m1vl3oqllhcjj4gsnqniifluyna5qvhsetwfxsqie3pmhnseq5beia
    ONTO m1d5zwo2lawqqv34fsc3cm23qxhdpf5icmmnhcomrq2nyr2gydgy5a
{
  ALTER TYPE default::User {
      ALTER PROPERTY city {
          SET TYPE std::str USING ('untitled');
      };
      ALTER PROPERTY country {
          SET TYPE std::str USING ('untitled');
      };
      DROP PROPERTY gps_location;
      ALTER PROPERTY neighbourhood {
          SET TYPE std::str USING ('untitled');
      };
  };
  ALTER TYPE default::MaintenanceRequest {
      ALTER PROPERTY city {
          SET TYPE std::str USING ('untitled1');
      };
      ALTER PROPERTY country {
          SET TYPE std::str USING ('untitled2');
      };
      ALTER PROPERTY street {
          SET TYPE std::str USING ('untitled3');
      };
  };
  DROP SCALAR TYPE default::CityEnum;
  DROP SCALAR TYPE default::CountryEnum;
  DROP SCALAR TYPE default::NeighbourhoodEnum;
  DROP SCALAR TYPE default::StreetEnum;
};
