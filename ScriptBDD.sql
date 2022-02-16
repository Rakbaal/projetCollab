-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 31 jan. 2022 à 07:23
-- Version du serveur :  5.7.31
-- Version de PHP :  7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `jeuxvideo`
--
CREATE DATABASE IF NOT EXISTS `jeuxvideo` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `jeuxvideo`;

-- --------------------------------------------------------

--
-- Structure de la table `ajouter`
--

DROP TABLE IF EXISTS `ajouter`;
CREATE TABLE IF NOT EXISTS `ajouter` (
  `JV_ID` int(11) NOT NULL,
  `Util_ID` int(11) NOT NULL,
  PRIMARY KEY (`JV_ID`,`Util_ID`),
  KEY `FK_AJOUTER_UTILISATEUR` (`Util_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `appartenir`
--

DROP TABLE IF EXISTS `appartenir`;
CREATE TABLE IF NOT EXISTS `appartenir` (
  `JV_ID` int(11) NOT NULL,
  `Cons_ID` int(11) NOT NULL,
  PRIMARY KEY (`JV_ID`,`Cons_ID`),
  KEY `FK_APPARTENIR_CONSOLE` (`Cons_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `console`
--

DROP TABLE IF EXISTS `console`;
CREATE TABLE IF NOT EXISTS `console` (
  `Id` int(11) NOT NULL,
  `Libelle` varchar(38) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `console`
--

INSERT INTO `console` (`Id`, `Libelle`) VALUES
(1, 'Playstation2'),
(2, 'Xbox360');

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Libelle` varchar(38) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`ID`, `Libelle`) VALUES
(1, 'Role Playing Game (RPG)'),
(2, 'First Person Shooter (FPS)');

-- --------------------------------------------------------

--
-- Structure de la table `jeuxvideos`
--

DROP TABLE IF EXISTS `jeuxvideos`;
CREATE TABLE IF NOT EXISTS `jeuxvideos` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Titre` varchar(38) NOT NULL,
  `Editeur` varchar(38) NOT NULL,
  `Genre` int(11) NOT NULL,
  `Histoire` varchar(500) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Genre` (`Genre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `jeuxvideos`
--

INSERT INTO `jeuxvideos` (`Id`, `Titre`, `Editeur`, `Genre`, `Histoire`) VALUES
(1, 'Skyrim', 'Bethesda', 1, ''),
(2, 'Call of Duty Modern Warfare', 'Activision', 2, '');

-- --------------------------------------------------------

--
-- Structure de la table `noter`
--

DROP TABLE IF EXISTS `noter`;
CREATE TABLE IF NOT EXISTS `noter` (
  `JV_ID` int(11) NOT NULL,
  `Util_ID` int(11) NOT NULL,
  `Note` int(11) NOT NULL,
  PRIMARY KEY (`JV_ID`,`Util_ID`),
  KEY `FK_NOTER_UTILISATEUR` (`Util_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Login` varchar(64) NOT NULL,
  `MDP` varchar(64) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`Id`, `Login`, `MDP`) VALUES
(1, '75053007d048c807ac86c25f4dede8cc1f24d09ed241b7ddd1dfaa95f6bc758d', '757d61af50ed405ee50c43b41cf5a6528511595eca68afb1cc1c8f780d710e75');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ajouter`
--
ALTER TABLE `ajouter`
  ADD CONSTRAINT `FK_AJOUTER_JEUXVIDEO` FOREIGN KEY (`JV_ID`) REFERENCES `jeuxvideos` (`Id`),
  ADD CONSTRAINT `FK_AJOUTER_UTILISATEUR` FOREIGN KEY (`Util_ID`) REFERENCES `utilisateur` (`Id`);

--
-- Contraintes pour la table `appartenir`
--
ALTER TABLE `appartenir`
  ADD CONSTRAINT `FK_APPARTENIR_CONSOLE` FOREIGN KEY (`Cons_ID`) REFERENCES `console` (`Id`),
  ADD CONSTRAINT `FK_APPARTENIR_JEUXVIDEO` FOREIGN KEY (`JV_ID`) REFERENCES `jeuxvideos` (`Id`);

--
-- Contraintes pour la table `jeuxvideos`
--
ALTER TABLE `jeuxvideos`
  ADD CONSTRAINT `FK_Genre` FOREIGN KEY (`Genre`) REFERENCES `genre` (`ID`);

--
-- Contraintes pour la table `noter`
--
ALTER TABLE `noter`
  ADD CONSTRAINT ` FK_NOTER_JEUXVIDEO` FOREIGN KEY (`JV_ID`) REFERENCES `jeuxvideos` (`Id`),
  ADD CONSTRAINT `FK_NOTER_UTILISATEUR` FOREIGN KEY (`Util_ID`) REFERENCES `utilisateur` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
