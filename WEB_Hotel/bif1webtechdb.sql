-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 15. Jan 2023 um 23:58
-- Server-Version: 10.4.25-MariaDB
-- PHP-Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `bif1webtechdb`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `num_persons` int(11) NOT NULL,
  `arrival_date` date NOT NULL,
  `depature_date` date NOT NULL,
  `parking` tinyint(1) NOT NULL,
  `breakfast` tinyint(1) NOT NULL,
  `fk_room_id` int(11) NOT NULL,
  `fk_user_id` int(11) NOT NULL,
  `fk_booking_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `bookings`
--

INSERT INTO `bookings` (`booking_id`, `num_persons`, `arrival_date`, `depature_date`, `parking`, `breakfast`, `fk_room_id`, `fk_user_id`, `fk_booking_status`) VALUES
(1, 2, '2023-01-13', '2023-01-20', 1, 1, 1, 12, 2),
(2, 2, '2023-01-16', '2023-01-23', 1, 1, 3, 12, 1),
(4, 1, '2023-02-01', '2023-02-03', 0, 0, 4, 12, 3),
(5, 2, '2023-01-30', '2023-01-31', 0, 0, 4, 18, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `booking_status`
--

CREATE TABLE `booking_status` (
  `status_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `booking_status`
--

INSERT INTO `booking_status` (`status_id`, `name`) VALUES
(1, 'Neu'),
(2, 'Bestätigt'),
(3, 'Storniert');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `images`
--

CREATE TABLE `images` (
  `image_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `images`
--

INSERT INTO `images` (`image_id`, `path`, `name`) VALUES
(15, '/webtech/uploads/news/hotel01.jpg', 'hotel01.jpg'),
(16, '/webtech/uploads/news/hotel02.jpg', 'hotel02.jpg');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `link_rooms_images`
--

CREATE TABLE `link_rooms_images` (
  `image_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `text` varchar(5000) NOT NULL,
  `timestamp` datetime NOT NULL,
  `fk_image_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `news`
--

INSERT INTO `news` (`news_id`, `title`, `text`, `timestamp`, `fk_image_id`) VALUES
(13, 'Nachricht #1', 'Text', '2023-01-15 23:52:55', 15),
(14, 'Nachricht #2', 'Hallo Welt!', '2023-01-15 23:53:14', 16);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `profiles`
--

CREATE TABLE `profiles` (
  `profil_id` int(11) NOT NULL,
  `anrede` char(1) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fk_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `profiles`
--

INSERT INTO `profiles` (`profil_id`, `anrede`, `first_name`, `last_name`, `email`, `fk_user_id`) VALUES
(4, 'M', 'abcabc', 'abcabc', 'admin@mail.com', 11),
(5, 'F', 'Maria', 'Muster', 'user@mail.at', 12),
(6, 'M', 'Max', 'Muster', 'user2@mail.com', 13),
(10, 'M', 'Abc', 'abc', 'user3@mail.com', 18),
(11, 'M', 'vorname', 'nachname', 'admin2@mail.com', 19),
(12, 'M', 'vorname', 'nachname', 'user4@mail.com', 20);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `roles`
--

INSERT INTO `roles` (`role_id`, `name`) VALUES
(1, 'admin'),
(2, 'guest');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `num_beds` int(11) NOT NULL,
  `pets_allowed` tinyint(1) NOT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `rooms`
--

INSERT INTO `rooms` (`room_id`, `number`, `num_beds`, `pets_allowed`, `description`) VALUES
(1, 101, 2, 1, 'Beschreibung von Zimmer 101'),
(3, 301, 6, 1, 'Beschreibung von Zimmer 301'),
(4, 201, 3, 0, 'Beschreibung von Zimmer 201'),
(5, 402, 4, 1, ''),
(6, 401, 4, 1, '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_status` tinyint(1) NOT NULL,
  `fk_role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_password`, `user_status`, `fk_role_id`) VALUES
(11, 'admin', '$2y$04$ON2xc/6EM/a8yNTKyKFgKObzWHw9xxUF.7ayxK2v29Aa/nq6lU29y', 1, 1),
(12, 'user', '$2y$04$kCdqBPEDSwHemZUVs8Vm0.mviLNBmu79oF3.D3SMnlwV3taX2Ih72', 1, 2),
(13, 'user2', '$2y$04$KpTrL09q2JZ8EkwyC6KlXuqp5OJHn1GsDqFDci8iR4gszZClKC5re', 0, 2),
(18, 'user3', '$2y$04$PZ7PMlAQifLNBRJzF.gP5uAOrlxwp9RRc2.gWkTIR5iqkXHmnwqn6', 1, 2),
(19, 'admin2', '$2y$04$MNDycA.7kr5QodSo7KrdpeXn3MEm37sWx4nZKWlq5USfdsJvsnPSq', 1, 1),
(20, 'user4', '$2y$04$ORmoOGpyFuBwQD337QNht.F0tw0lOgVvyekcpE03z7fgEZqWpD6le', 1, 2);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `fk_booking_status` (`fk_booking_status`),
  ADD KEY `fk_room_id` (`fk_room_id`),
  ADD KEY `fk_user_id` (`fk_user_id`);

--
-- Indizes für die Tabelle `booking_status`
--
ALTER TABLE `booking_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indizes für die Tabelle `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`);

--
-- Indizes für die Tabelle `link_rooms_images`
--
ALTER TABLE `link_rooms_images`
  ADD KEY `image_id` (`image_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indizes für die Tabelle `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`),
  ADD KEY `fk_image_id` (`fk_image_id`);

--
-- Indizes für die Tabelle `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`profil_id`),
  ADD KEY `fk_user_id` (`fk_user_id`);

--
-- Indizes für die Tabelle `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indizes für die Tabelle `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD KEY `fk_role_id` (`fk_role_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `booking_status`
--
ALTER TABLE `booking_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT für Tabelle `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT für Tabelle `profiles`
--
ALTER TABLE `profiles`
  MODIFY `profil_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`fk_booking_status`) REFERENCES `booking_status` (`status_id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`fk_room_id`) REFERENCES `rooms` (`room_id`),
  ADD CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints der Tabelle `link_rooms_images`
--
ALTER TABLE `link_rooms_images`
  ADD CONSTRAINT `link_rooms_images_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `images` (`image_id`),
  ADD CONSTRAINT `link_rooms_images_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`);

--
-- Constraints der Tabelle `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`fk_image_id`) REFERENCES `images` (`image_id`);

--
-- Constraints der Tabelle `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints der Tabelle `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`fk_role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
