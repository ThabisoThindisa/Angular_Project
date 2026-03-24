-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2026 at 03:36 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fostercarehomes`
--

-- --------------------------------------------------------

--
-- Table structure for table `caregiver`
--

CREATE TABLE `caregiver` (
  `caregivers_ID` int(11) NOT NULL,
  `caregivers_Name` varchar(255) DEFAULT NULL,
  `caregivers_Surname` varchar(255) DEFAULT NULL,
  `caregivers_phone` varchar(255) DEFAULT NULL,
  `caregivers_email` varchar(255) DEFAULT NULL,
  `caregivers_password` varchar(255) DEFAULT NULL,
  `caregivers_address` varchar(255) DEFAULT NULL,
  `caregivers_status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Information about foster caregivers';

-- --------------------------------------------------------

--
-- Table structure for table `child`
--

CREATE TABLE `child` (
  `child_id` int(11) NOT NULL,
  `child_Name` varchar(100) NOT NULL,
  `Child_Surname` varchar(100) NOT NULL,
  `Child_DOBirth` date NOT NULL,
  `Child_MedicalRecord` varchar(255) NOT NULL,
  `Child_Gender` varchar(255) NOT NULL,
  `Child_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Children in the Foster Home';

-- --------------------------------------------------------

--
-- Table structure for table `fosterhome`
--

CREATE TABLE `fosterhome` (
  `Home_ID` int(11) NOT NULL,
  `FH_name` int(11) NOT NULL,
  `FH_location` varchar(255) NOT NULL,
  `FH_activeHours` varchar(255) NOT NULL,
  `FH_start_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Foster home information';

-- --------------------------------------------------------

--
-- Table structure for table `governappointment`
--

CREATE TABLE `governappointment` (
  `GP_ID` int(11) NOT NULL,
  `SW_ID` int(11) NOT NULL,
  `Home_ID` int(11) NOT NULL,
  `Appointed_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='The date the social woker was allocated';

-- --------------------------------------------------------

--
-- Table structure for table `medicalrecord`
--

CREATE TABLE `medicalrecord` (
  `MR_ID` int(11) NOT NULL,
  `child_id` int(11) NOT NULL,
  `MR_treatment` varchar(255) NOT NULL,
  `MR_diagnosis` varchar(255) NOT NULL,
  `MR_record_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Child medial history';

-- --------------------------------------------------------

--
-- Table structure for table `socialworker`
--

CREATE TABLE `socialworker` (
  `SW_ID` int(11) NOT NULL,
  `SW_name` varchar(119) NOT NULL,
  `SW_Surname` varchar(119) NOT NULL,
  `SW_location` varchar(119) NOT NULL,
  `SW_email` varchar(119) NOT NULL,
  `SW_number` varchar(119) NOT NULL,
  `SW_Years_experiece` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='the government appointed social worker';

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `User_ID` int(11) NOT NULL,
  `User_Name` varchar(100) NOT NULL,
  `User_Surname` varchar(110) NOT NULL,
  `User_DOBirth` date NOT NULL,
  `User_number` varchar(110) NOT NULL,
  `User_Email` int(180) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='The user information';

-- --------------------------------------------------------

--
-- Table structure for table `visitsapointment`
--

CREATE TABLE `visitsapointment` (
  `Appoint_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Home_ID` int(11) NOT NULL,
  `Appointment_Date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Appoint visits of the users';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `caregiver`
--
ALTER TABLE `caregiver`
  ADD PRIMARY KEY (`caregivers_ID`);

--
-- Indexes for table `child`
--
ALTER TABLE `child`
  ADD PRIMARY KEY (`child_id`);

--
-- Indexes for table `fosterhome`
--
ALTER TABLE `fosterhome`
  ADD PRIMARY KEY (`Home_ID`);

--
-- Indexes for table `governappointment`
--
ALTER TABLE `governappointment`
  ADD PRIMARY KEY (`GP_ID`),
  ADD KEY `SW_ID` (`SW_ID`);

--
-- Indexes for table `medicalrecord`
--
ALTER TABLE `medicalrecord`
  ADD PRIMARY KEY (`MR_ID`),
  ADD KEY `child_id` (`child_id`);

--
-- Indexes for table `socialworker`
--
ALTER TABLE `socialworker`
  ADD PRIMARY KEY (`SW_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_ID`);

--
-- Indexes for table `visitsapointment`
--
ALTER TABLE `visitsapointment`
  ADD PRIMARY KEY (`Appoint_ID`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `Home_ID` (`Home_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `governappointment`
--
ALTER TABLE `governappointment`
  ADD CONSTRAINT `SW_ID` FOREIGN KEY (`SW_ID`) REFERENCES `socialworker` (`SW_ID`);

--
-- Constraints for table `visitsapointment`
--
ALTER TABLE `visitsapointment`
  ADD CONSTRAINT `Home_ID` FOREIGN KEY (`Home_ID`) REFERENCES `fosterhome` (`Home_ID`),
  ADD CONSTRAINT `User_ID` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
