CREATE MIGRATION m1gb37n3a6cpmt345kg3sxfa4hxyregicdf4izyqjihj7mprq2xcuq
    ONTO m1umzghbb6lbixkn32vgbuzvzj5rrnbvu2vcyf2pggu5fd3zemup3a
{
  ALTER TYPE default::MaintenancePersonnel {
      DROP PROPERTY city;
      DROP PROPERTY neighbourhood;
  };
};
