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
-- Datenbank: `exercise4`
--
CREATE DATABASE IF NOT EXISTS `exercise4` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `exercise4`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bus`
--

CREATE TABLE `bus` (
  `bus_id` int(11) NOT NULL,
  `modell` varchar(55) DEFAULT NULL,
  `seats` tinyint(4) DEFAULT NULL,
  `fk_driver_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `destination`
--

CREATE TABLE `destination` (
  `destination_id` int(11) NOT NULL,
  `destin_name` varchar(50) DEFAULT NULL,
  `city_name` varchar(50) DEFAULT NULL,
  `telefon` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `route`
--

CREATE TABLE `route` (
  `route_id` int(11) NOT NULL,
  `route_code` int(11) DEFAULT NULL,
  `kilometers` int(11) DEFAULT NULL,
  `route_start` varchar(55) DEFAULT NULL,
  `route_end` varchar(55) DEFAULT NULL,
  `order_number` int(11) DEFAULT NULL,
  `fk_bus_id` int(11) DEFAULT NULL,
  `fk_destination_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`bus_id`),
  ADD KEY `fk_driver_id` (`fk_driver_id`);

--
-- Indizes für die Tabelle `destination`
--
ALTER TABLE `destination`
  ADD PRIMARY KEY (`destination_id`);

--
-- Indizes für die Tabelle `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indizes für die Tabelle `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `fk_bus_id` (`fk_bus_id`),
  ADD KEY `fk_destination_id` (`fk_destination_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `bus`
--
ALTER TABLE `bus`
  MODIFY `bus_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `destination`
--
ALTER TABLE `destination`
  MODIFY `destination_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `route`
--
ALTER TABLE `route`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `bus`
--
ALTER TABLE `bus`
  ADD CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`fk_driver_id`) REFERENCES `driver` (`driver_id`);

--
-- Constraints der Tabelle `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `route_ibfk_1` FOREIGN KEY (`fk_bus_id`) REFERENCES `bus` (`bus_id`),
  ADD CONSTRAINT `route_ibfk_2` FOREIGN KEY (`fk_bus_id`) REFERENCES `bus` (`bus_id`),
  ADD CONSTRAINT `route_ibfk_3` FOREIGN KEY (`fk_destination_id`) REFERENCES `destination` (`destination_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
