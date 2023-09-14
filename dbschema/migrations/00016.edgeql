CREATE MIGRATION m134vrfazdcjhhte6k4jme5bhjuutbld7zhsjde7taxqmxeyh4nzpa
    ONTO m17sjqxkxefskyc4tfkbltt4a3xsij5tpjhntqaoi4zcp54cp4ltdq
{
  ALTER TYPE default::MaintenancePersonnel {
      DROP INDEX ON (.image);
  };
};
