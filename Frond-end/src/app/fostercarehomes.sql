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

-- --------------------------------------------------------
-- Table structure for table `caregiver`

CREATE TABLE caregiver (
  caregivers_ID int(11) NOT NULL auto_increment PRIMARY KEY,
  caregivers_Name varchar(255) DEFAULT NULL,
  caregivers_Surname varchar(255) DEFAULT NULL,
  caregivers_phone varchar(255) DEFAULT NULL,
  caregivers_email varchar(255) DEFAULT NULL,
  caregivers_password varchar(255) DEFAULT NULL,
  caregivers_address varchar(255) DEFAULT NULL,
  caregivers_status varchar(255) DEFAULT NULL
); 
-- --------------------------------------------------------
-- Table structure for table `child`

CREATE TABLE child (
  child_id int(11) NOT NULL auto_increment PRIMARY KEY,
  child_Name varchar(100) NOT NULL,
  Child_Surname varchar(100) NOT NULL,
  Child_DOBirth date NOT NULL,
  Child_MedicalRecord varchar(255) NOT NULL,
  Child_Gender varchar(255) NOT NULL,
  Child_status varchar(100) NOT NULL);
-- --------------------------------------------------------

-- Table structure for table `fosterhome`

CREATE TABLE fosterhome (
  Home_ID int(11) NOT NULL auto_increment PRIMARY KEY,
  FH_name int(11) NOT NULL,
  FH_location varchar(255) NOT NULL,
  FH_activeHours varchar(255) NOT NULL,
  FH_start_date date NOT NULL,
  child_id int(11) NOT NULL,
  caregivers_ID int(11) NOT NULL,
  FOREIGN KEY (child_id) REFERENCES child(child_id),
  FOREIGN KEY (caregivers_ID) REFERENCES caregiver(caregivers_ID)
  
); 
-- --------------------------------------------------------

-- Table structure for table `governappointment`

CREATE TABLE governappointment (
  GP_ID int(11) NOT NULL auto_increment PRIMARY KEY,
  SW_ID int(11) NOT NULL ,
  Home_ID int(11) NOT NULL,
  Appointed_Date date NOT NULL,
  FOREIGN KEY (SW_ID) REFERENCES socialworker(SW_ID),
  FOREIGN KEY (Home_ID) REFERENCES fosterhome(Home_ID)
); 
-- --------------------------------------------------------
-- Table structure for table `medicalrecord`

CREATE TABLE medicalrecord (
  MR_ID int(11) NOT NULL auto_increment PRIMARY KEY,
  child_id int(11) NOT NULL,
  MR_treatment varchar(255) NOT NULL,
  MR_diagnosis varchar(255) NOT NULL,
  MR_record_date date NOT NULL,
  FOREIGN KEY (child_id) REFERENCES child(child_id),
  
); 
-- --------------------------------------------------------
--
-- Table structure for table `socialworker`
--

CREATE TABLE socialworker (
  SW_ID int(11) NOT NULL auto_increment PRIMARY KEY,
  SW_name varchar(119) NOT NULL,
  SW_Surname varchar(119) NOT NULL,
  SW_location varchar(119) NOT NULL,
  SW_email varchar(119) NOT NULL,
  SW_number varchar(119) NOT NULL,
  SW_Years_experiece int(11) NOT NULL,
  SW_password varchar(255) NOT NULL
); 
-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE users (
  User_ID int(11) NOT NULL auto_increment PRIMARY KEY,
  User_Name varchar(100) NOT NULL,
  User_Surname varchar(110) NOT NULL,
  User_DOBirth date NOT NULL,
  User_number varchar(110) NOT NULL,
  User_Email int(180) NOT NULL,
  User_Password varchar(255) NOT NULL
); 
-- --------------------------------------------------------

--
-- Table structure for table `visitsapointment`
--

CREATE TABLE visitsapointment (
  Appoint_ID int(11) NOT NULL auto_increment PRIMARY KEY,
  User_ID int(11) NOT NULL ,
  Home_ID int(11) NOT NULL,
  Appointment_Date datetime NOT NULL,
  FOREIGN KEY (User_ID) REFERENCES users(User_ID),
  FOREIGN KEY (Home_ID) REFERENCES fosterhome(Home_ID)
); 
-