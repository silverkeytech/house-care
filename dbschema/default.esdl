module default {

    scalar type RequestStatusEnum extending enum<
         "Pending",
         "Scheduled",
         "Finished",
         "Cancelled"
    >;

    scalar type FieldOfWorkEnum extending enum<
         "Plumbing",
         "Electricity",
         "Refrigerator",
         "Carpentry",
         "AC",
         "Painting",
         "Stove",
         "Dishwasher",
         "Washing Machine",
         "Electric Heater",
         "Dryer",
         "Microwave",
         "Water Heater",
         "Ceiling Fans" ,
         "Wood Repairs"
    >;

    type User {
        required property first_name -> str;
        required property last_name -> str;
        required property email -> str {
            constraint exclusive;
        };        
        required property phone -> str;
        required property street -> str;
        required property neighbourhood -> str;
        required property city -> str;
        required property password -> str;
        optional property field_of_work -> FieldOfWorkEnum;
    }

    # Defined MaintenancePersonnel entity as a User with a field_of_work property.
    type MaintenancePersonnel extending User {
        overloaded property field_of_work -> FieldOfWorkEnum;
    }

    # Defined the Customer entity as a specialization of User without adding any extra properties.
    type Customer extending User;

    type MaintenanceRequest {
        required property custom_id -> uuid;
        required property request_category -> FieldOfWorkEnum;
        required property request_status -> RequestStatusEnum;
        required property request_date -> datetime;  # The date at which the request was issued.
        required property assigned_date -> datetime;  # The date at which the maintenance personnel is scheduled.
        required property description -> str;
        required property requester_name -> str;
        required property requester_email -> str;  # Unique Identifier that links the requester to the request.
        required property requester_phone -> str;
        required property street -> str;
        required property city -> str;
        required property neighbourhood -> str;
        optional property image -> array<str>;
        

        link assigned_to -> MaintenancePersonnel;
    }

    type Review {
        optional property stars_quality -> range<int32>;  # Number of stars for maintenance quality (e.g., 1 to 5).
        optional property stars_personnel -> range<int32>;  # Number of stars for maintenance personnel (e.g., 1 to 5).
        required property review_text -> str;
        required property review_label -> str; # Labels of the review will be defined based on the initial request type.
        
        link reviewed_request -> MaintenanceRequest;
        link reviewed_by -> User;
    }
}