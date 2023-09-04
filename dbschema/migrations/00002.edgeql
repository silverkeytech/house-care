CREATE MIGRATION m17ra54mj23gelc32zorpoczftqbi3jfq32jsutcphnx3mwbjwisza
    ONTO m1dv4iqakqhhctuk3iq4tpawhc7ymjgpjv66alwfakqvesaprksaoq
{
  ALTER TYPE default::User {
      CREATE REQUIRED PROPERTY country: std::str {
          SET REQUIRED USING (<std::str>{'Egypt'});
      };
  };
  CREATE SCALAR TYPE default::NeighbourhoodEnum EXTENDING enum<Mohandseen, Manial, Dokki>;
  ALTER TYPE default::User {
      CREATE OPTIONAL PROPERTY neighbourhood: default::NeighbourhoodEnum;
      CREATE REQUIRED PROPERTY street: std::str {
          SET REQUIRED USING (<std::str>{'Adly'});
      };
  };
  ALTER TYPE default::MaintenancePersonnel {
      ALTER PROPERTY neighbourhood {
          SET OWNED;
          SET TYPE default::NeighbourhoodEnum;
      };
  };
  ALTER TYPE default::MaintenanceRequest {
      CREATE REQUIRED PROPERTY gps_location: std::str {
          SET REQUIRED USING (<std::str>{'https://www.google.com/maps/place/Al+Dokki+St,+Giza+Governorate/@30.0376537,31.193076,15z/data=!3m1!4b1!4m10!1m2!2m1!1sdokki+street!3m6!1s0x145846d49af079cf:0x589c25a0ef88808!8m2!3d30.0376364!4d31.2115301!15sCgxkb2traSBzdHJlZXSSAQVyb3V0ZeABAA!16s%2Fg%2F1tfdv6zx?entry=ttu'});
      };
  };
  ALTER TYPE default::MaintenanceRequest {
      ALTER PROPERTY location {
          RENAME TO address;
      };
  };
  ALTER TYPE default::MaintenanceRequest {
      CREATE REQUIRED PROPERTY request_status: std::str {
          SET REQUIRED USING (<std::str>{'Pending'});
      };
      CREATE REQUIRED PROPERTY street: std::str {
          SET REQUIRED USING (<std::str>{'Dokki'});
      };
  };
  ALTER TYPE default::Review {
      CREATE REQUIRED PROPERTY review_label: std::str {
          SET REQUIRED USING (<std::str>{'5'});
      };
  };
};
