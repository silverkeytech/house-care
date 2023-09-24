CREATE MIGRATION m1pkna3ppol3qwjmxyucax7mieko5cfvhuflqjkkzyxllkoenplpca
    ONTO m1vmvnpkwajishwemkwt6uhiizmd7ylsdlllxn6mgw2yknamkpd6ia
{
  ALTER TYPE default::Neighbourhood {
      DROP LINK streets;
  };
  DROP TYPE default::Street;
};
