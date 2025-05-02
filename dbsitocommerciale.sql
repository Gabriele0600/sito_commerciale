-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              10.4.32-MariaDB - mariadb.org binary distribution
-- S.O. server:                  Win64
-- HeidiSQL Versione:            12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dump della struttura del database DbSitoVetrina
CREATE DATABASE IF NOT EXISTS `dbsitovetrina` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `DbSitoVetrina`;

-- Dump della struttura di tabella DbSitoVetrina.categorie
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella DbSitoVetrina.categorie: ~1 rows (circa)
REPLACE INTO `categorie` (`id`, `nome`) VALUES
	(1, 'magliette baggy');

-- Dump della struttura di tabella DbSitoVetrina.prodotti
CREATE TABLE IF NOT EXISTS `prodotti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `descrizione` varchar(500) DEFAULT NULL,
  `prezzo` decimal(10,2) DEFAULT NULL,
  `media` varchar(255) DEFAULT NULL,
  `disponibilita` tinyint(1) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `sezione` enum('top','trending','bottom') DEFAULT 'bottom',
  `ordine_visualizzazione` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `prodotti_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella DbSitoVetrina.prodotti: ~7 rows (circa)
REPLACE INTO `prodotti` (`id`, `nome`, `descrizione`, `prezzo`, `media`, `disponibilita`, `categoria_id`, `sezione`, `ordine_visualizzazione`) VALUES
	(1, 'Maglietta casual', 'maglietta rossa e bianca con il numero 66', 9.20, 'uploads/maglietta_66.png', 1, 1, 'trending', 0),
	(2, 'Maglietta a Maniche Corte', 'maglietta bianca semplice', 7.03, 'uploads/maglietta_bianca.png', 1, 1, 'bottom', 0),
	(3, 'Maglietta nera con stampa Italia', 'maglietta nera con stmpa italia', 8.54, 'uploads/maglietta_stampa_ita.png', 1, 1, 'trending', 0),
	(4, 'Scarpa Air Max', 'Scarpa Air Max nuova', 145.99, 'uploads/nike_video.mp4', 1, 1, 'top', 0),
	(5, 'Maglioncino Polo', 'Maglioncino polo', 12.90, 'upload/maglioncini.png', 1, 1, 'trending', 0),
	(6, 'Camicia verde', 'Camicia verde ottimo tessuto', 10.80, 'upload/camicia_verde.png', 1, 1, 'trending', 0),
	(7, 'Giubbotto', 'Giubbotto uomo blu', 13.95, 'upload/giubbotto_uomo.png', 1, 1, 'trending', 1);

-- Dump della struttura di tabella DbSitoVetrina.utenti
CREATE TABLE IF NOT EXISTS `utenti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password_utente` varchar(255) DEFAULT NULL,
  `data_registrazione` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella DbSitoVetrina.utenti: ~0 rows (circa)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
