CREATE MIGRATION m15glmc6ctyme42si6ke2qqtzxx6thetzsshymecossb3geqlqa7uq
    ONTO m1pkna3ppol3qwjmxyucax7mieko5cfvhuflqjkkzyxllkoenplpca
{
  ALTER TYPE default::MaintenancePersonnel {
      CREATE REQUIRED PROPERTY street: std::str {
          SET REQUIRED USING ('untitled');
      };
  };
  ALTER TYPE default::MaintenanceRequest {
      CREATE REQUIRED PROPERTY street: std::str {
          SET REQUIRED USING ('untitled');
      };
  };
};
