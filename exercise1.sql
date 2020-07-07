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
-- Datenbank: `exercise1`
--
CREATE DATABASE IF NOT EXISTS `exercise1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `exercise1`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `author_name` varchar(50) DEFAULT NULL,
  `author_birthday` date DEFAULT NULL,
  `gender` enum('male','female','other') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book`
--

CREATE TABLE `book` (
  `isbn` smallint(6) NOT NULL,
  `book_name` varchar(50) DEFAULT NULL,
  `published_date` date DEFAULT NULL,
  `readed` enum('yes','no') DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `fk_author_id` int(11) DEFAULT NULL,
  `fk_publisher_id` int(11) DEFAULT NULL,
  `fk_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `price`
--

CREATE TABLE `price` (
  `price` int(11) NOT NULL,
  `country` enum('AT','DE') DEFAULT NULL,
  `vat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `publisher`
--

CREATE TABLE `publisher` (
  `publish_date` date DEFAULT NULL,
  `publisher_id` int(11) NOT NULL,
  `publisher_country` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`) USING BTREE;

--
-- Indizes für die Tabelle `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`isbn`),
  ADD KEY `fk_author_id` (`fk_author_id`),
  ADD KEY `fk_price` (`fk_price`),
  ADD KEY `fk_publisher_id` (`fk_publisher_id`);

--
-- Indizes für die Tabelle `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`price`);

--
-- Indizes für die Tabelle `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`fk_author_id`) REFERENCES `author` (`author_id`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`fk_price`) REFERENCES `price` (`price`),
  ADD CONSTRAINT `book_ibfk_3` FOREIGN KEY (`fk_author_id`) REFERENCES `author` (`author_id`),
  ADD CONSTRAINT `book_ibfk_4` FOREIGN KEY (`fk_price`) REFERENCES `price` (`price`),
  ADD CONSTRAINT `book_ibfk_5` FOREIGN KEY (`fk_publisher_id`) REFERENCES `publisher` (`publisher_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
