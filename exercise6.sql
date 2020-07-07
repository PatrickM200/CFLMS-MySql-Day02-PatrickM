-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 07. Jul 2020 um 15:50
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
-- Datenbank: `exercise6`
--
CREATE DATABASE IF NOT EXISTS `exercise6` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `exercise6`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `airplane`
--

CREATE TABLE `airplane` (
  `airplain_id` int(11) NOT NULL,
  `modell` varchar(50) DEFAULT NULL,
  `producer` varchar(50) DEFAULT NULL,
  `capazity` int(11) DEFAULT NULL,
  `flyrange` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `destination`
--

CREATE TABLE `destination` (
  `destination_id` int(11) NOT NULL,
  `city` varchar(55) DEFAULT NULL,
  `country` varchar(55) DEFAULT NULL,
  `destination_name` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `flight`
--

CREATE TABLE `flight` (
  `flight_id` int(11) NOT NULL,
  `startpoint` varchar(50) DEFAULT NULL,
  `arrival` varchar(50) DEFAULT NULL,
  `fk_airplain_id` int(11) DEFAULT NULL,
  `fk_flight_date_id` int(11) DEFAULT NULL,
  `fk_destination_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `flight_date`
--

CREATE TABLE `flight_date` (
  `flight_date_id` int(11) NOT NULL,
  `flight_date` date DEFAULT NULL,
  `flight_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `airplane`
--
ALTER TABLE `airplane`
  ADD PRIMARY KEY (`airplain_id`);

--
-- Indizes für die Tabelle `destination`
--
ALTER TABLE `destination`
  ADD PRIMARY KEY (`destination_id`);

--
-- Indizes für die Tabelle `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`flight_id`),
  ADD KEY `fk_destination_id` (`fk_destination_id`),
  ADD KEY `fk_flight_date_id` (`fk_flight_date_id`),
  ADD KEY `fk_airplain_id` (`fk_airplain_id`);

--
-- Indizes für die Tabelle `flight_date`
--
ALTER TABLE `flight_date`
  ADD PRIMARY KEY (`flight_date_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `airplane`
--
ALTER TABLE `airplane`
  MODIFY `airplain_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `destination`
--
ALTER TABLE `destination`
  MODIFY `destination_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `flight`
--
ALTER TABLE `flight`
  MODIFY `flight_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `flight_date`
--
ALTER TABLE `flight_date`
  MODIFY `flight_date_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`fk_destination_id`) REFERENCES `destination` (`destination_id`),
  ADD CONSTRAINT `flight_ibfk_2` FOREIGN KEY (`fk_flight_date_id`) REFERENCES `flight_date` (`flight_date_id`),
  ADD CONSTRAINT `flight_ibfk_3` FOREIGN KEY (`fk_airplain_id`) REFERENCES `airplane` (`airplain_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
