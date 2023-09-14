CREATE MIGRATION m17sjqxkxefskyc4tfkbltt4a3xsij5tpjhntqaoi4zcp54cp4ltdq
    ONTO m1pvbfc7s327lvsy3p2czkcttzhrbav5ignntbpaxsk3nsbrjgo2aa
{
  ALTER TYPE default::MaintenancePersonnel {
      CREATE REQUIRED PROPERTY image: std::str {
          SET REQUIRED USING ('untitled');
      };
      CREATE INDEX ON (.image);
  };
};
