CREATE MIGRATION m12jl7rltzpneaz6taqh5n4mwvijvcv4gmzgzhegrhpwhwtokrhava
    ONTO m1ec6cy3ptqwv4x3tlbq7slzeepz2fr7yrszw5j2vo3hbs7rwvalxq
{
  ALTER TYPE default::User {
      ALTER PROPERTY city {
          SET TYPE default::CityEnum;
      };
  };
  ALTER TYPE default::MaintenanceRequest {
      ALTER PROPERTY city {
          SET TYPE default::CityEnum;
      };
  };
};
