module default {
    type User {
        required property first_name -> str;
        required property last_name -> str;
        required property email -> str {
            constraint exclusive;
        };        
        required property phone -> str;
        required property city -> str;
        required property street -> str;
        required property country -> str;
        required property password -> str;
        required property is_customer -> bool;
        required property location -> str;
        optional property field_of_work -> str;
        optional property areas_of_operation -> str;
    }

    # Define MaintenancePersonnel entity as a User with a field_of_work property.
    type MaintenancePersonnel extending User {
        overloaded property field_of_work -> str;
        overloaded property areas_of_operation -> str;
    }

    type MaintenanceRequest {
        required property request_category -> str;
        required property request_status -> str;
        required property request_date -> datetime;  # The date at which the request was issued.
        required property assigned_date -> datetime;  # The date at which the maintenance personnel is schedueled.
        required property description -> str;
        required property requester_name -> str;
        required property requester_email -> str;  # Unique Identifier that links the requester to the request.
        required property requester_phone -> str;
        required property city -> str;
        required property location -> str;
        required property status -> str;
        required property is_logged_in -> bool;  # Indicates whether the request was made by a logged-in user (true for logged-in and false for anonymous).
        optional property image -> str;
        index on (.image);

        link assigned_to -> MaintenancePersonnel;
    }

  type Review {
        required property stars_quality -> int16;  # Number of stars for maintenance quality (e.g., 1 to 5).
        required property stars_personnel -> int16;  # Number of stars for maintenance personnel (e.g., 1 to 5).
        required property review_text -> str;
        required property review_label -> str; # Labels of the review will be defined based on the initial request type.
        
        link reviewed_request -> MaintenanceRequest;
        link reviewed_by -> User;
    }
}
