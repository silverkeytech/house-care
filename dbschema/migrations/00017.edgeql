CREATE MIGRATION m1m2sackipfhf6mheujvd5j2hutksud75r5nxug2vxyxydjx4hnj7q
    ONTO m134vrfazdcjhhte6k4jme5bhjuutbld7zhsjde7taxqmxeyh4nzpa
{
  ALTER TYPE default::MaintenanceRequest {
      ALTER PROPERTY custom_id {
          RENAME TO Id;
      };
  };
};
