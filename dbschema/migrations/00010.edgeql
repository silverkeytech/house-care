CREATE MIGRATION m13mfokefvwugrbwifoq3kpd4atvgn5vppzj4pl7yrhzpxbycyfhlq
    ONTO m12vgx2gyejxzdsgejlmr2n266y32nmu5sc77f6plr3n7ee4rgnhfa
{
  ALTER TYPE default::MaintenanceRequest {
      DROP INDEX ON (.image);
      ALTER PROPERTY image {
          SET TYPE array<std::str> USING (['untitled', 'untitled2']);
      };
  };
};
