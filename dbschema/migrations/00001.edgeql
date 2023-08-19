CREATE MIGRATION m1dv4iqakqhhctuk3iq4tpawhc7ymjgpjv66alwfakqvesaprksaoq
    ONTO initial
{
  CREATE TYPE default::User {
      CREATE REQUIRED PROPERTY city: std::str;
      CREATE REQUIRED PROPERTY email: std::str {
          CREATE CONSTRAINT std::exclusive;
      };
      CREATE OPTIONAL PROPERTY field_of_work: std::str;
      CREATE REQUIRED PROPERTY first_name: std::str;
      CREATE REQUIRED PROPERTY is_customer: std::bool;
      CREATE REQUIRED PROPERTY last_name: std::str;
      CREATE REQUIRED PROPERTY location: std::str;
      CREATE REQUIRED PROPERTY password: std::str;
      CREATE REQUIRED PROPERTY phone: std::str;
  };
  CREATE TYPE default::MaintenancePersonnel EXTENDING default::User {
      ALTER PROPERTY field_of_work {
          SET OWNED;
          SET TYPE std::str;
      };
  };
  CREATE TYPE default::MaintenanceRequest {
      CREATE LINK assigned_to: default::MaintenancePersonnel;
      CREATE OPTIONAL PROPERTY image: std::str;
      CREATE INDEX ON (.image);
      CREATE REQUIRED PROPERTY assigned_date: std::datetime;
      CREATE REQUIRED PROPERTY city: std::str;
      CREATE REQUIRED PROPERTY description: std::str;
      CREATE REQUIRED PROPERTY is_logged_in: std::bool;
      CREATE REQUIRED PROPERTY location: std::str;
      CREATE REQUIRED PROPERTY request_category: std::str;
      CREATE REQUIRED PROPERTY request_date: std::datetime;
      CREATE REQUIRED PROPERTY requester_email: std::str;
      CREATE REQUIRED PROPERTY requester_name: std::str;
      CREATE REQUIRED PROPERTY requester_phone: std::str;
      CREATE REQUIRED PROPERTY status: std::str;
  };
  CREATE TYPE default::Review {
      CREATE LINK reviewed_request: default::MaintenanceRequest;
      CREATE LINK reviewed_by: default::User;
      CREATE REQUIRED PROPERTY review_text: std::str;
      CREATE REQUIRED PROPERTY stars_personnel: std::int16;
      CREATE REQUIRED PROPERTY stars_quality: std::int16;
  };
};
