CREATE MIGRATION m17vq6eh76nboa6pkurkqzdarxgbnlq63vjorl7reew7kcpkd3flfa
    ONTO m1epl6looea2c5fp4k2pkjjzarqhrzckrkipye3k53nvghwdxwpzla
{
  ALTER TYPE default::MaintenanceRequest {
      CREATE REQUIRED PROPERTY custom_id: std::uuid {
          SET REQUIRED USING (<std::uuid>{});
      };
  };
  ALTER TYPE default::MaintenanceRequest {
      ALTER PROPERTY id {
          DROP OWNED;
          RESET TYPE;
      };
  };
};
