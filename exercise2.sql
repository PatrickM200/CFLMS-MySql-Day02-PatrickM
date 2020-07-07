-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 07. Jul 2020 um 15:49
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `exercise2`
--
CREATE DATABASE IF NOT EXISTS `exercise2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `exercise2`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `doctore`
--

CREATE TABLE `doctore` (
  `code` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `speciallity` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `interv`
--

CREATE TABLE `interv` (
  `interv_id` varchar(55) NOT NULL,
  `treatment` varchar(55) DEFAULT NULL,
  `sympt` varchar(55) DEFAULT NULL,
  `fk_unit_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `patient`
--

CREATE TABLE `patient` (
  `svn` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `arr_date` int(11) DEFAULT NULL,
  `age` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `unit`
--

CREATE TABLE `unit` (
  `unit_name` varchar(55) DEFAULT NULL,
  `unit_id` int(11) NOT NULL,
  `room_number` tinyint(4) DEFAULT NULL,
  `fk_code` int(11) DEFAULT NULL,
  `fk_svn` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `doctore`
--
ALTER TABLE `doctore`
  ADD PRIMARY KEY (`code`);

--
-- Indizes für die Tabelle `interv`
--
ALTER TABLE `interv`
  ADD PRIMARY KEY (`interv_id`),
  ADD KEY `fk_unit_id` (`fk_unit_id`);

--
-- Indizes für die Tabelle `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`svn`);

--
-- Indizes für die Tabelle `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`unit_id`),
  ADD KEY `fk_code` (`fk_code`),
  ADD KEY `fk_svn` (`fk_svn`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `interv`
--
ALTER TABLE `interv`
  ADD CONSTRAINT `interv_ibfk_1` FOREIGN KEY (`fk_unit_id`) REFERENCES `unit` (`unit_id`);

--
-- Constraints der Tabelle `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `unit_ibfk_1` FOREIGN KEY (`fk_code`) REFERENCES `doctore` (`code`),
  ADD CONSTRAINT `unit_ibfk_2` FOREIGN KEY (`fk_svn`) REFERENCES `patient` (`svn`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
