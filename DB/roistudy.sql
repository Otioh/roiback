-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 25, 2023 at 10:08 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `roistudy`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `video` varchar(255) NOT NULL,
  `exercise` text NOT NULL,
  `anchor` varchar(255) NOT NULL,
  `coding_instructions` text NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `syntax` varchar(255) NOT NULL,
  `coding` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `title`, `description`, `video`, `exercise`, `anchor`, `coding_instructions`, `keywords`, `syntax`, `coding`) VALUES
(1, 'Welcome to Roi Study / Setting Up workspace on Github', 'Learn how to start building, shipping, and maintaining software with GitHub. Explore our products, sign up for an account, and connect with the world\'s largest development community. We only set a height value on the .progress, so if you change that value the inner .progress-bar will automatically resize accordingly.\n\nYou can create a personal account, which serves as your identity on GitHub.com, or an organization, which allows multiple personal accounts to collaborate across multiple projects. For more information about account types, see \"Types of GitHub accounts.\"\n\nWhen you create a personal account or organization, you must select a billing plan for the account. For more information, see \"GitHub\'s products.\"', 'http://localhost:8000/watch', '\nExplain the term git and Github', 'Erim Emmanuel', 'Write a terminal code to clone the repository link: https://github.com/Otioh/microskool-web', 'git clone https://github.com/Otioh/microskool-web', 'git clone https://github.com/Otioh/microskool-web', 7),
(2, 'Setup IDE/Development Environment', 'An IDE means Integrated Development Evironment and as the name implies, at the end of this section you should be able to setup all development dependencies and required softwares', 'http://localhost:8000/watch', 'Download and install Visual Studio Code for your Operating System and install the necessary Extensions as explained in the video.\n\nExplain below what an IDE is and mention the IDE you prefer', 'Erim Emmanuel', 'Write a terminal code to open your preferred IDE', '', 'code', 0);

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `programme_id` varchar(255) NOT NULL,
  `performance` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `done` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `certificates`
--

INSERT INTO `certificates` (`id`, `title`, `name`, `date`, `programme_id`, `performance`, `user`, `status`, `done`) VALUES
(1, 'Certificate in Front-End with React JS', 'Erim Emmanuel', 'In View', '1', '', 'bryonerim@gmail.com', 'In View', 2);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `amount` varchar(255) NOT NULL,
  `payer` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `date_initiated` varchar(255) NOT NULL,
  `payment_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `transaction_id`, `description`, `amount`, `payer`, `status`, `date_initiated`, `payment_id`) VALUES
(1, 'T351056405152040', 'Payment for 2 Months Web Development (Front End) Training', '3000', 'bryonerim@gmail.com', 'Approved', 'Wed Jan 25 2023 18:55:49 GMT+0100 (West Africa Standard Time)', 'T191140');

-- --------------------------------------------------------

--
-- Table structure for table `programmes`
--

CREATE TABLE `programmes` (
  `title` text NOT NULL,
  `qualification` varchar(255) NOT NULL,
  `fee` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `courses` varchar(255) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `cordinator` varchar(255) NOT NULL,
  `id` int(11) NOT NULL,
  `activities` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `programmes`
--

INSERT INTO `programmes` (`title`, `qualification`, `fee`, `image`, `description`, `courses`, `duration`, `cordinator`, `id`, `activities`) VALUES
('Front End Web Development with React JS', 'Diploma', '3000', '', 'This is the description we expected first item\'s accordion body. It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions.', 'Web Basics,\nJavaScript Basics,\nAdvance JavaScript,\nReact JS,\nRedux & Redux Toolkit', '2 Months', 'erim', 1, '1,2');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `first_name` text NOT NULL,
  `surname` text NOT NULL,
  `reg_no` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_created` varchar(255) NOT NULL,
  `verify_code` varchar(255) NOT NULL,
  `verified` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `lga` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `programme` varchar(255) NOT NULL,
  `activity` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `first_name`, `surname`, `reg_no`, `email`, `password`, `date_created`, `verify_code`, `verified`, `phone`, `address`, `lga`, `state`, `gender`, `programme`, `activity`) VALUES
(1, 'Emmanuel', 'Erim', 'RS12984', 'bryonerim@gmail.com', 'bryon3662', '25/01/2023', '', 'false', '09060966606', '69 Target Road, Calabar', 'Akamkpa', 'Cross River', 'Male', '1', '1,');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `programmes`
--
ALTER TABLE `programmes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `programmes`
--
ALTER TABLE `programmes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
