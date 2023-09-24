CREATE MIGRATION m1u6qwlwb2m5zuugccc5izuv7vff2ymeb3i7svkn2hzjdsakgs73ra
    ONTO m1egx6km6edt5wlwzsnuo2c4f6bpf24pven2ks7pm4pt7ysdc6gg6q
{
  ALTER TYPE default::MaintenanceRequest {
      DROP PROPERTY street;
  };
  ALTER TYPE default::MaintenanceRequest {
      CREATE LINK street: default::Street;
      DROP PROPERTY city;
      DROP PROPERTY neighbourhood;
  };
};
