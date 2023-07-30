# Define abstract User entity with unique identifier 'id' and 'name'.
abstract type User {
    required property id -> uuid;
    required property name -> str;
}

# Define MaintenancePersonnel entity for maintenance personnel sign up.
type MaintenancePersonnel extending User {
    # Additional fields specific to maintenance personnel.
    required property phone -> str;
    required property email -> str;
    required property city -> str;
    required property address -> str;
    required property is_customer -> bool;
    required property field_of_work -> str;
    required property location -> str;
}


# Define MaintenanceRequest entity for maintenance requests.
type MaintenanceRequest {
    required property id -> uuid;
    # Link to the User who initiated the request (Optional).
    link user -> User;
    # Link to the MaintenancePersonnel assigned to the request (Optional).
    link personnel -> MaintenancePersonnel;
    required property request_date -> datetime;
    required property maintenance_type -> str;
    required property description -> str;
    property optional_picture -> str;
    required property request_status -> str;
}

# Define Review entity for reviews of maintenance personnel.
type Review {
    required property id -> uuid;
    # Link to the User who created the review.
    link reviewer -> User;
    # Link to the MaintenancePersonnel being reviewed.
    link personnel -> MaintenancePersonnel;
    required property review_date -> datetime;
    required property rating -> int16;
    required property review_text -> str;
    required property tag -> str;
}
