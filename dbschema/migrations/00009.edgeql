CREATE MIGRATION m12vgx2gyejxzdsgejlmr2n266y32nmu5sc77f6plr3n7ee4rgnhfa
    ONTO m1vl3oqllhcjj4gsnqniifluyna5qvhsetwfxsqie3pmhnseq5beia
{
  ALTER TYPE default::User {
      DROP PROPERTY country;
  };
  ALTER TYPE default::MaintenanceRequest {
      ALTER PROPERTY country {
          RENAME TO neighbourhood;
      };
  };
};
