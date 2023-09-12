CREATE MIGRATION m1d5zwo2lawqqv34fsc3cm23qxhdpf5icmmnhcomrq2nyr2gydgy5a
    ONTO m1ehabme52tymexhlkstmpaw2lybcobzmiqsuaxa5jkfj7hiu7uqza
{
  ALTER TYPE default::MaintenanceRequest {
      ALTER PROPERTY street {
          SET TYPE default::StreetEnum;
      };
  };
};
