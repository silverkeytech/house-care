CREATE MIGRATION m1o7ppp4thrle5vlbu3olp3ks5rx3zectev4dq53uplokedw72oz7a
    ONTO m134pozu4xorpwefrwddqhssmnjxywd24ul7uevzh3gwyrzufpitjq
{
  ALTER TYPE default::Review {
      CREATE OPTIONAL PROPERTY stars_personnel: range<std::int32>;
      CREATE OPTIONAL PROPERTY stars_quality: range<std::int32>;
  };
};
