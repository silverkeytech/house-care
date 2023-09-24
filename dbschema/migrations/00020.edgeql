CREATE MIGRATION m1lsutuov4jc74hbiv2vxs24um6s5t2am4nkyvtrble7iqc4kyrivq
    ONTO m1gb37n3a6cpmt345kg3sxfa4hxyregicdf4izyqjihj7mprq2xcuq
{
  ALTER TYPE default::MaintenancePersonnel {
      DROP PROPERTY street;
  };
  ALTER TYPE default::MaintenancePersonnel {
      CREATE LINK street: default::Street;
  };
};
