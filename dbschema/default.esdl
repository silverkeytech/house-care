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

    type City {
       required property name -> str {
        constraint exclusive;
       };
       multi link neighbourhoods -> Neighbourhood;
     }
    
    type Neighbourhood {
      required property name -> str;
      required link city -> City;
    }

    type MaintenancePersonnel {
        required property first_name -> str;
        required property last_name -> str;
        required property email -> str {
            constraint exclusive;
        };        
        required property phone -> str;
        required property password -> str;
        required property field_of_work -> FieldOfWorkEnum;
        required property image -> str;
        multi link areas_of_operation -> Neighbourhood;
    }

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
        optional property image -> array<str>;
        link assigned_to -> MaintenancePersonnel;
        link neighbourhood -> Neighbourhood;
        
    }
}