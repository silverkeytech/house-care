CREATE MIGRATION m1kl2jm5lkk577ifwpogwyg2s4e5d3sdqqm4jzvbe7dbdtfmggikbq
    ONTO m15kw4b27nltizmvw5atg2uqaxwufphyfmlr7vcvbuvnltnkd74dcq
{
  ALTER TYPE default::MaintenancePersonnel {
      CREATE MULTI LINK areas_of_operation: default::Neighbourhood;
  };
  ALTER TYPE default::MaintenancePersonnel {
      DROP LINK neighbourhood;
  };
  ALTER TYPE default::MaintenancePersonnel {
      DROP PROPERTY street;
  };
};
