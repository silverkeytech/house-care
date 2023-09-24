CREATE MIGRATION m15kw4b27nltizmvw5atg2uqaxwufphyfmlr7vcvbuvnltnkd74dcq
    ONTO m15glmc6ctyme42si6ke2qqtzxx6thetzsshymecossb3geqlqa7uq
{
  ALTER TYPE default::MaintenancePersonnel {
      CREATE LINK neighbourhood: default::Neighbourhood;
  };
  ALTER TYPE default::MaintenanceRequest {
      CREATE LINK neighbourhood: default::Neighbourhood;
  };
};
