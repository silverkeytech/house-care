CREATE MIGRATION m1epl6looea2c5fp4k2pkjjzarqhrzckrkipye3k53nvghwdxwpzla
    ONTO m13mfokefvwugrbwifoq3kpd4atvgn5vppzj4pl7yrhzpxbycyfhlq
{
  ALTER TYPE default::MaintenanceRequest {
      ALTER PROPERTY id {
          SET OWNED;
          SET TYPE std::uuid;
      };
  };
};
