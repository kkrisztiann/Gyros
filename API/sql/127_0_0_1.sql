-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Már 14. 11:56
-- Kiszolgáló verziója: 10.4.6-MariaDB
-- PHP verzió: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `2123szft_mrgyros`
--
CREATE DATABASE IF NOT EXISTS `2123szft_mrgyros` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `2123szft_mrgyros`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `etelek`
--

CREATE TABLE `etelek` (
  `ID` int(11) NOT NULL,
  `nev` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `ar` int(11) NOT NULL,
  `osszetevok` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `kep` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `etelek`
--

INSERT INTO `etelek` (`ID`, `nev`, `ar`, `osszetevok`, `kep`) VALUES
(1, 'Csípős gyros pitában', 1800, 'Pita, Gyros hús, Lilahagyma, Vöröshagyma, Chili, Paradicsom, Szósz', 'CsiposGyros.png'),
(2, 'Gyros pitában', 1700, 'Pita, Gyros hús, Lilahagyma, Vöröshagyma, Paradicsom, Szósz', 'Gyros.png'),
(4, 'Krisztián Pitája', 800, 'Krisztián, Pita ', 'KrisztianPita.png'),
(5, 'Krisztián Kedvence', 1500, 'Krisztián, Gyros pitában, Titkos szósz', 'KrisztianPicsa.png');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kapcsolat`
--

CREATE TABLE `kapcsolat` (
  `ID` int(11) NOT NULL,
  `rendelesekID` int(11) NOT NULL,
  `etelekID` int(11) NOT NULL,
  `mennyiseg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `kapcsolat`
--

INSERT INTO `kapcsolat` (`ID`, `rendelesekID`, `etelekID`, `mennyiseg`) VALUES
(1, 1, 1, 3),
(2, 2, 2, 2),
(10, 27, 2, 2),
(11, 28, 1, 12),
(12, 28, 2, 2),
(13, 28, 5, 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendelesek`
--

CREATE TABLE `rendelesek` (
  `ID` int(11) NOT NULL,
  `nev` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `telefonszam` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  `cim` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `megjegyzes` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `kiszallitva` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `rendelesek`
--

INSERT INTO `rendelesek` (`ID`, `nev`, `telefonszam`, `cim`, `megjegyzes`, `kiszallitva`) VALUES
(1, 'Kerék Ádám', '06206969696', '6300 Baja, bácska tér 1.', 'Két thai masszőrt is dobjanak mellé', 1),
(2, 'Kertész Krisztián', '06206459696', '6300 Baja, bácska tér 2.', 'Két férfi thai masszőrt is dobjanak mellé', 0),
(26, 'sdds', 'sddssd', 'sddsds', 'sdsdsd', 0),
(27, 'a', 'a', 'a', 'a', 0),
(28, 'a', 'a', 'a', 'a', 0);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `etelek`
--
ALTER TABLE `etelek`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `kapcsolat`
--
ALTER TABLE `kapcsolat`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `rendelesekID` (`rendelesekID`,`etelekID`),
  ADD KEY `etelekID` (`etelekID`);

--
-- A tábla indexei `rendelesek`
--
ALTER TABLE `rendelesek`
  ADD PRIMARY KEY (`ID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `etelek`
--
ALTER TABLE `etelek`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `kapcsolat`
--
ALTER TABLE `kapcsolat`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT a táblához `rendelesek`
--
ALTER TABLE `rendelesek`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `kapcsolat`
--
ALTER TABLE `kapcsolat`
  ADD CONSTRAINT `kapcsolat_ibfk_1` FOREIGN KEY (`rendelesekID`) REFERENCES `rendelesek` (`ID`),
  ADD CONSTRAINT `kapcsolat_ibfk_2` FOREIGN KEY (`etelekID`) REFERENCES `etelek` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
