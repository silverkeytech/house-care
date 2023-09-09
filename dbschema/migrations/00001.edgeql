CREATE MIGRATION m1ksdjupimpa2zlfvodhvz27sri5jzwmewzcdmx55pxypbq7oluu7a
    ONTO initial
{
  CREATE SCALAR TYPE default::FieldOfWorkEnum EXTENDING enum<Plumbing, Electrity, Refrigirator, Carpentry, AC, Painting, Stove, Dishwasher, `Washing Machine`, `Electric Heater`, Dryer, Microwave, `Water Heater`, `Ceileing Fans`, `Wood Repairs`>;
  CREATE SCALAR TYPE default::NeighbourhoodEnum EXTENDING enum<Mohandseen, Manial, Dokki, `Nasr City`, `First Settlement`, `Fifth Settlement`, `Maadi Corniche`, `Sheikh Zayed`, `6th of October`, Downtown, `Masr El Gedida`, Giza, Mokattam, `Zahraa el Maadi`, Shorouk, Madinaty, Oraby>;
  CREATE TYPE default::User {
      CREATE REQUIRED PROPERTY city: std::str;
      CREATE REQUIRED PROPERTY country: std::str;
      CREATE REQUIRED PROPERTY email: std::str {
          CREATE CONSTRAINT std::exclusive;
      };
      CREATE OPTIONAL PROPERTY field_of_work: default::FieldOfWorkEnum;
      CREATE REQUIRED PROPERTY first_name: std::str;
      CREATE REQUIRED PROPERTY gps_location: std::str;
      CREATE REQUIRED PROPERTY last_name: std::str;
      CREATE REQUIRED PROPERTY neighbourhood: default::NeighbourhoodEnum;
      CREATE REQUIRED PROPERTY password: std::str;
      CREATE REQUIRED PROPERTY phone: std::str;
      CREATE REQUIRED PROPERTY street: std::str;
  };
  CREATE TYPE default::Customer EXTENDING default::User;
  CREATE TYPE default::MaintenancePersonnel EXTENDING default::User {
      ALTER PROPERTY field_of_work {
          SET OWNED;
          SET TYPE default::FieldOfWorkEnum;
      };
  };
  CREATE SCALAR TYPE default::RequestStatusEnum EXTENDING enum<Pending, Scheduled, Finished, Cancelled>;
  CREATE TYPE default::MaintenanceRequest {
      CREATE LINK assigned_to: default::MaintenancePersonnel;
      CREATE OPTIONAL PROPERTY image: std::str;
      CREATE INDEX ON (.image);
      CREATE REQUIRED PROPERTY assigned_date: std::datetime;
      CREATE REQUIRED PROPERTY city: std::str;
      CREATE REQUIRED PROPERTY country: std::str;
      CREATE REQUIRED PROPERTY description: std::str;
      CREATE REQUIRED PROPERTY gps_location: std::str;
      CREATE REQUIRED PROPERTY is_logged_in: std::bool;
      CREATE REQUIRED PROPERTY request_category: default::FieldOfWorkEnum;
      CREATE REQUIRED PROPERTY request_date: std::datetime;
      CREATE REQUIRED PROPERTY request_status: default::RequestStatusEnum;
      CREATE REQUIRED PROPERTY requester_email: std::str;
      CREATE REQUIRED PROPERTY requester_name: std::str;
      CREATE REQUIRED PROPERTY requester_phone: std::str;
      CREATE REQUIRED PROPERTY street: std::str;
  };
  CREATE TYPE default::Review {
      CREATE LINK reviewed_request: default::MaintenanceRequest;
      CREATE LINK reviewed_by: default::User;
      CREATE REQUIRED PROPERTY review_label: std::str;
      CREATE REQUIRED PROPERTY review_text: std::str;
      CREATE OPTIONAL PROPERTY stars_personnel: range<std::int32>;
      CREATE OPTIONAL PROPERTY stars_quality: range<std::int32>;
  };
};
