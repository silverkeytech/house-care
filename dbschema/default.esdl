module default {

    scalar type RequestStatusEnum extending enum<
        'Pending',
        'Scheduled',
        'Finished',
        'Cancelled'
    >;

    scalar type FieldOfWorkEnum extending enum<
        'Plumbing',
        'Electrity',
        'Refrigirator',
        'Carpentry',
        'AC',
        'Painting',
        'Stove',
        'Dishwasher',
        'Washing Machine',
        'Electric Heater',
        'Dryer',
        'Microwave',
        'Water Heater',
        'Ceileing Fans',
        'Wood Repairs'
    >;

    scalar type NeighbourhoodEnum extending enum<
    'Mohandseen',
    'Manial',
    'Dokki',
    'Nasr City',
    'First Settlement',
    'Fifth Settlement',
    'Maadi Corniche',
    'Sheikh Zayed',
    '6th of October',
    'Downtown',
    'Masr El Gedida',
    'Giza',
    'Mokattam',
    'Zahraa el Maadi',
    'Shorouk',
    'Madinaty',
    'Oraby'
    >;

    type User {
        required property first_name -> str;
        required property last_name -> str;
        required property email -> str {
            constraint exclusive;
        };        
        required property phone -> str;
        required property street -> str;
        required property neighbourhood -> NeighbourhoodEnum;
        required property city -> str;
        required property country -> str;
        required property password -> str;
        required property gps_location -> str; # GPS link for location
        optional property field_of_work -> FieldOfWorkEnum;
    }

    # Define MaintenancePersonnel entity as a User with a field_of_work property.
    type MaintenancePersonnel extending User {
        overloaded property field_of_work -> FieldOfWorkEnum;
    }

    # Define the Customer entity as a specialization of User without adding any extra properties.
    type Customer extending User;

    type MaintenanceRequest {
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
        required property country -> str;
        required property gps_location -> str;
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
