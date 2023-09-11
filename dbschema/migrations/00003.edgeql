CREATE MIGRATION m1s4utlkwkiur4jvpkkffvz22btf3emjvag4qc5bd5igix7cffmvvq
    ONTO m1wyhnqgns3pfm6xlgnbg53tu4tw5vvs3dogeheoh2ufnrc5bzg2za
{
  ALTER TYPE default::MaintenanceRequest {
      DROP PROPERTY gps_location;
  };
};
