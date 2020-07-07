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
-- Datenbank: `exercise3`
--
CREATE DATABASE IF NOT EXISTS `exercise3` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `exercise3`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `auction`
--

CREATE TABLE `auction` (
  `auction_id` int(11) NOT NULL,
  `current_set_price` int(11) DEFAULT NULL,
  `fk_set_id` int(11) DEFAULT NULL,
  `fk_bid_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bid`
--

CREATE TABLE `bid` (
  `bid_id` int(11) NOT NULL,
  `bid_value` int(11) DEFAULT NULL,
  `bid_time` time DEFAULT NULL,
  `fk_buyer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `buyer`
--

CREATE TABLE `buyer` (
  `buyer_id` int(11) NOT NULL,
  `buyer_name` varchar(50) DEFAULT NULL,
  `buyer_mail` varchar(50) DEFAULT NULL,
  `buyer_password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `final_auction`
--

CREATE TABLE `final_auction` (
  `final_auction_id` int(11) NOT NULL,
  `highest_bid` int(11) DEFAULT NULL,
  `latest_bid` int(11) DEFAULT NULL,
  `final_buyer` varchar(50) DEFAULT NULL,
  `fk_full_set_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `full_set`
--

CREATE TABLE `full_set` (
  `full_set_id` int(11) NOT NULL,
  `remaining_time` time DEFAULT NULL,
  `buyers_left` int(11) DEFAULT NULL,
  `fk_auction_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `item`
--

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(50) DEFAULT NULL,
  `item_discription` varchar(50) DEFAULT NULL,
  `item_min_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `set_price`
--

CREATE TABLE `set_price` (
  `set_id` int(11) NOT NULL,
  `set_price` int(11) DEFAULT NULL,
  `fk_item_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `auction`
--
ALTER TABLE `auction`
  ADD PRIMARY KEY (`auction_id`),
  ADD KEY `fk_set_id` (`fk_set_id`),
  ADD KEY `fk_bid_id` (`fk_bid_id`);

--
-- Indizes für die Tabelle `bid`
--
ALTER TABLE `bid`
  ADD PRIMARY KEY (`bid_id`),
  ADD KEY `fk_buyer_id` (`fk_buyer_id`);

--
-- Indizes für die Tabelle `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`buyer_id`);

--
-- Indizes für die Tabelle `final_auction`
--
ALTER TABLE `final_auction`
  ADD PRIMARY KEY (`final_auction_id`),
  ADD KEY `fk_full_set_id` (`fk_full_set_id`);

--
-- Indizes für die Tabelle `full_set`
--
ALTER TABLE `full_set`
  ADD PRIMARY KEY (`full_set_id`),
  ADD KEY `fk_auction_id` (`fk_auction_id`);

--
-- Indizes für die Tabelle `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`);

--
-- Indizes für die Tabelle `set_price`
--
ALTER TABLE `set_price`
  ADD PRIMARY KEY (`set_id`),
  ADD KEY `fk_item_id` (`fk_item_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `auction`
--
ALTER TABLE `auction`
  ADD CONSTRAINT `auction_ibfk_1` FOREIGN KEY (`fk_set_id`) REFERENCES `set_price` (`set_id`),
  ADD CONSTRAINT `auction_ibfk_2` FOREIGN KEY (`fk_bid_id`) REFERENCES `bid` (`bid_id`);

--
-- Constraints der Tabelle `bid`
--
ALTER TABLE `bid`
  ADD CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`fk_buyer_id`) REFERENCES `buyer` (`buyer_id`);

--
-- Constraints der Tabelle `final_auction`
--
ALTER TABLE `final_auction`
  ADD CONSTRAINT `final_auction_ibfk_1` FOREIGN KEY (`fk_full_set_id`) REFERENCES `full_set` (`full_set_id`);

--
-- Constraints der Tabelle `full_set`
--
ALTER TABLE `full_set`
  ADD CONSTRAINT `full_set_ibfk_1` FOREIGN KEY (`fk_auction_id`) REFERENCES `auction` (`auction_id`);

--
-- Constraints der Tabelle `set_price`
--
ALTER TABLE `set_price`
  ADD CONSTRAINT `set_price_ibfk_1` FOREIGN KEY (`fk_item_id`) REFERENCES `item` (`item_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
