CREATE MIGRATION m1ygwdalx6ui62jjklnfsqdqhrwfnxi3spbj4sh5obfk3ryfyswnzq
    ONTO m1rcyxibd6avh3wx2c7kpioybvoln7sf6qq2nbm6rwjjzcepmrrnna
{
  CREATE TYPE default::Customer EXTENDING default::User;
  ALTER TYPE default::MaintenancePersonnel {
      ALTER PROPERTY neighbourhood {
          DROP OWNED;
          RESET TYPE;
      };
  };
};
