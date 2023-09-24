CREATE MIGRATION m1fij4tuvxceoih4qsydk5brfd2x4dqrf227yctg4a5ok6nv2jgvbq
    ONTO m1u6qwlwb2m5zuugccc5izuv7vff2ymeb3i7svkn2hzjdsakgs73ra
{
  ALTER TYPE default::MaintenancePersonnel {
      DROP LINK street;
  };
  ALTER TYPE default::MaintenanceRequest {
      DROP LINK street;
  };
};
