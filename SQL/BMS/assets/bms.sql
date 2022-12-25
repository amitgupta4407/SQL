-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2022 at 05:06 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bms`
--

-- --------------------------------------------------------

--
-- Table structure for table `bed`
--

CREATE TABLE `bed` (
  `bed_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `allocation_status` varchar(255) DEFAULT NULL,
  `last_allocation` datetime DEFAULT NULL,
  `bed_condition` varchar(255) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `maintenance_time` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  `deallocated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bed`
--

INSERT INTO `bed` (`bed_id`, `name`, `identifier`, `type`, `status`, `allocation_status`, `last_allocation`, `bed_condition`, `cost`, `maintenance_time`, `room_id`, `department_id`, `hospital_id`, `deallocated_at`) VALUES
(1, 'Bed 1', 'BED0001', 'single', 'available', 'empty', NULL, 'good', 100, 7, 1, 1, 1, NULL),
(2, 'Bed 2', 'BED0002', 'double', 'available', 'empty', NULL, 'good', 200, 7, 2, 2, 1, NULL),
(3, 'Bed 3', 'BED0003', 'single', 'available', 'empty', NULL, 'good', 100, 7, 3, 3, 1, NULL),
(4, 'Bed 4', 'BED0004', 'double', 'available', 'empty', NULL, 'good', 200, 7, 4, 4, 1, NULL),
(5, 'Bed 5', 'BED0005', 'single', 'available', 'empty', NULL, 'good', 100, 7, 5, 5, 1, NULL),
(6, 'Bed 6', 'BED0006', 'single', 'available', 'empty', NULL, 'good', 500, 6, 2, 5, 1, NULL),
(7, 'Bed 7', 'BED0007', 'double', 'available', 'empty', NULL, 'good', 100, 6, 2, 5, 1, NULL),
(8, 'Bed 8', 'BED0008', 'double', 'available', 'empty', NULL, 'good', 200, 2, 2, 5, 1, NULL),
(9, 'Bed 9', 'BED0009', 'single', 'available', 'empty', NULL, 'good', 150, 2, 2, 5, 1, NULL),
(10, 'Bed 10', 'BED0010', 'single', 'available', 'empty', NULL, 'broken', 250, 2, 4, 5, 1, NULL),
(11, 'Bed 11', 'BED0011', 'single', 'available', 'full', NULL, 'good', 250, 2, 1, 5, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bed_history`
--

CREATE TABLE `bed_history` (
  `bed_history_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `history_event` varchar(255) DEFAULT NULL,
  `bed_id` int(11) DEFAULT NULL,
  `bed_request_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bed_history`
--

INSERT INTO `bed_history` (`bed_history_id`, `description`, `history_event`, `bed_id`, `bed_request_id`) VALUES
(1, 'Bed was cleaned and disinfected', 'cleaning', 1, 1),
(2, 'Bed was checked for maintenance issues', 'maintenance', 2, 2),
(3, 'Patient was transferred to another room', 'transfer', 3, 3),
(4, 'Bed was assigned to a new patient', 'assignment', 4, 4),
(5, 'Bed was decommissioned', 'decommission', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `bed_request`
--

CREATE TABLE `bed_request` (
  `bed_request_id` int(11) NOT NULL,
  `request_date` datetime DEFAULT NULL,
  `allocated_date` datetime DEFAULT NULL,
  `estimated_period` int(11) DEFAULT NULL,
  `expected_discharge_date` datetime DEFAULT NULL,
  `actual_discharge_date` datetime DEFAULT NULL,
  `period_unit` varchar(255) DEFAULT NULL,
  `request_status` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `bed_id` int(11) DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bed_request`
--

INSERT INTO `bed_request` (`bed_request_id`, `request_date`, `allocated_date`, `estimated_period`, `expected_discharge_date`, `actual_discharge_date`, `period_unit`, `request_status`, `priority`, `department_id`, `bed_id`, `hospital_id`) VALUES
(1, '2022-12-25 06:00:00', NULL, 7, '2022-12-28 07:00:00', NULL, 'days', 'pending', 'high', 1, 1, 1),
(2, '2022-12-25 00:00:00', '2022-12-25 01:00:00', 7, '2022-12-25 00:00:00', '2021-01-08 00:00:00', 'days', 'approved', 'low', 2, 2, 3),
(3, '2022-12-26 04:00:00', NULL, 8, '2022-12-27 06:30:00', NULL, 'days', 'pending', 'low', 3, 3, 1),
(4, '2022-12-27 11:00:00', NULL, 7, '2022-12-30 10:00:00', NULL, 'days', 'pending', 'emergency', 4, 4, 2),
(5, '2022-12-26 03:00:00', '2022-12-26 04:00:00', 7, '2022-12-27 05:00:00', '2022-12-27 04:00:00', 'days', 'approved', 'high', 5, 5, 5),
(6, '2022-12-24 00:00:00', '2022-12-24 04:00:00', 7, '2022-12-25 00:00:00', '2022-12-25 00:00:00', 'days', 'approved', 'high', 4, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `configuration` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`configuration`)),
  `hospital_id` int(11) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `name`, `description`, `contact`, `configuration`, `hospital_id`, `logo`) VALUES
(1, 'Cardiology', 'Department for heart diseases', '123-456-7890', '{\"room_count\":5,\"doctor_count\":7}', 1, 'cardiology_logo.png'),
(2, 'Orthopedics', 'Department for bone and joint conditions', '123-456-7891', '{\"room_count\":4,\"doctor_count\":6}', 1, 'orthopedics_logo.png'),
(3, 'Pediatrics', 'Department for children\'s health', '123-456-7892', '{\"room_count\":3,\"doctor_count\":5}', 1, 'pediatrics_logo.png'),
(4, 'Neurology', 'Department for brain and nervous system conditions', '123-456-7893', '{\"room_count\":2,\"doctor_count\":4}', 1, 'neurology_logo.png'),
(5, 'Dermatology', 'Department for skin conditions', '123-456-7894', '{\"room_count\":1,\"doctor_count\":3}', 1, 'dermatology_logo.png');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `hospital_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `number_of_rooms` int(11) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`hospital_id`, `name`, `address`, `contact`, `number_of_rooms`, `logo`) VALUES
(1, 'General Hospital', '123 Main Street', '123-456-7890', 100, 'general_hospital_logo.png'),
(2, 'Children\'s Hospital', '456 Second Street', '123-456-7891', 75, 'childrens_hospital_logo.png'),
(3, 'Women\'s Hospital', '789 Third Street', '123-456-7892', 50, 'womens_hospital_logo.png'),
(4, 'Specialty Hospital', '246 Fourth Street', '123-456-7893', 25, 'specialty_hospital_logo.png'),
(5, 'Community Hospital', '369 Fifth Street', '123-456-7894', 10, 'community_hospital_logo.png');

-- --------------------------------------------------------

--
-- Table structure for table `management`
--

CREATE TABLE `management` (
  `management_id` varchar(255) NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `activated` tinyint(1) DEFAULT NULL,
  `lang_key` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `management`
--

INSERT INTO `management` (`management_id`, `login`, `first_name`, `last_name`, `email`, `image_url`, `activated`, `lang_key`, `created_by`, `created_date`, `last_modified_by`, `last_modified_date`) VALUES
('1', 'admin', 'John', 'Doe', 'johndoe@gmail.com', 'image1.jpg', 1, 'en', 'system', '2022-12-25 01:24:55', 'system', '2022-12-25 01:24:55'),
('2', 'manager', 'Jane', 'Doe', 'janedoe@gmail.com', 'image2.jpg', 1, 'en', 'system', '2022-12-25 01:24:55', 'system', '2022-12-25 01:24:55'),
('3', 'supervisor', 'Bob', 'Doe', 'bobdoe@gmail.com', 'image3.jpg', 1, 'en', 'system', '2022-12-25 01:24:55', 'system', '2022-12-25 01:24:55'),
('4', 'assistant', 'Alice', 'Doe', 'alicedoe@gmail.com', 'image4.jpg', 1, 'en', 'system', '2022-12-25 01:24:55', 'system', '2022-12-25 01:24:55'),
('5', 'coordinator', 'Harry', 'Doe', 'harrydoe@gmail.com', 'image5.jpg', 1, 'en', 'system', '2022-12-25 01:24:55', 'system', '2022-12-25 01:24:55');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `admitted_date` datetime DEFAULT NULL,
  `bed_request_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_id`, `name`, `contact`, `address`, `identifier`, `age`, `admitted_date`, `bed_request_id`) VALUES
(1, 'John Smith', '123-456-7890', '123 Main Street', '12345', 35, '2022-12-25 01:26:25', 1),
(2, 'Jane Smith', '234-567-8901', '456 Main Street', '23456', 40, '2022-12-25 01:26:25', 2),
(3, 'Bob Smith', '345-678-9012', '789 Main Street', '34567', 45, '2022-12-25 01:26:25', 3),
(4, 'Alice Smith', '456-789-0123', '159 Main Street', '45678', 50, '2022-12-25 01:26:25', 4),
(5, 'Harry Smith', '567-890-1234', '753 Main Street', '56789', 55, '2022-12-25 01:26:25', 5);

-- --------------------------------------------------------

--
-- Table structure for table `patient_vitals`
--

CREATE TABLE `patient_vitals` (
  `patient_vitals_id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `heart_rate` int(11) DEFAULT NULL,
  `spo_2_level` int(11) DEFAULT NULL,
  `blood_pressure` int(11) DEFAULT NULL,
  `temperature` int(11) DEFAULT NULL,
  `data_source` varchar(255) DEFAULT NULL,
  `additional_data` varchar(255) DEFAULT NULL,
  `record_time` datetime DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `bed_request_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_vitals`
--

INSERT INTO `patient_vitals` (`patient_vitals_id`, `type`, `description`, `heart_rate`, `spo_2_level`, `blood_pressure`, `temperature`, `data_source`, `additional_data`, `record_time`, `patient_id`, `bed_request_id`) VALUES
(1, 'Regular Checkup', 'Regular vitals check for patient', 80, 95, 2, 99, 'Manual', 'N/A', '2020-08-01 10:00:00', 1, 1),
(2, 'Regular Checkup', 'Regular vitals check for patient', 75, 97, 2, 98, 'Manual', 'N/A', '2020-08-02 11:00:00', 2, 2),
(3, 'Regular Checkup', 'Regular vitals check for patient', 72, 96, 2, 98, 'Manual', 'N/A', '2020-08-03 12:00:00', 3, 3),
(4, 'Regular Checkup', 'Regular vitals check for patient', 70, 98, 2, 98, 'Manual', 'N/A', '2020-08-04 13:00:00', 4, 4),
(5, 'Regular Checkup', 'Regular vitals check for patient', 78, 99, 2, 99, 'Manual', 'N/A', '2020-08-05 14:00:00', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `rel_management_department`
--

CREATE TABLE `rel_management_department` (
  `management_id` varchar(255) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rel_management_department`
--

INSERT INTO `rel_management_department` (`management_id`, `department_id`) VALUES
('MGR1', 1),
('MGR2', 2),
('MGR3', 3),
('MGR4', 4),
('MGR5', 5);

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

CREATE TABLE `resource` (
  `resource_id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resource`
--

INSERT INTO `resource` (`resource_id`, `type`, `name`, `identifier`, `description`, `hospital_id`) VALUES
(1, 'equipment', 'Ventilator', 'EQ-001', 'Mechanical ventilation device', 1),
(2, 'medication', 'Paracetamol', 'MD-001', 'Pain and fever reliever', 1),
(3, 'supply', 'Masks', 'SP-001', 'Protective face masks', 1),
(4, 'equipment', 'ECG machine', 'EQ-002', 'Electrocardiography device', 1),
(5, 'medication', 'Insulin', 'MD-002', 'Hormone for diabetes management', 1);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `floor` int(11) DEFAULT NULL,
  `location_type` varchar(255) DEFAULT NULL,
  `space` varchar(255) DEFAULT NULL,
  `max_number_of_beds` int(11) DEFAULT NULL,
  `is_wash_room_available` tinyint(1) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `last_maintenance_date` datetime DEFAULT NULL,
  `next_maintenance_date` datetime DEFAULT NULL,
  `room_condition` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `service_available` varchar(255) DEFAULT NULL,
  `layout` varchar(255) DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_id`, `name`, `description`, `floor`, `location_type`, `space`, `max_number_of_beds`, `is_wash_room_available`, `status`, `last_maintenance_date`, `next_maintenance_date`, `room_condition`, `type`, `service_available`, `layout`, `hospital_id`) VALUES
(1, 'Room 1', 'Standard patient room', 1, 'inpatient', '200 sq ft', 2, 1, 'available', '2021-01-01 00:00:00', '2021-06-01 00:00:00', 'good', 'private', 'IV, oxygen', 'standard', 1),
(2, 'Room 2', 'Standard patient room', 1, 'inpatient', '200 sq ft', 5, 1, 'available', '2021-02-01 00:00:00', '2021-07-01 00:00:00', 'good', 'private', 'IV, oxygen', 'standard', 1),
(3, 'Room 3', 'Standard patient room', 1, 'inpatient', '200 sq ft', 2, 1, 'available', '2021-03-01 00:00:00', '2021-08-01 00:00:00', 'good', 'private', 'IV, oxygen', 'standard', 1),
(4, 'Room 4', 'Standard patient room', 1, 'inpatient', '200 sq ft', 3, 1, 'available', '2021-04-01 00:00:00', '2021-09-01 00:00:00', 'good', 'private', 'IV, oxygen', 'standard', 1),
(5, 'Room 5', 'Standard patient room', 1, 'inpatient', '200 sq ft', 2, 1, 'available', '2021-05-01 00:00:00', '2021-10-01 00:00:00', 'good', 'private', 'IV, oxygen', 'standard', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bed`
--
ALTER TABLE `bed`
  ADD PRIMARY KEY (`bed_id`);

--
-- Indexes for table `bed_history`
--
ALTER TABLE `bed_history`
  ADD PRIMARY KEY (`bed_history_id`);

--
-- Indexes for table `bed_request`
--
ALTER TABLE `bed_request`
  ADD PRIMARY KEY (`bed_request_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`hospital_id`);

--
-- Indexes for table `management`
--
ALTER TABLE `management`
  ADD PRIMARY KEY (`management_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `patient_vitals`
--
ALTER TABLE `patient_vitals`
  ADD PRIMARY KEY (`patient_vitals_id`);

--
-- Indexes for table `rel_management_department`
--
ALTER TABLE `rel_management_department`
  ADD PRIMARY KEY (`management_id`,`department_id`);

--
-- Indexes for table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`resource_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
