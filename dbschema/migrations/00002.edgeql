CREATE MIGRATION m1wyhnqgns3pfm6xlgnbg53tu4tw5vvs3dogeheoh2ufnrc5bzg2za
    ONTO m1ksdjupimpa2zlfvodhvz27sri5jzwmewzcdmx55pxypbq7oluu7a
{
  ALTER SCALAR TYPE default::FieldOfWorkEnum EXTENDING enum<Plumbing, Electrity, Refrigerator, Carpentry, AC, Painting, Stove, Dishwasher, `Washing Machine`, `Electric Heater`, Dryer, Microwave, `Water Heater`, `Ceiling Fans`, `Wood Repairs`>;
};
