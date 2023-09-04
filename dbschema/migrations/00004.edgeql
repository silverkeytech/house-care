CREATE MIGRATION m1rcyxibd6avh3wx2c7kpioybvoln7sf6qq2nbm6rwjjzcepmrrnna
    ONTO m17tgtlqgyiu7xobmxoku3qe3nslkfglbjdinzomaheupsdc7y4uiq
{
  ALTER SCALAR TYPE default::RequestCategoryEnum RENAME TO default::FieldOfWorkEnum;
  ALTER TYPE default::User {
      ALTER PROPERTY field_of_work {
          SET TYPE default::FieldOfWorkEnum;
      };
  };
  ALTER TYPE default::MaintenancePersonnel {
      ALTER PROPERTY field_of_work {
          SET TYPE default::FieldOfWorkEnum;
      };
  };
  ALTER TYPE default::User {
      ALTER PROPERTY location {
          RENAME TO gps_location;
      };
      ALTER PROPERTY neighbourhood {
          SET REQUIRED USING (<default::NeighbourhoodEnum>{'Dokki'});
      };
  };
  ALTER TYPE default::MaintenanceRequest {
      DROP PROPERTY address;
      DROP PROPERTY status;
  };
};
