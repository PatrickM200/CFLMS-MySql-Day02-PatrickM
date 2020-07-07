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
-- Datenbank: `exercise5`
--
CREATE DATABASE IF NOT EXISTS `exercise5` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `exercise5`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `a_comment`
--

CREATE TABLE `a_comment` (
  `comment_id` int(11) NOT NULL,
  `comment_text` varchar(2000) DEFAULT NULL,
  `comment_date` date DEFAULT NULL,
  `fk_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `a_user`
--

CREATE TABLE `a_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(55) DEFAULT NULL,
  `user_password` varchar(55) DEFAULT NULL,
  `user_mail` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `commento_foto`
--

CREATE TABLE `commento_foto` (
  `foto_url` varchar(200) NOT NULL,
  `foto_name` varchar(55) DEFAULT NULL,
  `foto_discription` varchar(2000) DEFAULT NULL,
  `fk_marked_user` varchar(50) DEFAULT NULL,
  `fk_comment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `a_comment`
--
ALTER TABLE `a_comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `fk_user_id` (`fk_user_id`);

--
-- Indizes für die Tabelle `a_user`
--
ALTER TABLE `a_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indizes für die Tabelle `commento_foto`
--
ALTER TABLE `commento_foto`
  ADD PRIMARY KEY (`foto_url`),
  ADD KEY `fk_marked_user` (`fk_marked_user`),
  ADD KEY `fk_comment_id` (`fk_comment_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `a_comment`
--
ALTER TABLE `a_comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `a_user`
--
ALTER TABLE `a_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `a_comment`
--
ALTER TABLE `a_comment`
  ADD CONSTRAINT `a_comment_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `a_user` (`user_id`);

--
-- Constraints der Tabelle `commento_foto`
--
ALTER TABLE `commento_foto`
  ADD CONSTRAINT `commento_foto_ibfk_1` FOREIGN KEY (`fk_marked_user`) REFERENCES `foto_marker` (`marked_user`),
  ADD CONSTRAINT `commento_foto_ibfk_2` FOREIGN KEY (`fk_comment_id`) REFERENCES `a_comment` (`comment_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
