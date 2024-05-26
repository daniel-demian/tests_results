-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 16, 2019 at 11:15 PM
-- Server version: 5.7.23
-- PHP Version: 7.0.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_plugin`
--

-- --------------------------------------------------------

--
-- Table structure for table `otestuj_tests`
--

DROP TABLE IF EXISTS `otestuj_tests`;
CREATE TABLE IF NOT EXISTS `otestuj_tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `question_count` int(11) DEFAULT NULL,
  `from_google_spreadsheet_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `otestuj_tests`
--

INSERT INTO `otestuj_tests` (`id`, `name`, `question_count`, `from_google_spreadsheet_id`) VALUES
(8, 'Matematika', 25, '1-eKIMYXIXQV3YUx6WDAm4bvno8Kar_DVawTMc8kEsWQ');
INSERT INTO `otestuj_tests` (`id`, `name`, `question_count`, `from_google_spreadsheet_id`) VALUES
(9, 'Dejepis', 25, '1-eKIMYXIXQV3YUx6WDAm4bvno8Kar_DVawTMc8kEsWW');


-- --------------------------------------------------------

--
-- Table structure for table `otestuj_test_attempt`
--

DROP TABLE IF EXISTS `otestuj_test_attempt`;
CREATE TABLE IF NOT EXISTS `otestuj_test_attempt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `test_start` timestamp NULL DEFAULT NULL,
  `test_end` timestamp NULL DEFAULT NULL,
  `test_result` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `otestuj_test_attempt`
--

INSERT INTO `otestuj_test_attempt` (`id`, `test_id`, `user_id`, `test_start`, `test_end`, `test_result`) VALUES
(20, 8, 1, '2021-11-16 14:10:17', '2021-11-16 15:10:0', 86);
INSERT INTO `otestuj_test_attempt` (`id`, `test_id`, `user_id`, `test_start`, `test_end`, `test_result`) VALUES
(21, 8, 2, '2021-11-16 14:10:17', '2021-11-16 15:10:00', 90);
INSERT INTO `otestuj_test_attempt` (`id`, `test_id`, `user_id`, `test_start`, `test_end`, `test_result`) VALUES
(22, 8, 3, '2021-11-16 14:10:17', '2021-11-16 15:10:00', 67);
INSERT INTO `otestuj_test_attempt` (`id`, `test_id`, `user_id`, `test_start`, `test_end`, `test_result`) VALUES
(23, 8, 4, '2021-11-16 14:10:17', '2021-11-16 15:10:00', 100);


-- --------------------------------------------------------

--
-- Table structure for table `otestuj_test_attempt_question`
--

DROP TABLE IF EXISTS `otestuj_test_attempt_question`;
CREATE TABLE IF NOT EXISTS `otestuj_test_attempt_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attempt_id` int(11) DEFAULT NULL,
  `question_number` int(11) DEFAULT NULL,
  `question_type` varchar(255) DEFAULT NULL,
  `correct_answers` varchar(255) DEFAULT NULL,
  `user_answers` varchar(255) DEFAULT NULL,
  `was_correct` tinyint(1) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `otestuj_test_attempt_question`
--

INSERT INTO `otestuj_test_attempt_question` (`id`, `attempt_id`, `question_number`, `question_type`, `correct_answers`, `user_answers`, `was_correct`, `timestamp`) VALUES
(77, 20, 6, 'multiple_options', 'a;b', 'a;b', 0, NULL),
(76, 20, 7, 'one_correct', 'c', 'c', 0, NULL),
(75, 20, 5, 'one_correct', 'a', 'b', 0, NULL),
(74, 20, 2, 'one_correct', 'b', 'b', 0, NULL),
(73, 20, 1, 'one_correct', 'c', 'c', 0, NULL),
(72, 20, 4, 'one_correct', 'a', 'a', 0, NULL),
(71, 20, 3, 'one_correct', 'd', 'd', 0, NULL),
(84, 21, 6, 'multiple_options', 'c;b', 'a;b', 0, NULL),
(83, 21, 7, 'one_correct', 'a', 'c', 0, NULL),
(82, 21, 5, 'one_correct', 'b', 'b', 0, NULL),
(81, 21, 2, 'one_correct', 'b', 'b', 0, NULL),
(80, 21, 1, 'one_correct', 'c', 'c', 0, NULL),
(79, 21, 4, 'one_correct', 'a', 'a', 0, NULL),
(78, 21, 3, 'one_correct', 'd', 'd', 0, NULL),
(91, 22, 6, 'multiple_options', 'a;c', 'a;b', 0, NULL),
(90, 22, 7, 'one_correct', 'c', 'c', 0, NULL),
(89, 22, 5, 'one_correct', 'a', 'b', 0, NULL),
(88, 22, 2, 'one_correct', 'b', 'b', 0, NULL),
(87, 22, 1, 'one_correct', 'c', 'c', 0, NULL),
(86, 22, 4, 'one_correct', 'a', 'a', 0, NULL),
(85, 22, 3, 'one_correct', 'd', 'd', 0, NULL),
(98, 23, 6, 'multiple_options', 'c;b', 'a;b', 0, NULL),
(97, 23, 7, 'one_correct', 'a', 'c', 0, NULL),
(96, 23, 5, 'one_correct', 'a', 'b', 0, NULL),
(95, 23, 2, 'one_correct', 'b', 'b', 0, NULL),
(94, 23, 1, 'one_correct', 'c', 'c', 0, NULL),
(93, 23, 4, 'one_correct', 'a', 'a', 0, NULL),
(92, 23, 3, 'one_correct', 'c', 'd', 0, NULL);
COMMIT;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
