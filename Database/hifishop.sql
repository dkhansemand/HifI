-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Vært: 127.0.0.1
-- Genereringstid: 07. 03 2017 kl. 14:46:18
-- Serverversion: 5.6.24
-- PHP-version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hanssonsjjsocial`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `hifi_category`
--

CREATE TABLE IF NOT EXISTS `hifi_category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(28) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Data dump for tabellen `hifi_category`
--

INSERT INTO `hifi_category` (`id`, `categoryName`) VALUES
(1, 'Cd-afspillere'),
(5, 'Effektforstærkere'),
(4, 'Forforstærkere'),
(6, 'Højtalere'),
(3, 'Int. Forstærkere'),
(2, 'Pladespillere');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `hifi_contactmessages`
--

CREATE TABLE IF NOT EXISTS `hifi_contactmessages` (
  `id` int(11) NOT NULL,
  `fullname` varchar(64) NOT NULL,
  `email` varchar(192) NOT NULL,
  `subject` varchar(64) NOT NULL,
  `message` text NOT NULL,
  `submitDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `hifi_manufacturers`
--

CREATE TABLE IF NOT EXISTS `hifi_manufacturers` (
  `id` int(11) NOT NULL,
  `manufactureName` varchar(48) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Data dump for tabellen `hifi_manufacturers`
--

INSERT INTO `hifi_manufacturers` (`id`, `manufactureName`) VALUES
(6, 'Boesendorfer'),
(1, 'Creek'),
(2, 'Exsposure'),
(3, 'Harbeth'),
(7, 'Jolida'),
(4, 'Manley'),
(8, 'Parasound'),
(5, 'Pro_ject');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `hifi_menu`
--

CREATE TABLE IF NOT EXISTS `hifi_menu` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `menupath` varchar(45) DEFAULT NULL,
  `isVisible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `hifi_news`
--

CREATE TABLE IF NOT EXISTS `hifi_news` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `pictureId` int(11) NOT NULL,
  `dateAdded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `hifi_pictures`
--

CREATE TABLE IF NOT EXISTS `hifi_pictures` (
  `id` int(11) NOT NULL,
  `filename` varchar(256) NOT NULL,
  `dateAdded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(128) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

--
-- Data dump for tabellen `hifi_pictures`
--

INSERT INTO `hifi_pictures` (`id`, `filename`, `dateAdded`, `title`) VALUES
(1, 'noProduct.png', '2017-03-07 12:02:13', 'noProduct.png'),
(5, 'Creek_OBH_22_Passive_Preamp.jpg', '2017-03-07 12:02:11', 'Creek_OBH_22_Passive_Preamp.jpg'),
(6, 'Exp_2010S_CD.gif', '2017-03-07 12:02:12', 'Exp_2010S_CD.gif'),
(7, 'Manley_Stingray.jpg', '2017-03-07 12:02:12', 'Manley_Stingray.jpg'),
(8, 'Pro_ject_Debut_3_bl.jpg', '2017-03-07 12:02:12', 'Pro_ject_Debut_3_bl.jpg'),
(9, 'Pro_ject_Debut_III_red_1.jpg', '2017-03-07 12:02:12', 'Pro_ject_Debut_III_red_1.jpg'),
(10, 'Pro_ject_Debut_III_yellow_1.jpg', '2017-03-07 12:02:12', 'Pro_ject_Debut_III_yellow_1.jpg'),
(11, 'Pro_ject_rpm10.jpg', '2017-03-07 12:02:12', 'Pro_ject_rpm10.jpg'),
(12, 'Pro_ject_rpm_5.jpg', '2017-03-07 12:02:12', 'Pro_ject_rpm_5.jpg'),
(13, 'Project_prebox.jpg', '2017-03-07 12:02:12', 'Project_prebox.jpg'),
(14, 'boesendorfer_vcs_wall.gif', '2017-03-07 12:02:12', 'boesendorfer_vcs_wall.gif'),
(15, 'creek_Destiny_CD.jpg', '2017-03-07 12:02:12', 'creek_Destiny_CD.jpg'),
(16, 'creek_a50I.jpg', '2017-03-07 12:02:12', 'creek_a50I.jpg'),
(17, 'creek_classic.jpg', '2017-03-07 12:02:12', 'creek_classic.jpg'),
(18, 'creek_classic5350SE.jpg', '2017-03-07 12:02:12', 'creek_classic5350SE.jpg'),
(19, 'creek_classic_cd.jpg', '2017-03-07 12:02:12', 'creek_classic_cd.jpg'),
(20, 'creek_destinyamp.jpg', '2017-03-07 12:02:12', 'creek_destinyamp.jpg'),
(21, 'creek_evo_cd.jpg', '2017-03-07 12:02:12', 'creek_evo_cd.jpg'),
(22, 'epos_m5.gif', '2017-03-07 12:02:12', 'epos_m5.gif'),
(23, 'exposure_2010S.jpg', '2017-03-07 12:02:12', 'exposure_2010S.jpg'),
(24, 'harbeth_hl7es2.jpg', '2017-03-07 12:02:12', 'harbeth_hl7es2.jpg'),
(25, 'harbeth_monitor30.jpg', '2017-03-07 12:02:12', 'harbeth_monitor30.jpg'),
(26, 'harbeth_p3es2.jpg', '2017-03-07 12:02:12', 'harbeth_p3es2.jpg'),
(27, 'jolida_JD102b.jpg', '2017-03-07 12:02:13', 'jolida_JD102b.jpg'),
(28, 'jolida_JD202a.jpg', '2017-03-07 12:02:13', 'jolida_JD202a.jpg'),
(29, 'jolida_JD300b.jpg', '2017-03-07 12:02:13', 'jolida_JD300b.jpg'),
(30, 'jolida_JD302b.jpg', '2017-03-07 12:02:13', 'jolida_JD302b.jpg'),
(31, 'manley_mahi.jpg', '2017-03-07 12:02:13', 'manley_mahi.jpg'),
(32, 'manley_neoclassic300b.jpg', '2017-03-07 12:02:13', 'manley_neoclassic300b.jpg'),
(33, 'manley_snapper.jpg', '2017-03-07 12:02:13', 'manley_snapper.jpg'),
(35, 'parasound_classic7100.jpg', '2017-03-07 12:02:13', 'parasound_classic7100.jpg'),
(36, 'parasound_d200.jpg', '2017-03-07 12:02:13', 'parasound_d200.jpg'),
(37, 'parasound_haloa23.jpg', '2017-03-07 12:02:13', 'parasound_haloa23.jpg'),
(38, 'parasound_halod3.jpg', '2017-03-07 12:02:13', 'parasound_halod3.jpg'),
(39, 'parasound_halop3.jpg', '2017-03-07 12:02:13', 'parasound_halop3.jpg');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `hifi_products`
--

CREATE TABLE IF NOT EXISTS `hifi_products` (
  `pid` int(11) NOT NULL,
  `productTitle` varchar(48) NOT NULL,
  `productDetails` text NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `manufacturerId` int(11) NOT NULL,
  `dateAdded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `productPicture` int(11) NOT NULL DEFAULT '1',
  `categoryId` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Data dump for tabellen `hifi_products`
--

INSERT INTO `hifi_products` (`pid`, `productTitle`, `productDetails`, `price`, `manufacturerId`, `dateAdded`, `productPicture`, `categoryId`) VALUES
(1, 'Evolution CD', 'bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat.', '5495.00', 1, '2017-03-07 08:55:32', 21, 1),
(2, 'Classic CD', 'bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat.', '9995.00', 1, '2017-03-07 08:55:32', 19, 1),
(3, '2010 S CD', 'bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat.', '6995.00', 2, '2017-03-07 08:55:32', 6, 1);

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `hifi_category`
--
ALTER TABLE `hifi_category`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `categoryName_UNIQUE` (`categoryName`);

--
-- Indeks for tabel `hifi_contactmessages`
--
ALTER TABLE `hifi_contactmessages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `hifi_manufacturers`
--
ALTER TABLE `hifi_manufacturers`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name_UNIQUE` (`manufactureName`);

--
-- Indeks for tabel `hifi_menu`
--
ALTER TABLE `hifi_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `hifi_news`
--
ALTER TABLE `hifi_news`
  ADD PRIMARY KEY (`id`), ADD KEY `fk_pictureId_idx` (`pictureId`);

--
-- Indeks for tabel `hifi_pictures`
--
ALTER TABLE `hifi_pictures`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `hifi_products`
--
ALTER TABLE `hifi_products`
  ADD PRIMARY KEY (`pid`), ADD KEY `fk_category_idx` (`categoryId`), ADD KEY `fk_productPicture_idx` (`productPicture`), ADD KEY `fk_manufactor_idx` (`manufacturerId`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `hifi_category`
--
ALTER TABLE `hifi_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- Tilføj AUTO_INCREMENT i tabel `hifi_contactmessages`
--
ALTER TABLE `hifi_contactmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `hifi_manufacturers`
--
ALTER TABLE `hifi_manufacturers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- Tilføj AUTO_INCREMENT i tabel `hifi_menu`
--
ALTER TABLE `hifi_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `hifi_news`
--
ALTER TABLE `hifi_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `hifi_pictures`
--
ALTER TABLE `hifi_pictures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- Tilføj AUTO_INCREMENT i tabel `hifi_products`
--
ALTER TABLE `hifi_products`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Begrænsninger for dumpede tabeller
--

--
-- Begrænsninger for tabel `hifi_news`
--
ALTER TABLE `hifi_news`
ADD CONSTRAINT `fk_pictureId` FOREIGN KEY (`pictureId`) REFERENCES `hifi_pictures` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Begrænsninger for tabel `hifi_products`
--
ALTER TABLE `hifi_products`
ADD CONSTRAINT `fk_category` FOREIGN KEY (`categoryId`) REFERENCES `hifi_category` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_manufactor` FOREIGN KEY (`manufacturerId`) REFERENCES `hifi_manufacturers` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_productPicture` FOREIGN KEY (`productPicture`) REFERENCES `hifi_pictures` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
