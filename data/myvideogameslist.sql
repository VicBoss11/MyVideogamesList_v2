-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-02-2020 a las 01:19:07
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

--
-- Base de Datos de MyVideogamesList
--
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `myvideogameslist`
--
CREATE DATABASE IF NOT EXISTS `myvideogameslist` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci;
USE `myvideogameslist`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `developer`
--
-- Creación: 25-02-2020 a las 01:29:55
--

CREATE TABLE `developer` (
  `name` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- RELACIONES PARA LA TABLA `developer`:
--

--
-- Volcado de datos para la tabla `developer`
--

INSERT INTO `developer` (`name`) VALUES
('11 bit studios'),
('AlphaDream'),
('Arkane Studios'),
('Bandai Namco Studios'),
('Bethesda Game Studios'),
('Blizzard Entertainment'),
('Capcom'),
('CD Project RED'),
('Crytek'),
('DICE'),
('Dontnod Entertainment'),
('From Software'),
('Hangar 13'),
('Hazelight Studios'),
('Infinity Ward'),
('Kojima Productions'),
('Level-5'),
('MachineGames'),
('MercurySteam'),
('Monolith Productions'),
('Naughty Dog'),
('Nintendo'),
('Obsidian Entertainment'),
('Omega Force'),
('Platinum Games'),
('Quantic Dream'),
('Ready at Dawn'),
('Rockstar Games'),
('Rocksteady Studios'),
('SCE Japan Studio'),
('SCE Santa Monica Studio'),
('Sora Ltd.'),
('Square'),
('Supermassive Games'),
('Tango Gameworks'),
('Team Ninja'),
('Telltale Games'),
('Treyarch'),
('Ubisoft'),
('Ubisoft Montpellier'),
('WB Games Montreal'),
('Yager Development');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genre`
--
-- Creación: 25-02-2020 a las 01:29:55
--

CREATE TABLE `genre` (
  `name` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- RELACIONES PARA LA TABLA `genre`:
--

--
-- Volcado de datos para la tabla `genre`
--

INSERT INTO `genre` (`name`) VALUES
('acción'),
('aventuras'),
('carreras'),
('deportes'),
('estrategia'),
('FPS'),
('infiltración'),
('lucha'),
('MMO'),
('MOBA'),
('plataformas'),
('puzles'),
('ritmo/música'),
('RPG'),
('RTS'),
('simulador'),
('survival'),
('TPS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platform`
--
-- Creación: 25-02-2020 a las 01:29:55
--

CREATE TABLE `platform` (
  `name` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- RELACIONES PARA LA TABLA `platform`:
--

--
-- Volcado de datos para la tabla `platform`
--

INSERT INTO `platform` (`name`) VALUES
('Nintendo 3DS'),
('PC'),
('PS3'),
('PS4'),
('Switch'),
('Wii U');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publisher`
--
-- Creación: 25-02-2020 a las 01:29:55
--

CREATE TABLE `publisher` (
  `name` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- RELACIONES PARA LA TABLA `publisher`:
--

--
-- Volcado de datos para la tabla `publisher`
--

INSERT INTO `publisher` (`name`) VALUES
('2K Games'),
('Activision'),
('Atari'),
('Bandai Namco Entertainment'),
('Bethesda Softworks'),
('Blizzard Entertainment'),
('Capcom'),
('Deep Silver'),
('Electronic Arts'),
('HBO'),
('Koei Tecmo'),
('Konami'),
('Microsoft Game Studios'),
('Nintendo'),
('Paradox Interactive'),
('Sega'),
('Sony Computer Entertainment'),
('Square Enix'),
('Take-Two Interactive'),
('Ubisoft'),
('Warner Bros. Interactive Entertainment');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videogame`
--
-- Creación: 25-02-2020 a las 01:29:55
--

CREATE TABLE `videogame` (
  `id` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` varchar(75) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `rating` tinyint(4) DEFAULT NULL,
  `image` varchar(500) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'img/videogames/no-image-min.png',
  `sinceDate` date NOT NULL,
  `score` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- RELACIONES PARA LA TABLA `videogame`:
--

--
-- Volcado de datos para la tabla `videogame`
--

INSERT INTO `videogame` (`id`, `name`, `rating`, `image`, `sinceDate`, `score`) VALUES
('VG-5e56f99da98b9', 'Metal Gear Solid V Ground Zeroes', 18, 'img/videogames/Metal Gear Solid V Ground Zeroes-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a0a39cd', 'Metal Gear Solid V The Phantom Pain', 18, 'img/videogames/Metal Gear Solid V The Phantom Pain-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a3cf9a3', 'Metal Gear Solid', 18, 'img/videogames/Metal Gear Solid-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a3d5092', 'Metal Gear Solid 2 Sons of Liberty', 18, 'img/videogames/Metal Gear Solid 2 Sons of Liberty-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a3d57b4', 'Metal Gear 2 Solid Snake', 12, 'img/videogames/Metal Gear 2 Solid Snake-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a3d74da', 'Metal Gear Solid 3 Snake Eater', 18, 'img/videogames/Metal Gear Solid 3 Snake Eater-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a3d87cd', 'Metal Gear Solid 4 Guns of the Patriots', 18, 'img/videogames/Metal Gear Solid 4 Guns of the Patriots-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a3d8c37', 'Metal Gear', 12, 'img/videogames/Metal Gear-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a5185ff', 'A Way Out', 18, 'img/videogames/A Way Out-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a52538c', 'Assassin\'s Creed III', 18, 'img/videogames/Assassin\'s Creed III-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a53564a', 'Assassin\'s Creed IV Black Flag', 18, 'img/videogames/Assassin\'s Creed IV Black Flag-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a5411b1', 'Assassin\'s Creed Rogue', 18, 'img/videogames/Assassin\'s Creed Rogue-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a5417bf', 'Assassin\'s Creed Unity', 18, 'img/videogames/Assassin\'s Creed Unity-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a583b86', 'Astral Chain', 16, 'img/videogames/Astral Chain-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a66766b', 'Bayonetta', 18, 'img/videogames/Bayonetta-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a66ad0a', 'Bayonetta 2', 18, 'img/videogames/Bayonetta 2-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a67236d', 'Batman Arkham City', 16, 'img/videogames/Batman Arkham City-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a6725fe', 'Batman Arkham Asylum', 16, 'img/videogames/Batman Arkham Asylum-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a688d1d', 'Batman Arkham Knight', 16, 'img/videogames/Batman Arkham Knight-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a6913f4', 'Batman Arkham Origins', 16, 'img/videogames/Batman Arkham Origins-min.png', '2020-02-27', NULL),
('VG-5e56f9a7552d8', 'Battlefield 4', 18, 'img/videogames/Battlefield 4-min.png', '2020-02-27', NULL),
('VG-5e56f9a761e3e', 'Battlefield 1', 18, 'img/videogames/Battlefield 1-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a7865eb', 'Heavy Rain', 18, 'img/videogames/Heavy Rain-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a790990', 'Detroit Become Human', 18, 'img/videogames/Detroit Become Human-min.png', '2020-02-27', NULL),
('VG-5e56f9a79405d', 'Beyond Two Souls', 18, 'img/videogames/Beyond Two Souls-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a797753', 'Bloodborne', 18, 'img/videogames/Bloodborne-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a83032e', 'Sekiro Shadows Die Twice', 18, 'img/videogames/Sekiro Shadows Die Twice-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a846660', 'Call of Duty Black Ops II', 18, 'img/videogames/Call of Duty Black Ops II-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a864e7d', 'Call of Duty Ghosts', 18, 'img/videogames/Call of Duty Ghosts-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a866012', 'Call of Duty Black Ops III', 18, 'img/videogames/Call of Duty Black Ops III-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a877cdf', 'Castlevania Lords of Shadow', 18, 'img/videogames/Castlevania Lords of Shadow-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a8ea878', 'Castlevania Lords of Shadow - Mirror of Fate', 18, 'img/videogames/Castlevania Lords of Shadow Mirror of Fate-min.png', '2020-02-27', NULL),
('VG-5e56f9a940efe', 'Dishonored', 18, 'img/videogames/Dishonored-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a94d2c0', 'Dishonored 2', 18, 'img/videogames/Dishonored 2-min.png', '2020-02-27', NULL),
('VG-5e56f9a99338c', 'Dishonored La Muerte del Forastero', 18, 'img/videogames/Dishonored Death of the Outsider-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a9936f3', 'Fallout 4', 18, 'img/videogames/Fallout 4-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a994457', 'Far Cry 4', 18, 'img/videogames/Far Cry 4-min.jpg', '2020-02-27', NULL),
('VG-5e56f9a9ee56e', 'Final Fantasy X/X-2 HD Remaster', 12, 'img/videogames/Final Fantasy X_X-2 HD Remaster-min.jpg', '2020-02-27', NULL),
('VG-5e56f9aa9c85b', 'Game of Thrones A Telltale Games Stories', 18, 'img/videogames/Game of Thrones A Telltale Games Stories-min.jpg', '2020-02-27', NULL),
('VG-5e56f9aaa769c', 'God of War', 18, 'img/videogames/God of War I-min.jpg', '2020-02-27', NULL),
('VG-5e56f9aac6848', 'God of War II', 18, 'img/videogames/God of War II-min.png', '2020-02-27', NULL),
('VG-5e56f9aae808b', 'God of War III', 18, 'img/videogames/God of War III-min.jpg', '2020-02-27', NULL),
('VG-5e56f9ab19aa2', 'God of War Chains of Olympus', 18, 'img/videogames/God of War Chains of Olympus-min.png', '2020-02-27', NULL),
('VG-5e56f9ab59735', 'God of War Ghost of Sparta', 18, 'img/videogames/God of War Ghost of Sparta-min.jpg', '2020-02-27', NULL),
('VG-5e56f9abb4e7f', 'God of War', 18, 'img/videogames/God of War-min.jpg', '2020-02-27', NULL),
('VG-5e56f9ac00f84', 'God of War Ascension', 18, 'img/videogames/God of War Acension-min.jpg', '2020-02-27', NULL),
('VG-5e56f9ac023a0', 'Monster Hunter 3 Ultimate', 12, 'img/videogames/Monster Hunter 3 Ultimate-min.jpg', '2020-02-27', NULL),
('VG-5e56f9ac02849', 'La Tierra Media: Sombras de Mordor', 18, 'img/videogames/Middle-earth Shadow of Mordor-min.jpg', '2020-02-27', NULL),
('VG-5e56f9ac25e88', 'New Super Mario Bros. U', 18, 'img/videogames/New Super Mario Bros. U-min.jpg', '2020-02-27', NULL),
('VG-5e56f9ac4347a', 'Ni no Kuni II El Renacer de un Reino', 12, 'img/videogames/Ni no Kuni II Revenant Kingdom-min.jpg', '2020-02-27', NULL),
('VG-5e56f9ac694d4', 'NieR Automata', 18, 'img/videogames/NieR Automata-min.jpg', '2020-02-27', NULL),
('VG-5e56f9ac8ada0', 'Overwatch', 12, 'img/videogames/Overwatch-min.png', '2020-02-27', NULL),
('VG-5e56f9acbacb2', 'Pillars of Eternity', 16, 'img/videogames/Pillars of Eternity-min.jpg', '2020-02-27', NULL),
('VG-5e56f9acc063f', 'Red Dead Redemption', 18, 'img/videogames/Red Dead Redemption-min.jpg', '2020-02-27', NULL),
('VG-5e56f9acc4598', 'Red Dead Redemption 2', 18, 'img/videogames/Red Dead Redemption 2-min.jpg', '2020-02-27', NULL),
('VG-5e56f9ad2f000', 'Ryse Son of Rome', 18, 'img/videogames/Ryse Son of Rome-min.jpg', '2020-02-27', NULL),
('VG-5e56f9ad3001d', 'Spec Ops The Line', 18, 'img/videogames/Spec Ops The Line-min.jpg', '2020-02-27', NULL),
('VG-5e56f9ad8a324', 'The Evil Within', 18, 'img/videogames/The Evil Within-min.jpg', '2020-02-27', NULL),
('VG-5e56f9adaf20e', 'Splatoon', 7, 'img/videogames/Splatoon-min.jpg', '2020-02-27', NULL),
('VG-5e56f9adcfb3e', 'Star Wars Battlefront', 18, 'img/videogames/Star Wars Battlefront-min.jpg', '2020-02-27', NULL),
('VG-5e56f9add0d32', 'Star Wars Battlefront II', 18, 'img/videogames/Star Wars Battlefront II-min.jpg', '2020-02-27', NULL),
('VG-5e56f9ae6a5ba', 'Super Mario 3D World', 3, 'img/videogames/Super Mario 3D World-min.jpg', '2020-02-27', NULL),
('VG-5e56f9ae6a6ed', 'Super Mario 3D Land', 3, 'img/videogames/Super Mario 3D Land-min.jpg', '2020-02-27', NULL),
('VG-5e56f9ae8e4e7', 'The Last Guardian', 18, 'img/videogames/The Last Guardian-min.jpg', '2020-02-27', NULL),
('VG-5e56f9ae8ee86', 'Super Smash Bros. for Wii U', 18, 'img/videogames/Super Smash Bros. for Wii U-min.jpg', '2020-02-27', NULL),
('VG-5e56f9ae8f467', 'Super Mario Odyssey', 7, 'img/videogames/Super Mario Odyssey-min.jpg', '2020-02-27', NULL),
('VG-5e56f9ae8f6b3', 'The Last of Us Remastered', 18, 'img/videogames/The Last of Us Remastered-min.jpg', '2020-02-27', NULL),
('VG-5e56f9af0aa6c', 'The Legend of Zelda Breath of the Wild', 12, 'img/videogames/The Legend of Zelda Breath of the Wild-min.jpg', '2020-02-27', NULL),
('VG-5e56f9af0c59c', 'The Legend of Zelda The Wind Waker HD', 12, 'img/videogames/The Legend of Zelda The Wind Waker HD-min.jpg', '2020-02-27', NULL),
('VG-5e56f9af28277', 'The Legend of Zelda Twilight Princess HD', 12, 'img/videogames/The Legend of Zelda Twilight Princess HD-min.jpg', '2020-02-27', NULL),
('VG-5e56f9af545bf', 'The Order 1886', 18, 'img/videogames/The Order 1886-min.jpg', '2020-02-27', NULL),
('VG-5e56f9af7405a', 'The Witcher Enhanced Edition', 18, 'img/videogames/The Witcher Enhanced Edition-min.jpg', '2020-02-27', NULL),
('VG-5e56f9b00da96', 'The Witcher 2 Assassins of Kings', 18, 'img/videogames/The Witcher 2 Assassins of Kings-min.jpg', '2020-02-27', NULL),
('VG-5e56f9b0190e2', 'The Witcher 3 Wild Hunt', 18, 'img/videogames/The Witcher 3 Wild Hunt-min.jpg', '2020-02-27', NULL),
('VG-5e56f9b062827', 'The Wonderful 101', 12, 'img/videogames/The Wonderful 101-min.jpg', '2020-02-27', NULL),
('VG-5e56f9b0b4175', 'This War of Mine', 12, 'img/videogames/This War of Mine-min.jpg', '2020-02-27', NULL),
('VG-5e56f9b0e07b6', 'Tom Clancy\'s Splinter Cell Blacklist', 18, 'img/videogames/Tom Clancy\'s Splinter Cell Blacklist-min.jpg', '2020-02-27', NULL),
('VG-5e56f9b15dda6', 'Uncharted El Tesoro de Drake', 18, 'img/videogames/Uncharted Drake\'s Fortune-min.jpg', '2020-02-27', NULL),
('VG-5e56f9b15eaea', 'Uncharted 4 El Desenlace del Ladrón', 18, 'img/videogames/Uncharted 4 A Thief\'s End-min.jpg', '2020-02-27', NULL),
('VG-5e56f9b15ec07', 'Uncharted 3 La Traición de Drake', 18, 'img/videogames/Uncharted 3 Drake\'s Deception-min.jpg', '2020-02-27', NULL),
('VG-5e56f9b15ef09', 'Uncharted 2 El Reino de los Ladrones', 18, 'img/videogames/Uncharted 2 Among Thieves-min.jpg', '2020-02-27', NULL),
('VG-5e56f9b2291c3', 'Uncharted EL Legado Perdido', 18, 'img/videogames/Uncharted The Lost Legacy-min.png', '2020-02-27', NULL),
('VG-5e56f9b25fcac', 'Until Dawn', 18, 'img/videogames/Until Dawn-min.jpg', '2020-02-27', NULL),
('VG-5e56f9b2ba70e', 'Valiant Hearts The Great War', 12, 'img/videogames/Valiant Hearts The Great War-min.jpg', '2020-02-27', NULL),
('VG-5e56f9b2baad1', 'Watch Dogs', 18, 'img/videogames/Watch Dogs-min.jpg', '2020-02-27', NULL),
('VG-5e56f9b2e21d7', 'Wolfenstein The New Order', 18, 'img/videogames/Wolfenstein The New Order-min.jpg', '2020-02-27', NULL),
('VG-5e56f9b2e3320', 'Zombi U', 18, 'img/videogames/Zombi-min.jpg', '2020-02-27', NULL),
('VG-5e56f9b36c147', 'Pikmin 3', 7, 'img/videogames/Pikmin 3-min.jpg', '2020-02-27', NULL),
('VG-5e56f9b3998b3', 'Grand Theft Auto V', 18, 'img/videogames/Grand Theft Auto V-min.jpg', '2020-02-27', NULL),
('VG-5e56f9b3b2117', 'Hyrule Warriors', 12, 'img/videogames/Hyrule Warriors-min.jpg', '2020-02-27', NULL),
('VG-5e56f9b3bf5cd', 'Life is Strange', 16, 'img/videogames/Life is Strange-min.jpg', '2020-02-27', NULL),
('VG-5e56f9b3cb921', 'Mafia III', 18, 'img/videogames/Mafia III-min.jpg', '2020-02-27', NULL),
('VG-5e56f9b3e62c2', 'Mario & Luigi Viaje al centro de Bowser', 3, 'img/videogames/Mario & Luigi Bowser\'s Inside Story-min.jpg', '2020-02-27', NULL),
('VG-5e56f9b42b983', 'Mario Kart 7', 3, 'img/videogames/Mario Kart 7-min.jpg', '2020-02-27', NULL),
('VG-5e56f9b4996df', 'Mario Kart 8', 3, 'img/videogames/Mario Kart 8-min.jpg', '2020-02-27', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videogame_developer`
--
-- Creación: 25-02-2020 a las 01:29:55
--

CREATE TABLE `videogame_developer` (
  `videogame_id` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `developer_name` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- RELACIONES PARA LA TABLA `videogame_developer`:
--   `videogame_id`
--       `videogame` -> `id`
--   `developer_name`
--       `developer` -> `name`
--

--
-- Volcado de datos para la tabla `videogame_developer`
--

INSERT INTO `videogame_developer` (`videogame_id`, `developer_name`) VALUES
('VG-5e56f99da98b9', 'Kojima Productions'),
('VG-5e56f9a0a39cd', 'Kojima Productions'),
('VG-5e56f9a3cf9a3', 'Kojima Productions'),
('VG-5e56f9a3d5092', 'Kojima Productions'),
('VG-5e56f9a3d57b4', 'Kojima Productions'),
('VG-5e56f9a3d74da', 'Kojima Productions'),
('VG-5e56f9a3d87cd', 'Kojima Productions'),
('VG-5e56f9a3d8c37', 'Kojima Productions'),
('VG-5e56f9a5185ff', 'Hazelight Studios'),
('VG-5e56f9a52538c', 'Ubisoft'),
('VG-5e56f9a53564a', 'Ubisoft'),
('VG-5e56f9a5411b1', 'Ubisoft'),
('VG-5e56f9a5417bf', 'Ubisoft'),
('VG-5e56f9a583b86', 'Platinum Games'),
('VG-5e56f9a66766b', 'Platinum Games'),
('VG-5e56f9a66ad0a', 'Platinum Games'),
('VG-5e56f9a67236d', 'Rocksteady Studios'),
('VG-5e56f9a6725fe', 'Rocksteady Studios'),
('VG-5e56f9a688d1d', 'Rocksteady Studios'),
('VG-5e56f9a6913f4', 'WB Games Montreal'),
('VG-5e56f9a7552d8', 'DICE'),
('VG-5e56f9a761e3e', 'DICE'),
('VG-5e56f9a7865eb', 'Quantic Dream'),
('VG-5e56f9a790990', 'Quantic Dream'),
('VG-5e56f9a79405d', 'Quantic Dream'),
('VG-5e56f9a797753', 'From Software'),
('VG-5e56f9a797753', 'SCE Japan Studio'),
('VG-5e56f9a83032e', 'From Software'),
('VG-5e56f9a846660', 'Treyarch'),
('VG-5e56f9a864e7d', 'Infinity Ward'),
('VG-5e56f9a866012', 'Treyarch'),
('VG-5e56f9a877cdf', 'MercurySteam'),
('VG-5e56f9a8ea878', 'MercurySteam'),
('VG-5e56f9a940efe', 'Arkane Studios'),
('VG-5e56f9a94d2c0', 'Arkane Studios'),
('VG-5e56f9a99338c', 'Arkane Studios'),
('VG-5e56f9a9936f3', 'Bethesda Game Studios'),
('VG-5e56f9a994457', 'Ubisoft'),
('VG-5e56f9a9ee56e', 'Square'),
('VG-5e56f9aa9c85b', 'Telltale Games'),
('VG-5e56f9aaa769c', 'SCE Santa Monica Studio'),
('VG-5e56f9aac6848', 'SCE Santa Monica Studio'),
('VG-5e56f9aae808b', 'SCE Santa Monica Studio'),
('VG-5e56f9ab19aa2', 'Ready at Dawn'),
('VG-5e56f9ab59735', 'Ready at Dawn'),
('VG-5e56f9ab59735', 'SCE Santa Monica Studio'),
('VG-5e56f9abb4e7f', 'SCE Santa Monica Studio'),
('VG-5e56f9ac00f84', 'SCE Santa Monica Studio'),
('VG-5e56f9ac023a0', 'Capcom'),
('VG-5e56f9ac02849', 'Monolith Productions'),
('VG-5e56f9ac25e88', 'Nintendo'),
('VG-5e56f9ac4347a', 'Level-5'),
('VG-5e56f9ac694d4', 'Platinum Games'),
('VG-5e56f9ac8ada0', 'Blizzard Entertainment'),
('VG-5e56f9acbacb2', 'Obsidian Entertainment'),
('VG-5e56f9acc063f', 'Rockstar Games'),
('VG-5e56f9acc4598', 'Rockstar Games'),
('VG-5e56f9ad2f000', 'Crytek'),
('VG-5e56f9ad3001d', 'Yager Development'),
('VG-5e56f9ad8a324', 'Tango Gameworks'),
('VG-5e56f9adaf20e', 'Nintendo'),
('VG-5e56f9adcfb3e', 'DICE'),
('VG-5e56f9add0d32', 'DICE'),
('VG-5e56f9ae6a5ba', 'Nintendo'),
('VG-5e56f9ae6a6ed', 'Nintendo'),
('VG-5e56f9ae8e4e7', 'SCE Japan Studio'),
('VG-5e56f9ae8ee86', 'Bandai Namco Studios'),
('VG-5e56f9ae8ee86', 'Sora Ltd.'),
('VG-5e56f9ae8f467', 'Nintendo'),
('VG-5e56f9ae8f6b3', 'Naughty Dog'),
('VG-5e56f9af0aa6c', 'Nintendo'),
('VG-5e56f9af0c59c', 'Nintendo'),
('VG-5e56f9af28277', 'Nintendo'),
('VG-5e56f9af545bf', 'Ready at Dawn'),
('VG-5e56f9af545bf', 'SCE Santa Monica Studio'),
('VG-5e56f9af7405a', 'CD Project RED'),
('VG-5e56f9b00da96', 'CD Project RED'),
('VG-5e56f9b0190e2', 'CD Project RED'),
('VG-5e56f9b062827', 'Platinum Games'),
('VG-5e56f9b0b4175', '11 bit studios'),
('VG-5e56f9b0e07b6', 'Ubisoft'),
('VG-5e56f9b15dda6', 'Naughty Dog'),
('VG-5e56f9b15eaea', 'Naughty Dog'),
('VG-5e56f9b15ec07', 'Naughty Dog'),
('VG-5e56f9b15ef09', 'Naughty Dog'),
('VG-5e56f9b2291c3', 'Naughty Dog'),
('VG-5e56f9b25fcac', 'Supermassive Games'),
('VG-5e56f9b2ba70e', 'Ubisoft Montpellier'),
('VG-5e56f9b2baad1', 'Ubisoft'),
('VG-5e56f9b2e21d7', 'MachineGames'),
('VG-5e56f9b2e3320', 'Ubisoft Montpellier'),
('VG-5e56f9b36c147', 'Nintendo'),
('VG-5e56f9b3998b3', 'Rockstar Games'),
('VG-5e56f9b3b2117', 'Omega Force'),
('VG-5e56f9b3b2117', 'Team Ninja'),
('VG-5e56f9b3bf5cd', 'Dontnod Entertainment'),
('VG-5e56f9b3cb921', 'Hangar 13'),
('VG-5e56f9b3e62c2', 'AlphaDream'),
('VG-5e56f9b42b983', 'Nintendo'),
('VG-5e56f9b4996df', 'Nintendo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videogame_genre`
--
-- Creación: 25-02-2020 a las 01:29:55
--

CREATE TABLE `videogame_genre` (
  `videogame_id` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `genre_name` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- RELACIONES PARA LA TABLA `videogame_genre`:
--   `videogame_id`
--       `videogame` -> `id`
--   `genre_name`
--       `genre` -> `name`
--

--
-- Volcado de datos para la tabla `videogame_genre`
--

INSERT INTO `videogame_genre` (`videogame_id`, `genre_name`) VALUES
('VG-5e56f99da98b9', 'acción'),
('VG-5e56f99da98b9', 'infiltración'),
('VG-5e56f99da98b9', 'TPS'),
('VG-5e56f9a0a39cd', 'acción'),
('VG-5e56f9a0a39cd', 'infiltración'),
('VG-5e56f9a0a39cd', 'TPS'),
('VG-5e56f9a3cf9a3', 'acción'),
('VG-5e56f9a3cf9a3', 'infiltración'),
('VG-5e56f9a3cf9a3', 'TPS'),
('VG-5e56f9a3d5092', 'acción'),
('VG-5e56f9a3d5092', 'infiltración'),
('VG-5e56f9a3d5092', 'TPS'),
('VG-5e56f9a3d57b4', 'acción'),
('VG-5e56f9a3d57b4', 'infiltración'),
('VG-5e56f9a3d74da', 'acción'),
('VG-5e56f9a3d74da', 'infiltración'),
('VG-5e56f9a3d74da', 'TPS'),
('VG-5e56f9a3d87cd', 'acción'),
('VG-5e56f9a3d87cd', 'infiltración'),
('VG-5e56f9a3d87cd', 'TPS'),
('VG-5e56f9a3d8c37', 'acción'),
('VG-5e56f9a3d8c37', 'infiltración'),
('VG-5e56f9a5185ff', 'acción'),
('VG-5e56f9a5185ff', 'aventuras'),
('VG-5e56f9a5185ff', 'puzles'),
('VG-5e56f9a52538c', 'acción'),
('VG-5e56f9a52538c', 'aventuras'),
('VG-5e56f9a52538c', 'infiltración'),
('VG-5e56f9a53564a', 'acción'),
('VG-5e56f9a53564a', 'aventuras'),
('VG-5e56f9a53564a', 'infiltración'),
('VG-5e56f9a5411b1', 'acción'),
('VG-5e56f9a5411b1', 'aventuras'),
('VG-5e56f9a5411b1', 'infiltración'),
('VG-5e56f9a5417bf', 'acción'),
('VG-5e56f9a5417bf', 'aventuras'),
('VG-5e56f9a5417bf', 'infiltración'),
('VG-5e56f9a583b86', 'acción'),
('VG-5e56f9a583b86', 'puzles'),
('VG-5e56f9a66766b', 'acción'),
('VG-5e56f9a66ad0a', 'acción'),
('VG-5e56f9a67236d', 'acción'),
('VG-5e56f9a67236d', 'infiltración'),
('VG-5e56f9a6725fe', 'acción'),
('VG-5e56f9a6725fe', 'infiltración'),
('VG-5e56f9a688d1d', 'acción'),
('VG-5e56f9a688d1d', 'infiltración'),
('VG-5e56f9a6913f4', 'acción'),
('VG-5e56f9a6913f4', 'infiltración'),
('VG-5e56f9a7552d8', 'acción'),
('VG-5e56f9a7552d8', 'FPS'),
('VG-5e56f9a761e3e', 'acción'),
('VG-5e56f9a761e3e', 'FPS'),
('VG-5e56f9a7865eb', 'acción'),
('VG-5e56f9a790990', 'acción'),
('VG-5e56f9a79405d', 'acción'),
('VG-5e56f9a797753', 'acción'),
('VG-5e56f9a797753', 'RPG'),
('VG-5e56f9a83032e', 'acción'),
('VG-5e56f9a83032e', 'RPG'),
('VG-5e56f9a846660', 'acción'),
('VG-5e56f9a846660', 'FPS'),
('VG-5e56f9a864e7d', 'acción'),
('VG-5e56f9a864e7d', 'FPS'),
('VG-5e56f9a866012', 'acción'),
('VG-5e56f9a866012', 'FPS'),
('VG-5e56f9a877cdf', 'acción'),
('VG-5e56f9a8ea878', 'acción'),
('VG-5e56f9a940efe', 'acción'),
('VG-5e56f9a940efe', 'aventuras'),
('VG-5e56f9a940efe', 'infiltración'),
('VG-5e56f9a94d2c0', 'acción'),
('VG-5e56f9a94d2c0', 'aventuras'),
('VG-5e56f9a94d2c0', 'infiltración'),
('VG-5e56f9a99338c', 'acción'),
('VG-5e56f9a99338c', 'aventuras'),
('VG-5e56f9a99338c', 'infiltración'),
('VG-5e56f9a9936f3', 'acción'),
('VG-5e56f9a9936f3', 'aventuras'),
('VG-5e56f9a9936f3', 'RPG'),
('VG-5e56f9a994457', 'acción'),
('VG-5e56f9a994457', 'aventuras'),
('VG-5e56f9a994457', 'FPS'),
('VG-5e56f9a9ee56e', 'aventuras'),
('VG-5e56f9a9ee56e', 'RPG'),
('VG-5e56f9aa9c85b', 'acción'),
('VG-5e56f9aa9c85b', 'aventuras'),
('VG-5e56f9aaa769c', 'acción'),
('VG-5e56f9aaa769c', 'aventuras'),
('VG-5e56f9aac6848', 'acción'),
('VG-5e56f9aac6848', 'aventuras'),
('VG-5e56f9aae808b', 'acción'),
('VG-5e56f9aae808b', 'aventuras'),
('VG-5e56f9ab19aa2', 'acción'),
('VG-5e56f9ab19aa2', 'aventuras'),
('VG-5e56f9ab59735', 'acción'),
('VG-5e56f9ab59735', 'aventuras'),
('VG-5e56f9abb4e7f', 'acción'),
('VG-5e56f9abb4e7f', 'aventuras'),
('VG-5e56f9ac00f84', 'acción'),
('VG-5e56f9ac00f84', 'aventuras'),
('VG-5e56f9ac023a0', 'acción'),
('VG-5e56f9ac023a0', 'RPG'),
('VG-5e56f9ac02849', 'acción'),
('VG-5e56f9ac02849', 'aventuras'),
('VG-5e56f9ac25e88', 'plataformas'),
('VG-5e56f9ac4347a', 'aventuras'),
('VG-5e56f9ac4347a', 'RPG'),
('VG-5e56f9ac694d4', 'acción'),
('VG-5e56f9ac694d4', 'RPG'),
('VG-5e56f9ac8ada0', 'acción'),
('VG-5e56f9ac8ada0', 'FPS'),
('VG-5e56f9acbacb2', 'RPG'),
('VG-5e56f9acc063f', 'acción'),
('VG-5e56f9acc063f', 'aventuras'),
('VG-5e56f9acc4598', 'acción'),
('VG-5e56f9acc4598', 'aventuras'),
('VG-5e56f9ad2f000', 'acción'),
('VG-5e56f9ad2f000', 'aventuras'),
('VG-5e56f9ad3001d', 'acción'),
('VG-5e56f9ad3001d', 'TPS'),
('VG-5e56f9ad8a324', 'acción'),
('VG-5e56f9ad8a324', 'survival'),
('VG-5e56f9ad8a324', 'TPS'),
('VG-5e56f9adaf20e', 'acción'),
('VG-5e56f9adaf20e', 'TPS'),
('VG-5e56f9adcfb3e', 'acción'),
('VG-5e56f9adcfb3e', 'FPS'),
('VG-5e56f9add0d32', 'acción'),
('VG-5e56f9add0d32', 'FPS'),
('VG-5e56f9ae6a5ba', 'plataformas'),
('VG-5e56f9ae6a6ed', 'plataformas'),
('VG-5e56f9ae8e4e7', 'acción'),
('VG-5e56f9ae8e4e7', 'aventuras'),
('VG-5e56f9ae8ee86', 'acción'),
('VG-5e56f9ae8ee86', 'lucha'),
('VG-5e56f9ae8f467', 'plataformas'),
('VG-5e56f9ae8f6b3', 'acción'),
('VG-5e56f9ae8f6b3', 'survival'),
('VG-5e56f9af0aa6c', 'acción'),
('VG-5e56f9af0aa6c', 'aventuras'),
('VG-5e56f9af0aa6c', 'puzles'),
('VG-5e56f9af0c59c', 'acción'),
('VG-5e56f9af0c59c', 'aventuras'),
('VG-5e56f9af0c59c', 'puzles'),
('VG-5e56f9af28277', 'acción'),
('VG-5e56f9af28277', 'aventuras'),
('VG-5e56f9af28277', 'puzles'),
('VG-5e56f9af545bf', 'acción'),
('VG-5e56f9af545bf', 'TPS'),
('VG-5e56f9af7405a', 'acción'),
('VG-5e56f9af7405a', 'aventuras'),
('VG-5e56f9af7405a', 'RPG'),
('VG-5e56f9b00da96', 'acción'),
('VG-5e56f9b00da96', 'aventuras'),
('VG-5e56f9b00da96', 'RPG'),
('VG-5e56f9b0190e2', 'acción'),
('VG-5e56f9b0190e2', 'aventuras'),
('VG-5e56f9b0190e2', 'RPG'),
('VG-5e56f9b062827', 'acción'),
('VG-5e56f9b062827', 'aventuras'),
('VG-5e56f9b0b4175', 'acción'),
('VG-5e56f9b0b4175', 'aventuras'),
('VG-5e56f9b0e07b6', 'acción'),
('VG-5e56f9b0e07b6', 'infiltración'),
('VG-5e56f9b0e07b6', 'TPS'),
('VG-5e56f9b15dda6', 'acción'),
('VG-5e56f9b15dda6', 'aventuras'),
('VG-5e56f9b15dda6', 'TPS'),
('VG-5e56f9b15eaea', 'acción'),
('VG-5e56f9b15eaea', 'aventuras'),
('VG-5e56f9b15eaea', 'TPS'),
('VG-5e56f9b15ec07', 'acción'),
('VG-5e56f9b15ec07', 'aventuras'),
('VG-5e56f9b15ec07', 'TPS'),
('VG-5e56f9b15ef09', 'acción'),
('VG-5e56f9b15ef09', 'aventuras'),
('VG-5e56f9b15ef09', 'TPS'),
('VG-5e56f9b2291c3', 'acción'),
('VG-5e56f9b2291c3', 'aventuras'),
('VG-5e56f9b2291c3', 'TPS'),
('VG-5e56f9b25fcac', 'acción'),
('VG-5e56f9b25fcac', 'aventuras'),
('VG-5e56f9b25fcac', 'survival'),
('VG-5e56f9b2ba70e', 'aventuras'),
('VG-5e56f9b2baad1', 'acción'),
('VG-5e56f9b2baad1', 'aventuras'),
('VG-5e56f9b2e21d7', 'acción'),
('VG-5e56f9b2e21d7', 'FPS'),
('VG-5e56f9b2e3320', 'acción'),
('VG-5e56f9b2e3320', 'survival'),
('VG-5e56f9b36c147', 'aventuras'),
('VG-5e56f9b36c147', 'RTS'),
('VG-5e56f9b3998b3', 'acción'),
('VG-5e56f9b3998b3', 'aventuras'),
('VG-5e56f9b3b2117', 'acción'),
('VG-5e56f9b3b2117', 'aventuras'),
('VG-5e56f9b3bf5cd', 'aventuras'),
('VG-5e56f9b3cb921', 'acción'),
('VG-5e56f9b3cb921', 'aventuras'),
('VG-5e56f9b3cb921', 'TPS'),
('VG-5e56f9b3e62c2', 'aventuras'),
('VG-5e56f9b3e62c2', 'plataformas'),
('VG-5e56f9b3e62c2', 'puzles'),
('VG-5e56f9b3e62c2', 'RPG'),
('VG-5e56f9b42b983', 'carreras'),
('VG-5e56f9b4996df', 'carreras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videogame_platform`
--
-- Creación: 25-02-2020 a las 01:29:55
--

CREATE TABLE `videogame_platform` (
  `videogame_id` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `platform_name` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- RELACIONES PARA LA TABLA `videogame_platform`:
--   `videogame_id`
--       `videogame` -> `id`
--   `platform_name`
--       `platform` -> `name`
--

--
-- Volcado de datos para la tabla `videogame_platform`
--

INSERT INTO `videogame_platform` (`videogame_id`, `platform_name`) VALUES
('VG-5e56f99da98b9', 'PS4'),
('VG-5e56f9a0a39cd', 'PS4'),
('VG-5e56f9a3cf9a3', 'PS3'),
('VG-5e56f9a3d5092', 'PS3'),
('VG-5e56f9a3d57b4', 'PS3'),
('VG-5e56f9a3d74da', 'Nintendo 3DS'),
('VG-5e56f9a3d74da', 'PS3'),
('VG-5e56f9a3d87cd', 'PS3'),
('VG-5e56f9a3d8c37', 'PS3'),
('VG-5e56f9a5185ff', 'PS4'),
('VG-5e56f9a52538c', 'Wii U'),
('VG-5e56f9a53564a', 'PS4'),
('VG-5e56f9a5411b1', 'PS4'),
('VG-5e56f9a5417bf', 'PS4'),
('VG-5e56f9a583b86', 'Switch'),
('VG-5e56f9a66766b', 'Wii U'),
('VG-5e56f9a66ad0a', 'Wii U'),
('VG-5e56f9a67236d', 'PC'),
('VG-5e56f9a67236d', 'Wii U'),
('VG-5e56f9a6725fe', 'PC'),
('VG-5e56f9a688d1d', 'PC'),
('VG-5e56f9a688d1d', 'PS4'),
('VG-5e56f9a6913f4', 'Wii U'),
('VG-5e56f9a7552d8', 'PS4'),
('VG-5e56f9a761e3e', 'PS4'),
('VG-5e56f9a7865eb', 'PS4'),
('VG-5e56f9a790990', 'PS4'),
('VG-5e56f9a79405d', 'PS4'),
('VG-5e56f9a797753', 'PS4'),
('VG-5e56f9a83032e', 'PS4'),
('VG-5e56f9a846660', 'Wii U'),
('VG-5e56f9a864e7d', 'Wii U'),
('VG-5e56f9a866012', 'PS4'),
('VG-5e56f9a877cdf', 'PC'),
('VG-5e56f9a8ea878', 'Nintendo 3DS'),
('VG-5e56f9a8ea878', 'PC'),
('VG-5e56f9a940efe', 'PS4'),
('VG-5e56f9a94d2c0', 'PS4'),
('VG-5e56f9a99338c', 'PS4'),
('VG-5e56f9a9936f3', 'PS4'),
('VG-5e56f9a994457', 'PS4'),
('VG-5e56f9a9ee56e', 'PS4'),
('VG-5e56f9aa9c85b', 'PS4'),
('VG-5e56f9aaa769c', 'PS4'),
('VG-5e56f9aac6848', 'PS4'),
('VG-5e56f9aae808b', 'PS4'),
('VG-5e56f9ab19aa2', 'PS4'),
('VG-5e56f9ab59735', 'PS4'),
('VG-5e56f9abb4e7f', 'PS4'),
('VG-5e56f9ac00f84', 'PS4'),
('VG-5e56f9ac023a0', 'Wii U'),
('VG-5e56f9ac02849', 'PS4'),
('VG-5e56f9ac25e88', 'Wii U'),
('VG-5e56f9ac4347a', 'PS4'),
('VG-5e56f9ac694d4', 'PS4'),
('VG-5e56f9ac8ada0', 'PC'),
('VG-5e56f9acbacb2', 'PC'),
('VG-5e56f9acc063f', 'PS3'),
('VG-5e56f9acc4598', 'PS4'),
('VG-5e56f9ad2f000', 'PC'),
('VG-5e56f9ad3001d', 'PC'),
('VG-5e56f9ad8a324', 'PS4'),
('VG-5e56f9adaf20e', 'Wii U'),
('VG-5e56f9adcfb3e', 'PS4'),
('VG-5e56f9add0d32', 'PS4'),
('VG-5e56f9ae6a5ba', 'Wii U'),
('VG-5e56f9ae6a6ed', 'Nintendo 3DS'),
('VG-5e56f9ae8e4e7', 'PS4'),
('VG-5e56f9ae8ee86', 'Wii U'),
('VG-5e56f9ae8f467', 'Switch'),
('VG-5e56f9ae8f6b3', 'PS4'),
('VG-5e56f9af0aa6c', 'Wii U'),
('VG-5e56f9af0c59c', 'Wii U'),
('VG-5e56f9af28277', 'Wii U'),
('VG-5e56f9af545bf', 'PS4'),
('VG-5e56f9af7405a', 'PC'),
('VG-5e56f9b00da96', 'PC'),
('VG-5e56f9b0190e2', 'PC'),
('VG-5e56f9b062827', 'Wii U'),
('VG-5e56f9b0b4175', 'PC'),
('VG-5e56f9b0b4175', 'PS4'),
('VG-5e56f9b0e07b6', 'PC'),
('VG-5e56f9b0e07b6', 'Wii U'),
('VG-5e56f9b15dda6', 'PS4'),
('VG-5e56f9b15eaea', 'PS4'),
('VG-5e56f9b15ec07', 'PS4'),
('VG-5e56f9b15ef09', 'PS4'),
('VG-5e56f9b2291c3', 'PS4'),
('VG-5e56f9b25fcac', 'PS4'),
('VG-5e56f9b2ba70e', 'PS4'),
('VG-5e56f9b2baad1', 'PC'),
('VG-5e56f9b2e21d7', 'PS4'),
('VG-5e56f9b2e3320', 'Wii U'),
('VG-5e56f9b36c147', 'Wii U'),
('VG-5e56f9b3998b3', 'PS4'),
('VG-5e56f9b3b2117', 'Wii U'),
('VG-5e56f9b3bf5cd', 'PS4'),
('VG-5e56f9b3cb921', 'PS4'),
('VG-5e56f9b3e62c2', 'Nintendo 3DS'),
('VG-5e56f9b42b983', 'Nintendo 3DS'),
('VG-5e56f9b4996df', 'Wii U');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videogame_publisher`
--
-- Creación: 25-02-2020 a las 01:29:55
--

CREATE TABLE `videogame_publisher` (
  `videogame_id` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `publisher_name` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- RELACIONES PARA LA TABLA `videogame_publisher`:
--   `videogame_id`
--       `videogame` -> `id`
--   `publisher_name`
--       `publisher` -> `name`
--

--
-- Volcado de datos para la tabla `videogame_publisher`
--

INSERT INTO `videogame_publisher` (`videogame_id`, `publisher_name`) VALUES
('VG-5e56f99da98b9', 'Konami'),
('VG-5e56f9a0a39cd', 'Konami'),
('VG-5e56f9a3cf9a3', 'Konami'),
('VG-5e56f9a3d5092', 'Konami'),
('VG-5e56f9a3d57b4', 'Konami'),
('VG-5e56f9a3d74da', 'Konami'),
('VG-5e56f9a3d87cd', 'Konami'),
('VG-5e56f9a3d8c37', 'Konami'),
('VG-5e56f9a5185ff', 'Electronic Arts'),
('VG-5e56f9a52538c', 'Ubisoft'),
('VG-5e56f9a53564a', 'Ubisoft'),
('VG-5e56f9a5411b1', 'Ubisoft'),
('VG-5e56f9a5417bf', 'Ubisoft'),
('VG-5e56f9a583b86', 'Nintendo'),
('VG-5e56f9a66766b', 'Nintendo'),
('VG-5e56f9a66766b', 'Sega'),
('VG-5e56f9a66ad0a', 'Nintendo'),
('VG-5e56f9a66ad0a', 'Sega'),
('VG-5e56f9a67236d', 'Warner Bros. Interactive Entertainment'),
('VG-5e56f9a6725fe', 'Warner Bros. Interactive Entertainment'),
('VG-5e56f9a688d1d', 'Warner Bros. Interactive Entertainment'),
('VG-5e56f9a6913f4', 'Warner Bros. Interactive Entertainment'),
('VG-5e56f9a7552d8', 'Electronic Arts'),
('VG-5e56f9a761e3e', 'Electronic Arts'),
('VG-5e56f9a7865eb', 'Sony Computer Entertainment'),
('VG-5e56f9a790990', 'Sony Computer Entertainment'),
('VG-5e56f9a79405d', 'Sony Computer Entertainment'),
('VG-5e56f9a797753', 'Sony Computer Entertainment'),
('VG-5e56f9a83032e', 'Activision'),
('VG-5e56f9a846660', 'Activision'),
('VG-5e56f9a864e7d', 'Activision'),
('VG-5e56f9a866012', 'Activision'),
('VG-5e56f9a877cdf', 'Konami'),
('VG-5e56f9a8ea878', 'Konami'),
('VG-5e56f9a940efe', 'Bethesda Softworks'),
('VG-5e56f9a94d2c0', 'Bethesda Softworks'),
('VG-5e56f9a99338c', 'Bethesda Softworks'),
('VG-5e56f9a9936f3', 'Bethesda Softworks'),
('VG-5e56f9a994457', 'Ubisoft'),
('VG-5e56f9a9ee56e', 'Square Enix'),
('VG-5e56f9aa9c85b', 'HBO'),
('VG-5e56f9aaa769c', 'Sony Computer Entertainment'),
('VG-5e56f9aac6848', 'Sony Computer Entertainment'),
('VG-5e56f9aae808b', 'Sony Computer Entertainment'),
('VG-5e56f9ab19aa2', 'Sony Computer Entertainment'),
('VG-5e56f9ab59735', 'Sony Computer Entertainment'),
('VG-5e56f9abb4e7f', 'Sony Computer Entertainment'),
('VG-5e56f9ac00f84', 'Sony Computer Entertainment'),
('VG-5e56f9ac023a0', 'Capcom'),
('VG-5e56f9ac02849', 'Warner Bros. Interactive Entertainment'),
('VG-5e56f9ac25e88', 'Nintendo'),
('VG-5e56f9ac4347a', 'Bandai Namco Entertainment'),
('VG-5e56f9ac694d4', 'Square Enix'),
('VG-5e56f9ac8ada0', 'Blizzard Entertainment'),
('VG-5e56f9acbacb2', 'Paradox Interactive'),
('VG-5e56f9acc063f', 'Take-Two Interactive'),
('VG-5e56f9acc4598', 'Take-Two Interactive'),
('VG-5e56f9ad2f000', 'Deep Silver'),
('VG-5e56f9ad2f000', 'Microsoft Game Studios'),
('VG-5e56f9ad3001d', '2K Games'),
('VG-5e56f9ad3001d', 'Take-Two Interactive'),
('VG-5e56f9ad8a324', 'Bethesda Softworks'),
('VG-5e56f9adaf20e', 'Nintendo'),
('VG-5e56f9adcfb3e', 'Electronic Arts'),
('VG-5e56f9add0d32', 'Electronic Arts'),
('VG-5e56f9ae6a5ba', 'Nintendo'),
('VG-5e56f9ae6a6ed', 'Nintendo'),
('VG-5e56f9ae8e4e7', 'Sony Computer Entertainment'),
('VG-5e56f9ae8ee86', 'Nintendo'),
('VG-5e56f9ae8f467', 'Nintendo'),
('VG-5e56f9ae8f6b3', 'Sony Computer Entertainment'),
('VG-5e56f9af0aa6c', 'Nintendo'),
('VG-5e56f9af0c59c', 'Nintendo'),
('VG-5e56f9af28277', 'Nintendo'),
('VG-5e56f9af545bf', 'Sony Computer Entertainment'),
('VG-5e56f9af7405a', 'Atari'),
('VG-5e56f9b00da96', 'Bandai Namco Entertainment'),
('VG-5e56f9b0190e2', 'Bandai Namco Entertainment'),
('VG-5e56f9b062827', 'Nintendo'),
('VG-5e56f9b0b4175', 'Deep Silver'),
('VG-5e56f9b0e07b6', 'Ubisoft'),
('VG-5e56f9b15dda6', 'Sony Computer Entertainment'),
('VG-5e56f9b15eaea', 'Sony Computer Entertainment'),
('VG-5e56f9b15ec07', 'Sony Computer Entertainment'),
('VG-5e56f9b15ef09', 'Sony Computer Entertainment'),
('VG-5e56f9b2291c3', 'Sony Computer Entertainment'),
('VG-5e56f9b25fcac', 'Sony Computer Entertainment'),
('VG-5e56f9b2ba70e', 'Ubisoft'),
('VG-5e56f9b2baad1', 'Ubisoft'),
('VG-5e56f9b2e21d7', 'Bethesda Softworks'),
('VG-5e56f9b2e3320', 'Ubisoft'),
('VG-5e56f9b36c147', 'Nintendo'),
('VG-5e56f9b3998b3', 'Take-Two Interactive'),
('VG-5e56f9b3b2117', 'Koei Tecmo'),
('VG-5e56f9b3bf5cd', 'Square Enix'),
('VG-5e56f9b3cb921', '2K Games'),
('VG-5e56f9b3e62c2', 'Nintendo'),
('VG-5e56f9b42b983', 'Nintendo'),
('VG-5e56f9b4996df', 'Nintendo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videogame_scores`
--
-- Creación: 26-02-2020 a las 22:03:04
--

CREATE TABLE `videogame_scores` (
  `videogame_id` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `gameplay_score` float DEFAULT NULL,
  `graphics_score` float DEFAULT NULL,
  `art_score` float DEFAULT NULL,
  `sound_score` float DEFAULT NULL,
  `narrative_score` float DEFAULT NULL,
  `multiplayer_score` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- RELACIONES PARA LA TABLA `videogame_scores`:
--   `videogame_id`
--       `videogame` -> `id`
--

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `developer`
--
ALTER TABLE `developer`
  ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `platform`
--
ALTER TABLE `platform`
  ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `videogame`
--
ALTER TABLE `videogame`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `videogame_developer`
--
ALTER TABLE `videogame_developer`
  ADD PRIMARY KEY (`videogame_id`,`developer_name`),
  ADD KEY `videogame_id` (`videogame_id`,`developer_name`),
  ADD KEY `developer_name` (`developer_name`);

--
-- Indices de la tabla `videogame_genre`
--
ALTER TABLE `videogame_genre`
  ADD PRIMARY KEY (`videogame_id`,`genre_name`),
  ADD KEY `videogame_id` (`videogame_id`,`genre_name`),
  ADD KEY `genre_name` (`genre_name`);

--
-- Indices de la tabla `videogame_platform`
--
ALTER TABLE `videogame_platform`
  ADD PRIMARY KEY (`videogame_id`,`platform_name`),
  ADD KEY `platform_name` (`platform_name`);

--
-- Indices de la tabla `videogame_publisher`
--
ALTER TABLE `videogame_publisher`
  ADD PRIMARY KEY (`videogame_id`,`publisher_name`),
  ADD KEY `videogame_id` (`videogame_id`,`publisher_name`),
  ADD KEY `publisher_name` (`publisher_name`);

--
-- Indices de la tabla `videogame_scores`
--
ALTER TABLE `videogame_scores`
  ADD PRIMARY KEY (`videogame_id`),
  ADD KEY `videogame_id` (`videogame_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `videogame_developer`
--
ALTER TABLE `videogame_developer`
  ADD CONSTRAINT `videogame_developer_ibfk_1` FOREIGN KEY (`videogame_id`) REFERENCES `videogame` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `videogame_developer_ibfk_2` FOREIGN KEY (`developer_name`) REFERENCES `developer` (`name`) ON DELETE CASCADE;

--
-- Filtros para la tabla `videogame_genre`
--
ALTER TABLE `videogame_genre`
  ADD CONSTRAINT `videogame_genre_ibfk_1` FOREIGN KEY (`videogame_id`) REFERENCES `videogame` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `videogame_genre_ibfk_2` FOREIGN KEY (`genre_name`) REFERENCES `genre` (`name`) ON DELETE CASCADE;

--
-- Filtros para la tabla `videogame_platform`
--
ALTER TABLE `videogame_platform`
  ADD CONSTRAINT `videogame_platform_ibfk_1` FOREIGN KEY (`videogame_id`) REFERENCES `videogame` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `videogame_platform_ibfk_2` FOREIGN KEY (`platform_name`) REFERENCES `platform` (`name`) ON DELETE CASCADE;

--
-- Filtros para la tabla `videogame_publisher`
--
ALTER TABLE `videogame_publisher`
  ADD CONSTRAINT `videogame_publisher_ibfk_1` FOREIGN KEY (`videogame_id`) REFERENCES `videogame` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `videogame_publisher_ibfk_2` FOREIGN KEY (`publisher_name`) REFERENCES `publisher` (`name`) ON DELETE CASCADE;

--
-- Filtros para la tabla `videogame_scores`
--
ALTER TABLE `videogame_scores`
  ADD CONSTRAINT `videogame_scores_ibfk_1` FOREIGN KEY (`videogame_id`) REFERENCES `videogame` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
