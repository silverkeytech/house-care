CREATE MIGRATION m1pvbfc7s327lvsy3p2czkcttzhrbav5ignntbpaxsk3nsbrjgo2aa
    ONTO m1sqndmfa6muw7dqrg5zsf2agw5clpkrannaynoerua6xxgl7epjxa
{
  ALTER TYPE default::MaintenancePersonnel {
      ALTER PROPERTY city {
          SET OWNED;
      };
      ALTER PROPERTY email {
          ALTER CONSTRAINT std::exclusive {
              SET OWNED;
          };
          SET OWNED;
      };
      ALTER PROPERTY first_name {
          SET OWNED;
      };
      ALTER PROPERTY last_name {
          SET OWNED;
      };
      ALTER PROPERTY neighbourhood {
          SET OWNED;
      };
      ALTER PROPERTY password {
          SET OWNED;
      };
      ALTER PROPERTY phone {
          SET OWNED;
      };
      ALTER PROPERTY street {
          SET OWNED;
      };
      DROP EXTENDING default::User;
      ALTER PROPERTY city {
          RESET readonly;
          RESET CARDINALITY;
          SET REQUIRED;
          SET TYPE std::str;
      };
      ALTER PROPERTY email {
          RESET readonly;
          RESET CARDINALITY;
          SET REQUIRED;
          SET TYPE std::str;
      };
      ALTER PROPERTY field_of_work {
          RESET readonly;
          RESET CARDINALITY;
          SET REQUIRED USING (<default::FieldOfWorkEnum>{});
      };
      ALTER PROPERTY first_name {
          RESET readonly;
          RESET CARDINALITY;
          SET REQUIRED;
          SET TYPE std::str;
      };
      ALTER PROPERTY last_name {
          RESET readonly;
          RESET CARDINALITY;
          SET REQUIRED;
          SET TYPE std::str;
      };
      ALTER PROPERTY neighbourhood {
          RESET readonly;
          RESET CARDINALITY;
          SET REQUIRED;
          SET TYPE std::str;
      };
      ALTER PROPERTY password {
          RESET readonly;
          RESET CARDINALITY;
          SET REQUIRED;
          SET TYPE std::str;
      };
      ALTER PROPERTY phone {
          RESET readonly;
          RESET CARDINALITY;
          SET REQUIRED;
          SET TYPE std::str;
      };
      ALTER PROPERTY street {
          RESET readonly;
          RESET CARDINALITY;
          SET REQUIRED;
          SET TYPE std::str;
      };
  };
  ALTER TYPE default::User {
      DROP PROPERTY city;
      DROP PROPERTY email;
      DROP PROPERTY field_of_work;
      DROP PROPERTY first_name;
      DROP PROPERTY last_name;
      DROP PROPERTY neighbourhood;
      DROP PROPERTY password;
      DROP PROPERTY phone;
      DROP PROPERTY street;
  };
  DROP TYPE default::Customer;
  ALTER TYPE default::Review {
      DROP LINK reviewed_by;
  };
  DROP TYPE default::User;
};
