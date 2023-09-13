CREATE MIGRATION m1sqndmfa6muw7dqrg5zsf2agw5clpkrannaynoerua6xxgl7epjxa
    ONTO m17vq6eh76nboa6pkurkqzdarxgbnlq63vjorl7reew7kcpkd3flfa
{
  ALTER SCALAR TYPE default::FieldOfWorkEnum EXTENDING enum<Plumbing, Electricity, Refrigerator, Carpentry, AC, Painting, Stove, Dishwasher, `Washing Machine`, `Electric Heater`, Dryer, Microwave, `Water Heater`, `Ceiling Fans`, `Wood Repairs`>;
};
