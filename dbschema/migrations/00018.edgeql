CREATE MIGRATION m1umzghbb6lbixkn32vgbuzvzj5rrnbvu2vcyf2pggu5fd3zemup3a
    ONTO m1m2sackipfhf6mheujvd5j2hutksud75r5nxug2vxyxydjx4hnj7q
{
  CREATE TYPE default::City {
      CREATE REQUIRED PROPERTY name: std::str {
          CREATE CONSTRAINT std::exclusive;
      };
  };
  CREATE TYPE default::Neighbourhood {
      CREATE REQUIRED LINK city: default::City;
      CREATE REQUIRED PROPERTY name: std::str;
  };
  ALTER TYPE default::City {
      CREATE MULTI LINK neighbourhoods: default::Neighbourhood;
  };
  CREATE TYPE default::Street {
      CREATE REQUIRED LINK neighbourhood: default::Neighbourhood;
      CREATE REQUIRED PROPERTY name: std::str;
  };
  ALTER TYPE default::Neighbourhood {
      CREATE MULTI LINK streets: default::Street;
  };
};
