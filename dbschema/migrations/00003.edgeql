CREATE MIGRATION m17tgtlqgyiu7xobmxoku3qe3nslkfglbjdinzomaheupsdc7y4uiq
    ONTO m17ra54mj23gelc32zorpoczftqbi3jfq32jsutcphnx3mwbjwisza
{
  ALTER TYPE default::MaintenanceRequest {
      CREATE REQUIRED PROPERTY country: std::str {
          SET REQUIRED USING (<std::str>{'Egypt'});
      };
  };
  CREATE SCALAR TYPE default::RequestCategoryEnum EXTENDING enum<Plumbing, Electrity, Refrigirator, Carpentry, AC, Painting, Stove, Dishwasher, `Washing Machine`, `Electric Heater`, Dryer, Microwave, `Water Heater`, `Ceileing Fans`, `Wood Repairs`>;
  ALTER TYPE default::MaintenanceRequest {
      ALTER PROPERTY request_category {
          SET TYPE default::RequestCategoryEnum;
      };
  };
  CREATE SCALAR TYPE default::RequestStatusEnum EXTENDING enum<Pending, Scheduled, Finished, Cancelled>;
  ALTER TYPE default::MaintenanceRequest {
      ALTER PROPERTY request_status {
          SET TYPE default::RequestStatusEnum;
      };
  };
  ALTER SCALAR TYPE default::NeighbourhoodEnum EXTENDING enum<Mohandseen, Manial, Dokki, `Nasr City`, `First Settlement`, `Fifth Settlement`, `Maadi Corniche`, `Sheikh Zayed`, `6th of October`, Downtown, `Masr El Gedida`, Giza, Mokattam, `Zahraa el Maadi`, Shorouk, Madinaty, Oraby>;
};
