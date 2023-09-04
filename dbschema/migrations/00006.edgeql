CREATE MIGRATION m1kdiuarhk3zjto5tszmxbvssurd65y6uegw5qdxrzlkufcsof4bxa
    ONTO m1ygwdalx6ui62jjklnfsqdqhrwfnxi3spbj4sh5obfk3ryfyswnzq
{
  ALTER TYPE default::User {
      DROP PROPERTY is_customer;
  };
};
