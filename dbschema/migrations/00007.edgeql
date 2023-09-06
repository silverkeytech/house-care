CREATE MIGRATION m134pozu4xorpwefrwddqhssmnjxywd24ul7uevzh3gwyrzufpitjq
    ONTO m1kdiuarhk3zjto5tszmxbvssurd65y6uegw5qdxrzlkufcsof4bxa
{
  ALTER TYPE default::Review {
      DROP PROPERTY stars_personnel;
      DROP PROPERTY stars_quality;
  };
};
