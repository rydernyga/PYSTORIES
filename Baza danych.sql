-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Czas generowania: 03 Gru 2016, 15:09
-- Wersja serwera: 5.5.50-0+deb8u1-log
-- Wersja PHP: 5.6.24-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza danych: `db_18945`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kody`
--

CREATE TABLE IF NOT EXISTS `kody` (
  `kod` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uzyty` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dni` int(11) NOT NULL DEFAULT '1508' COMMENT '1508 - 15 dni / 1509 - 30 dni!',
  `aktywowaluid` int(121) DEFAULT NULL,
`id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lss_domy`
--

CREATE TABLE IF NOT EXISTS `lss_domy` (
`id` int(10) unsigned NOT NULL,
  `descr` varchar(32) CHARACTER SET utf8 DEFAULT 'Dom',
  `i` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'interior w ktorym jest wejscie i wyjscie z domu',
  `vwe` int(11) NOT NULL DEFAULT '0' COMMENT 'vw wejscia (prawie zawsze 0)',
  `vwi` int(11) DEFAULT NULL COMMENT 'VW wnetrza (nadawane automatycznie, tu mozna wymusic)',
  `drzwi` varchar(32) CHARACTER SET ascii NOT NULL COMMENT 'x,y,z miejsce w ktorym bedzie pickup wchodzenia',
  `punkt_wyjscia` varchar(64) NOT NULL COMMENT 'x,y,z,[rz] miejsce gdzie przeniesie po wyjsciu',
  `interiorid` int(10) unsigned DEFAULT '221' COMMENT 'numer wnetrza z tablicy pbp_interiory',
  `ownerid` int(10) unsigned DEFAULT NULL COMMENT 'numer wlasciciela z tablicy players',
  `zamkniety` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=zawsze otwarty',
  `koszt` int(5) unsigned NOT NULL DEFAULT '100',
  `paidTo` date DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'uzywane do wykrywania zaktualizowanych przez panel domow',
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `lss_domy`
--

INSERT INTO `lss_domy` (`id`, `descr`, `i`, `vwe`, `vwi`, `drzwi`, `punkt_wyjscia`, `interiorid`, `ownerid`, `zamkniety`, `koszt`, `paidTo`, `updated`, `active`) VALUES
(1, 'Dom', 0, 0, 1, '12.79,1113.67,20.94', '12.79,1113.67,20.94', 221, 1, 1, 15000, '2017-09-09', '2016-11-13 06:40:03', 1),
(2, 'Dom', 0, 0, 2, '1.75,1076.09,20.94', '1.75,1076.09,20.94', 221, 1715, 1, 15000, '2016-12-20', '2016-11-20 03:02:30', 1),
(3, 'Dom', 0, 0, 3, '-45.07,1081.08,20.94', '-45.07,1081.08,20.94', 221, 2543, 0, 15000, '2016-12-05', '2016-12-03 00:23:49', 1),
(4, 'Dom', 0, 0, 4, '-32.20,1038.67,20.94', '-32.20,1038.67,20.94', 221, 1135, 1, 15000, '2017-01-04', '2016-11-13 11:00:39', 1),
(5, 'Dom', 0, 0, 5, '-18.26,1115.66,20.94', '-18.26,1115.66,20.94', 221, 477, 1, 15000, '2016-12-13', '2016-11-13 12:46:46', 1),
(6, 'Dom', 0, 0, 6, '-36.04,1115.67,20.94', '-36.04,1115.67,20.94', 221, 1181, 0, 15000, '2016-12-18', '2016-11-18 15:26:22', 1),
(7, 'Dom', 0, 0, 7, '-258.90,1083.07,20.94', '-258.90,1083.07,20.94', 221, 867, 0, 15000, '2016-12-05', '2016-11-30 14:39:51', 1),
(8, 'Dom', 0, 0, 88, '-258.25,1043.84,20.94', '-258.25,1043.84,20.94', 221, 1254, 0, 15000, '2016-12-28', '2016-11-14 10:19:12', 1),
(9, 'Dom', 0, 0, 9, '-278.91,1003.07,20.94', '-278.91,1003.07,20.94', 221, 1255, 1, 15000, '2016-12-13', '2016-11-13 15:42:42', 1),
(10, 'Dom', 0, 0, 10, '-247.84,1001.08,20.94', '-247.84,1001.08,20.94', 221, 1371, 1, 15000, '2017-01-27', '2016-12-03 10:18:00', 1),
(11, 'Dom', 0, 0, 11, '-260.25,1120.04,20.94', '-260.25,1120.04,20.94', 221, 41, 1, 15000, '2016-12-13', '2016-11-13 11:38:04', 1),
(12, 'Dom', 0, 0, 12, '-258.25,1151.07,20.94', '-258.25,1151.07,20.94', 221, 41, 1, 15000, '2016-12-13', '2016-11-13 10:57:17', 1),
(13, 'Dom', 0, 0, 13, '-258.25,1168.87,20.94', '-258.25,1168.87,20.94', 221, 1434, 1, 15000, '2016-12-13', '2016-11-13 13:16:15', 1),
(14, 'Dom', 0, 0, 14, '-290.84,1176.75,20.94', '-290.84,1176.75,20.94', 221, 1798, 0, 15000, '2016-12-22', '2016-11-23 18:17:45', 1),
(15, 'Dom', 0, 0, 15, '-324.37,1165.66,20.94', '-324.37,1165.66,20.94', 221, 743, 0, 15000, '2017-01-18', '2016-11-19 15:40:03', 1),
(16, 'Dom', 0, 0, 16, '-298.25,1115.67,20.94', '-298.25,1115.67,20.94', 221, 1277, 0, 15000, '2017-01-11', '2016-11-16 18:18:13', 1),
(17, 'Dom', 0, 0, 17, '-328.25,1118.87,20.94', '-328.25,1118.87,20.94', 221, 1597, 1, 15000, '2016-12-19', '2016-12-02 16:51:40', 1),
(18, 'Dom', 0, 0, 18, '-362.84,1110.65,20.94', '-362.84,1110.65,20.94', 221, 1810, 0, 15000, '2016-12-22', '2016-12-02 16:41:13', 1),
(19, 'Dom', 0, 0, 19, '-360.85,1141.67,20.94', '-360.85,1141.67,20.94', 221, 1368, 0, 15000, '2016-12-09', '2016-12-03 10:50:38', 1),
(20, 'Dom', 0, 0, 20, '-369.83,1169.48,20.27', '-369.83,1169.48,20.27', 221, 2481, 0, 15000, '2017-03-13', '2016-12-02 17:32:27', 1),
(21, 'Dom', 0, 0, 21, '-311.29,1303.50,53.66', '-311.29,1303.50,53.66', 221, 1489, 0, 15000, '2017-02-10', '2016-12-02 17:39:24', 1),
(22, 'Dom', 0, 0, 1, '-2059.01,889.37,61.86', '-2059.01,889.37,61.86', 221, 20, 0, 1500, '2017-01-01', '2016-12-03 13:51:53', 1),
(23, 'Dom', 0, 0, 5, '-2099.58,897.36,76.71', '-2099.58,897.36,76.71', 221, 26, 0, 5000, '2016-12-04', '2016-12-02 16:41:05', 1),
(24, 'Dom', 0, 0, 31, '-2018.55,865.88,45.45', '-2018.55,865.88,45.45', 221, 727, 1, 1000, '2017-01-01', '2016-12-02 16:52:57', 1),
(25, 'Dom', 0, 0, 0, '-2018.55,849.41,45.45', '-2018.55,849.41,45.45', 221, 1794, 1, 1000, '2016-12-09', '2016-12-02 17:00:22', 1),
(26, 'Dom', 0, 0, 31, '-2018.55,832.05,45.45', '-2018.55,832.05,45.45', 221, 1890, 1, 1000, '2022-07-24', '2016-12-02 16:59:50', 1),
(27, 'Dom', 0, 0, 31, '-2029.80,820.69,49.47', '-2029.80,820.69,49.47', 221, 1404, 1, 1000, '2017-01-01', '2016-12-02 17:28:20', 1),
(28, 'Dom', 0, 0, 31, '-2048.17,820.69,57.03', '-2048.17,820.69,57.03', 221, 787, 0, 1000, '2017-03-12', '2016-12-03 13:36:55', 1),
(29, 'Dom', 0, 0, 31, '-2066.48,820.69,64.92', '-2066.48,820.69,64.92', 221, 1238, 1, 1000, '2016-12-16', '2016-12-02 16:59:50', 1),
(30, 'Dom', 0, 0, 31, '-2094.31,823.56,69.56', '-2094.31,823.56,69.56', 221, 1750, 1, 1000, '2016-12-09', '2016-12-02 16:59:50', 1),
(31, 'Dom', 0, 0, 31, '-2112.41,823.55,69.56', '-2112.41,823.55,69.56', 221, 2313, 0, 1000, '2017-01-31', '2016-12-03 11:56:32', 1),
(32, 'Dom', 0, 0, 31, '-2126.05,832.80,69.56', '-2126.05,832.80,69.56', 221, 2337, 1, 1000, '2017-06-24', '2016-12-02 16:59:50', 1),
(33, 'Dom', 0, 0, 31, '-2129.23,894.85,80.00', '-2129.23,894.85,80.00', 221, 2337, 1, 1000, '2016-12-07', '2016-12-02 17:06:37', 1),
(34, 'Dom', 0, 0, 31, '-2129.63,942.56,80.00', '-2129.63,942.56,80.00', 221, 991, 1, 1000, '2016-12-07', '2016-12-02 17:08:17', 1),
(35, 'Dom', 0, 0, 31, '-2126.43,978.50,80.01', '-2126.43,978.50,80.01', 221, 545, 1, 1000, '2017-11-27', '2016-12-02 17:54:07', 1),
(36, 'Dom', 0, 0, 31, '-2126.43,1014.32,80.01', '-2126.43,1014.32,80.01', 221, 806, 1, 1000, '2017-09-28', '2016-12-02 17:59:37', 1),
(37, 'Dom', 0, 0, 31, '-2126.43,1032.55,80.01', '-2126.43,1032.55,80.01', 221, 898, 1, 1000, '2016-12-04', '2016-12-02 17:30:41', 1),
(38, 'Dom', 0, 0, 31, '-2126.43,1050.99,80.01', '-2126.43,1050.99,80.01', 221, 898, 1, 1000, '2016-12-09', '2016-12-02 17:31:01', 1),
(39, 'Dom', 0, 0, 31, '-2126.43,1087.60,80.01', '-2126.43,1087.60,80.01', 221, 1238, 1, 1000, '2016-12-30', '2016-12-02 17:22:13', 1),
(40, 'Dom', 0, 0, 50, '-2521.27,-624.95,132.78', '-2521.27,-624.95,132.78', 221, 2265, 1, 50000, '2017-01-26', '2016-12-02 23:39:25', 1),
(41, 'Dom', 0, 0, 40, '-2657.40,848.61,64.01', '-2657.40,848.61,64.01', 40, 2268, 1, 2500, '2016-12-28', '2016-12-03 13:03:03', 1),
(42, 'Dom', 0, 0, NULL, '-2031.89,-251.45,35.92', '-2031.89,-251.45,35.92', 50, 8, 1, 5000, '4481-01-05', '2016-12-03 13:04:15', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lss_interiory`
--

CREATE TABLE IF NOT EXISTS `lss_interiory` (
`id` int(10) unsigned NOT NULL,
  `interior` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entrance` varchar(64) NOT NULL COMMENT 'x,y,z,a - miejsce gdzie pojawi sie gracz po wejsciu',
  `exit` varchar(64) DEFAULT NULL COMMENT 'x,y,z - miejsce gdzie bedzie marker wyjscia',
  `opis` varchar(64) DEFAULT NULL COMMENT 'opis do wyszukiwarki',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `dimension` int(10) unsigned DEFAULT NULL,
  `koszt` mediumint(8) unsigned NOT NULL DEFAULT '5000',
  `notes` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ms_organizacje`
--

CREATE TABLE IF NOT EXISTS `ms_organizacje` (
  `code` varchar(31) CHARACTER SET utf16 COLLATE utf16_polish_ci NOT NULL,
  `login` varchar(121) CHARACTER SET utf16 COLLATE utf16_polish_ci NOT NULL,
  `uid` int(11) NOT NULL,
  `actived` date NOT NULL,
  `rank` int(5) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `ms_organizacje`
--

--
-- Struktura tabeli dla tabeli `ogrpg_jobs`
--

CREATE TABLE IF NOT EXISTS `ogrpg_jobs` (
  `code` varchar(120) NOT NULL,
  `uid` int(11) NOT NULL,
  `actived` date NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NULL` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `ogrpg_office` (
`dodatek` int(11) NOT NULL,
  `code` text NOT NULL,
  `name` text NOT NULL,
  `spaces` int(11) NOT NULL DEFAULT '0',
  `maxspaces` int(11) NOT NULL DEFAULT '0',
  `reputation` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `ogrpg_office`
--

INSERT INTO `ogrpg_office` (`dodatek`, `code`, `name`, `spaces`, `maxspaces`, `reputation`) VALUES
(1, 'tuner-sf', 'Tuner Garcia SF', 50, 50, 2500);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pseudonim`
--

CREATE TABLE IF NOT EXISTS `pseudonim` (
  `prawdziwylogin` text COLLATE utf8_unicode_ci NOT NULL,
  `login` text COLLATE utf8_unicode_ci NOT NULL,
  `zmienilna` text COLLATE utf8_unicode_ci NOT NULL,
  `kiedy` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE IF NOT EXISTS `pystories_admins` (
`osoba` int(255) NOT NULL,
  `serial` text NOT NULL,
  `date` text NOT NULL,
  `level` tinyint(1) NOT NULL,
  `actived` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Struktura tabeli dla tabeli `pystories_ban`
--

CREATE TABLE IF NOT EXISTS `pystories_ban` (
  `serial` text NOT NULL,
  `reason` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `type` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
`osoba` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_donates`
--

CREATE TABLE IF NOT EXISTS `pystories_donates` (
  `type` varchar(244) NOT NULL,
  `money` int(43) NOT NULL,
  `-` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_factions`
--

CREATE TABLE IF NOT EXISTS `pystories_factions` (
`-` int(255) NOT NULL,
  `code` varchar(125) CHARACTER SET utf16 COLLATE utf16_polish_ci NOT NULL,
  `sid` int(11) NOT NULL,
  `actived` date NOT NULL,
  `rank` int(5) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_jobs`
--

CREATE TABLE IF NOT EXISTS `pystories_jobs` (
  `code` varchar(120) NOT NULL,
  `uid` int(11) NOT NULL,
  `actived` date NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NULL` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_logs`
--

CREATE TABLE IF NOT EXISTS `pystories_logs` (
  `name` text CHARACTER SET latin1,
  `osoba` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_logs_login`
--

CREATE TABLE IF NOT EXISTS `pystories_logs_login` (
  `name` text CHARACTER SET latin1,
  `serial` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `pystories_logs_login`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_office`
--

CREATE TABLE IF NOT EXISTS `pystories_office` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` text NOT NULL,
  `spaces` int(11) NOT NULL DEFAULT '5',
  `maxspaces` int(11) NOT NULL DEFAULT '0',
  `reputation` int(11) NOT NULL,
`-` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_punish`
--

CREATE TABLE IF NOT EXISTS `pystories_punish` (
`kolejnosc` int(11) NOT NULL,
  `serial` text NOT NULL,
  `reason` text CHARACTER SET utf8 NOT NULL,
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `type` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_serials`
--

CREATE TABLE IF NOT EXISTS `pystories_serials` (
  `nick` text COLLATE utf8_polish_ci NOT NULL,
  `serial` text COLLATE utf8_polish_ci NOT NULL,
`-` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_users`
--

CREATE TABLE IF NOT EXISTS `pystories_users` (
`id` int(11) NOT NULL,
  `login` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `login2` text,
  `pass` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `money` int(11) NOT NULL DEFAULT '0',
  `bank_money` int(25) NOT NULL DEFAULT '0',
  `skin` int(11) NOT NULL DEFAULT '0',
  `weave` int(11) NOT NULL DEFAULT '50',
  `srp` int(11) NOT NULL DEFAULT '0',
  `pjA` int(11) NOT NULL DEFAULT '0',
  `pjB` int(11) NOT NULL DEFAULT '0',
  `pjC` int(11) NOT NULL DEFAULT '0',
  `pjL` int(11) NOT NULL DEFAULT '0',
  `pjT` int(11) NOT NULL DEFAULT '0',
  `worker` int(11) NOT NULL DEFAULT '0',
  `hours` int(12) NOT NULL,
  `mandate` int(10) NOT NULL DEFAULT '0',
  `registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `register_serial` varchar(120) DEFAULT NULL,
  `premiumdate` date NOT NULL DEFAULT '0000-00-00',
  `changedpw` tinyint(1) NOT NULL DEFAULT '0',
  `premium` tinyint(1) NOT NULL DEFAULT '0',
  `mute` tinyint(1) NOT NULL DEFAULT '0',
  `code` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_vehicles`
--

CREATE TABLE IF NOT EXISTS `pystories_vehicles` (
`id` int(11) NOT NULL,
  `model` int(11) NOT NULL DEFAULT '411',
  `frozen` int(11) NOT NULL DEFAULT '0',
  `pos` varchar(82) NOT NULL DEFAULT '0, 0, 0, 0, 0, 0',
  `text` text CHARACTER SET utf32 COLLATE utf32_polish_ci NOT NULL,
  `health` int(11) NOT NULL DEFAULT '1000',
  `fuel` int(11) NOT NULL DEFAULT '100',
  `mileage` int(11) NOT NULL DEFAULT '0',
  `driver` text NOT NULL,
  `color` varchar(50) NOT NULL DEFAULT '255, 255, 255',
  `headlights` varchar(41) NOT NULL DEFAULT '255, 255, 255',
  `paintjob` tinyint(1) NOT NULL DEFAULT '3',
  `tuning` text NOT NULL,
  `panelstates` text NOT NULL,
  `rent` varchar(255) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT '0',
  `plateText` text NOT NULL,
  `ownedPlayer` int(11) NOT NULL DEFAULT '0',
  `ownedGroup` varchar(111) NOT NULL,
  `parking` int(11) NOT NULL DEFAULT '0',
  `police` tinyint(2) NOT NULL DEFAULT '0',
  `neon` int(11) NOT NULL DEFAULT '0',
  `blokada` text NOT NULL,
  `registered` varchar(10) NOT NULL DEFAULT 'true',
  `tp_to_parking` varchar(99) DEFAULT NULL,
  `rh` tinyint(1) NOT NULL DEFAULT '0',
  `mk2` tinyint(1) NOT NULL DEFAULT '0',
  `mk1` tinyint(1) NOT NULL DEFAULT '0',
  `naped` tinyint(1) NOT NULL DEFAULT '0',
  `engine` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_vehicles_parking`
--

CREATE TABLE IF NOT EXISTS `pystories_vehicles_parking` (
  `idparking` int(11) NOT NULL,
  `idpojazdu` int(20) NOT NULL,
  `funkcjonariusz` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `rejestracja` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `powod` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `cena` int(10) NOT NULL DEFAULT '10'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `kody`
--
ALTER TABLE `kody`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lss_domy`
--
ALTER TABLE `lss_domy`
 ADD PRIMARY KEY (`id`), ADD KEY `ownerid` (`ownerid`);

--
-- Indexes for table `lss_interiory`
--
ALTER TABLE `lss_interiory`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ms_organizacje`
--
ALTER TABLE `ms_organizacje`
 ADD UNIQUE KEY `uid` (`uid`), ADD UNIQUE KEY `uid_2` (`uid`), ADD KEY `code` (`uid`,`actived`);

--
-- Indexes for table `ogrpg_jobs`
--
ALTER TABLE `ogrpg_jobs`
 ADD UNIQUE KEY `NULL` (`NULL`), ADD KEY `code` (`code`,`uid`,`actived`,`added`), ADD KEY `code_2` (`code`);

--
-- Indexes for table `ogrpg_office`
--
ALTER TABLE `ogrpg_office`
 ADD PRIMARY KEY (`dodatek`);

--
-- Indexes for table `pystories_admins`
--
ALTER TABLE `pystories_admins`
 ADD PRIMARY KEY (`osoba`);

--
-- Indexes for table `pystories_ban`
--
ALTER TABLE `pystories_ban`
 ADD PRIMARY KEY (`osoba`);

--
-- Indexes for table `pystories_factions`
--
ALTER TABLE `pystories_factions`
 ADD PRIMARY KEY (`-`), ADD KEY `code` (`actived`);

--
-- Indexes for table `pystories_jobs`
--
ALTER TABLE `pystories_jobs`
 ADD UNIQUE KEY `NULL` (`NULL`), ADD KEY `code` (`code`,`uid`,`actived`,`added`), ADD KEY `code_2` (`code`);

--
-- Indexes for table `pystories_office`
--
ALTER TABLE `pystories_office`
 ADD PRIMARY KEY (`-`);

--
-- Indexes for table `pystories_punish`
--
ALTER TABLE `pystories_punish`
 ADD PRIMARY KEY (`kolejnosc`);

--
-- Indexes for table `pystories_serials`
--
ALTER TABLE `pystories_serials`
 ADD PRIMARY KEY (`-`);

--
-- Indexes for table `pystories_users`
--
ALTER TABLE `pystories_users`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pystories_vehicles`
--
ALTER TABLE `pystories_vehicles`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `kody`
--
ALTER TABLE `kody`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT dla tabeli `lss_domy`
--
ALTER TABLE `lss_domy`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=89;
--
-- AUTO_INCREMENT dla tabeli `lss_interiory`
--
ALTER TABLE `lss_interiory`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT2129;
--
-- AUTO_INCREMENT dla tabeli `ogrpg_office`
--
ALTER TABLE `ogrpg_office`
MODIFY `dodatek` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT dla tabeli `pystories_admins`
--
ALTER TABLE `pystories_admins`
MODIFY `osoba` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `pystories_ban`
--
ALTER TABLE `pystories_ban`
MODIFY `osoba` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `pystories_factions`
--
ALTER TABLE `pystories_factions`
MODIFY `-` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `pystories_office`
--
ALTER TABLE `pystories_office`
MODIFY `-` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `pystories_punish`
--
ALTER TABLE `pystories_punish`
MODIFY `kolejnosc` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `pystories_serials`
--
ALTER TABLE `pystories_serials`
MODIFY `-` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `pystories_users`
--
ALTER TABLE `pystories_users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `pystories_vehicles`
--
ALTER TABLE `pystories_vehicles`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
