CREATE TABLE `bed_history` (
  `bed_history_id` integer,
  `description` varchar(255),
  `history_event` varchar(255),
  `bed_id` integer,
  `bed_request_id` integer,
  PRIMARY KEY (`bed_history_id`)
);

CREATE TABLE `resource` (
  `resource_id` integer,
  `type` varchar(255),
  `name` varchar(255),
  `identifier` varchar(255),
  `description` varchar(255),
  `hospital_id` integer,
  PRIMARY KEY (`resource_id`)
);

CREATE TABLE `department` (
  `department_id` integer,
  `name` varchar(255),
  `description` varchar(255),
  `contact` varchar(255),
  `configuration` json,
  `hospital_id` integer,
  `logo` varchar(255) ,
  PRIMARY KEY (`department_id`)
);

CREATE TABLE `hospital` (
  `hospital_id` integer,
  `name` varchar(255),
  `address` varchar(255),
  `contact` varchar(255),
  `number_of_rooms` integer,
  `logo` varchar(255) ,
  PRIMARY KEY (`hospital_id`)
);

CREATE TABLE `room` (
  `room_id` integer,
  `name` varchar(255),
  `description` varchar(255),
  `floor` integer,
  `location_type` varchar(255),
  `space` varchar(255),
  `max_number_of_beds` integer,
  `is_wash_room_available` boolean,
  `status` varchar(255),
  `last_maintenance_date` datetime,
  `next_maintenance_date` datetime,
  `room_condition` varchar(255),
  `type` varchar(255),
  `service_available` varchar(255),
  `layout` varchar(255),
  `hospital_id` integer,
  PRIMARY KEY (`room_id`)
);

CREATE TABLE `rel_management_department` (
  `management_id` varchar(255),
  `department_id` integer,
  PRIMARY KEY (`management_id`, `department_id`)
);

CREATE TABLE `bed_request` (
  `bed_request_id` integer,
  `request_date` datetime,
  `allocated_date` datetime,
  `estimated_period` integer,
  `expected_discharge_date` datetime,
  `actual_discharge_date` datetime,
  `period_unit` varchar(255),
  `request_status` varchar(255),
  `priority` varchar(255),
  `department_id` integer,
  `bed_id` integer,
  `hospital_id` integer,
  PRIMARY KEY (`bed_request_id`)
);

CREATE TABLE `bed` (
  `bed_id` integer,
  `name` varchar(255),
  `identifier` varchar(255),
  `type` varchar(255),
  `status` varchar(255),
  `allocation_status` varchar(255),
  `last_allocation` datetime,
  `bed_condition` varchar(255),
  `cost` integer,
  `maintenance_time` integer,
  `room_id` integer,
  `department_id` integer,
  `hospital_id` integer,
  `deallocated_at` datetime,
  PRIMARY KEY (`bed_id`)
);

CREATE TABLE `management` (
  `management_id` varchar(255),
  `login` varchar(255),
  `first_name` varchar(255),
  `last_name` varchar(255),
  `email` varchar(255),
  `image_url` varchar(255),
  `activated` boolean,
  `lang_key` varchar(255),
  `created_by` varchar(255),
  `created_date` datetime,
  `last_modified_by` varchar(255),
  `last_modified_date` datetime,
  PRIMARY KEY (`management_id`)
);

CREATE TABLE `patient` (
  `patient_id` integer,
  `name` varchar(255),
  `contact` varchar(255),
  `address` varchar(255),
  `identifier` varchar(255),
  `age` integer,
  `admitted_date` datetime,
  `bed_request_id` integer,
  PRIMARY KEY (`patient_id`)
);

CREATE TABLE `patient_vitals` (
  `patient_vitals_id` integer,
  `type` varchar(255),
  `description` varchar(255),
  `heart_rate` integer,
  `spo_2_level` integer,
  `blood_pressure` integer,
  `temperature` integer,
  `data_source` varchar(255),
  `additional_data` varchar(255),
  `record_time` datetime,
  `patient_id` integer,
  `bed_request_id` integer,
  PRIMARY KEY (`patient_vitals_id`)
);

