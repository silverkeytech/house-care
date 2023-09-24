CREATE MIGRATION m1vmvnpkwajishwemkwt6uhiizmd7ylsdlllxn6mgw2yknamkpd6ia
    ONTO m1fij4tuvxceoih4qsydk5brfd2x4dqrf227yctg4a5ok6nv2jgvbq
{
  ALTER TYPE default::MaintenanceRequest {
      ALTER PROPERTY Id {
          RENAME TO custom_id;
      };
  };
};
