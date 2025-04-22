CREATE DATABASE  IF NOT EXISTS `kondo-v2-transactions` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `kondo-v2-transactions`;
-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (x86_64)
--
-- Host: 127.0.0.1    Database: kondo-v2-transactions
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actifs`
--

DROP TABLE IF EXISTS `actifs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actifs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_actif_id` int NOT NULL,
  `nom_actif` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_actif_id` (`type_actif_id`),
  CONSTRAINT `actifs_ibfk_1` FOREIGN KEY (`type_actif_id`) REFERENCES `types_actif` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actifs`
--

LOCK TABLES `actifs` WRITE;
/*!40000 ALTER TABLE `actifs` DISABLE KEYS */;
INSERT INTO `actifs` VALUES (1,1,'EURUSD'),(2,1,'USDJPY'),(3,1,'GBPUSD'),(4,1,'USDCHF'),(5,1,'USDCAD'),(6,1,'NZDUSD'),(7,1,'EURGBP'),(8,1,'EURJPY'),(9,1,'EURAUD'),(10,1,'EURCAD'),(11,1,'EURCHF'),(12,1,'EURNZD'),(13,1,'GBPJPY'),(14,1,'GBPAUD'),(15,1,'GBPCAD'),(16,1,'GBPNZD'),(17,1,'GBPCHF'),(18,1,'AUDJPY'),(19,1,'AUDCAD'),(20,1,'AUDCHF'),(21,1,'AUDNZD'),(22,1,'CADJPY'),(23,1,'CADCHF'),(24,1,'CHFJPY'),(25,1,'NZDJPY'),(26,1,'NZDCAD'),(27,1,'NZDCHF'),(28,2,'GOLD'),(29,3,'GER40'),(30,3,'JP225'),(31,3,'NAS100'),(32,3,'SPX'),(33,3,'US30'),(34,4,'AAPL'),(35,4,'TSLA'),(36,4,'LVMHF'),(37,4,'AMZN'),(38,4,'GOOG'),(39,4,'META'),(40,4,'MSFT'),(41,4,'NFLX'),(42,4,'NVDA'),(43,4,'PPE'),(44,4,'T'),(45,4,'V'),(46,4,'WMT'),(47,4,'RACE'),(48,2,'KC1! | COFFEE'),(49,2,'CORN'),(50,2,'COCOAH2025'),(51,2,'WHEAT'),(52,2,'SILVER'),(53,1,'AUDUSD'),(54,2,'UKOUSD'),(55,2,'COTTON'),(56,2,'SUGARK2025');
/*!40000 ALTER TABLE `actifs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observations`
--

DROP TABLE IF EXISTS `observations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `observations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_id` int NOT NULL,
  `contenu` text NOT NULL,
  `date_ajout` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  CONSTRAINT `observations_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions_backtest` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observations`
--

LOCK TABLES `observations` WRITE;
/*!40000 ALTER TABLE `observations` DISABLE KEYS */;
INSERT INTO `observations` VALUES (15,1,'J\'ai essayé d\'entrer plusieurs transactions et ca à bien marché mais c\'est comme s\'il faut que je sois collé à l\'ecran ','2025-01-31 01:21:50'),(16,7,'je cherche à voir si le scalping marche en m15','2025-01-31 01:30:12'),(22,1,'J\'ai fais un constat, je dois mettre en application','2025-02-14 16:18:59'),(23,1,'scalper en m5 doit etre un bon plan','2025-02-14 18:42:39'),(24,6,'hello','2025-02-14 18:58:14'),(29,6,'La endance n\'est pzs vraiment de mie ici, les opportunité sont overtes des la cassure','2025-02-15 00:22:43'),(30,6,'Si je ne rentre pas dans le mouvement au debut, ce n\'est pas la peine d\'essayer de prendre une continuité qui ne ressemble pas à mon setup','2025-02-15 00:47:19'),(31,6,'c\'est pas la peine d\'aller à contre sens de la tendence','2025-02-15 11:15:23'),(32,6,'il faut plus acheter que vendre les actions, je réduis mon risque sur la vente et j\'augmente sur l\'achat, je passe ainsi de 0.5 à 0.25 sur les ventes et de 0.5 à 1 sur l\'achat','2025-02-17 00:26:59'),(33,15,'La stratégie est simple ici, je regarde mon setup en H4, lorsqu\'il y\'a une cassure en H1, je guette un point d\'entrée en M15 en cherchant un petit sl pour avoir un bon profit ','2025-02-20 22:15:23'),(34,16,'Sur le Wheat je me demande s\'il ne vaut pas mieux analyser et prendre mes positions en H1, tout simplement','2025-02-23 11:06:52'),(35,18,'Le plus difficile est de rester discipliné et de prendre les positions qui rentre dans la configuration de mon plan de trading. Il y\'a beaucoup de belle configuration prometeuse et l\'envie de ne pas rater est forte.','2025-02-28 10:01:26'),(36,18,'J\'ai remarqué que les grosse tendance de fonds, je les ai sur les gros timeframe genre h1. Je peux trouver de gros swing en me basant sur la tandance H1 et prise de position en M5','2025-03-02 15:35:25'),(37,18,'Ensuite il faut si je veux je peux en m5 prendre de petit sclap mais vraiment en poursuivant la tendance de base','2025-03-02 15:37:03'),(38,20,'j\'ai decidé de laisser tomber car j\'ai remarqué qu\'il y\'a trop de piege en M15 uniquement ','2025-03-07 13:13:23'),(39,21,'Moins de RRP 1.25, je ne prends pas ?','2025-03-07 21:06:53'),(40,21,'S\'il y\'a une forte chasse au stop, il ne faut pas considerer la forte meche de la chasse,  ca peut empecher une bonne opportunité','2025-03-08 08:55:40'),(41,21,'j\'ai essayé se reduire mon timeframe pour les entrée mais ca n\'a pas marché, en H1 il y\'a vraiment beaucoup de fake out, il vaut mieux que je me concentre sur Daily / H4','2025-03-13 09:29:25'),(42,34,'C\'est possible mais trop de tracas, je prefere swinger ','2025-03-28 02:22:45'),(43,21,'Souvent les deux premiers points\nde la trendline font on angle trop grand et la cassure, offre une golden zone un peu en haut. dans ces cas, il faut juste, quand je prends le plus petit setup lié au mouvment viser ','2025-04-12 21:13:43');
/*!40000 ALTER TABLE `observations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultats`
--

DROP TABLE IF EXISTS `resultats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `resultat` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultats`
--

LOCK TABLES `resultats` WRITE;
/*!40000 ALTER TABLE `resultats` DISABLE KEYS */;
INSERT INTO `resultats` VALUES (1,'BE'),(2,'SL'),(3,'TP'),(4,'SL->TP'),(5,'ND');
/*!40000 ALTER TABLE `resultats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions_backtest`
--

DROP TABLE IF EXISTS `sessions_backtest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions_backtest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `titre` varchar(100) NOT NULL,
  `objet` text,
  `date_debut` datetime NOT NULL,
  `capital` decimal(18,2) NOT NULL,
  `actif_id` int NOT NULL,
  `benefice` decimal(10,2) DEFAULT NULL,
  `status` enum('backtest','journal_trading') NOT NULL DEFAULT 'backtest',
  `decision` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `fk_sessions_backtest_actif` (`actif_id`),
  CONSTRAINT `fk_sessions_backtest_actif` FOREIGN KEY (`actif_id`) REFERENCES `actifs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sessions_backtest_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions_backtest`
--

LOCK TABLES `sessions_backtest` WRITE;
/*!40000 ALTER TABLE `sessions_backtest` DISABLE KEYS */;
INSERT INTO `sessions_backtest` VALUES (1,3,'Scalping  test 1','J\'ai décidé de tester le scalping sur les indices, j\'ai donc pris le GER40 en premier et toute mes positions on été prise en M5','2025-01-10 21:56:42',200000.00,29,8.50,'backtest','valid'),(6,3,'Backtest Apple D1 | H4 | H1','Test de ma stratégie sur Apple en timeframe  D1/H4/H1 ','2025-01-23 00:31:16',200000.00,34,2.23,'backtest','invalid'),(7,3,'Scalping | test 2','J’ai décidé de tester le scalping sur les indices, j’ai donc pris le GER40','2025-01-11 21:56:42',200000.00,29,0.59,'backtest','invalid'),(11,3,'Swing | test 1 | H1','J\'ai décidé de tester le swing sur les indices, j\'ai donc pris le GER40 et je vais prendre des swing trade pour voir','2025-01-31 00:00:00',200000.00,29,2.58,'backtest','invalid'),(12,3,'Swing | test 1 | H4','J\'ai décidé de tester le swing sur les indices, j\'ai donc pris le GER40 et je vais prendre des swing trade pour voir','2025-02-07 00:00:00',200000.00,29,-2.75,'backtest','invalid'),(15,3,'Backtest Apple Intraday H4 | H1 | M15','Test de ma stratégie sur Apple en timeframe H4|H1|15','2025-02-17 00:00:00',200000.00,34,4.41,'backtest','invalid'),(16,3,'Backtest Wheat H1 | M15 | M5','Test de ma stratégie sur le Wheat en timeframe H1 | M15 | M5','2025-02-20 00:00:00',400000.00,51,6.93,'backtest','valid'),(18,3,'Backtest Coffee H1 | M5','Test de ma stratégie sur le Wheat en timeframe H1 | M5','2025-02-27 00:00:00',10000.00,48,29.57,'backtest','recommandé'),(19,3,'Journal Trading Coffee','Session de trading sur le café','2025-03-06 00:00:00',200000.00,48,-0.50,'journal_trading','invalid'),(20,3,'Backtest Full M15','je vais essayé la strategies en full M15','2025-03-06 00:00:00',200000.00,48,-1.67,'backtest','invalid'),(21,3,'Backtest Daily H4','je vais essayé la strategies en daily | H4','2025-03-07 00:00:00',200000.00,52,90.01,'backtest','valid'),(22,3,'Backtest Full H1','je vais essayé la strategies en full H1','2025-03-08 00:00:00',200000.00,52,2.35,'backtest','invalid'),(26,3,'Backtest AUDUSD D1 | H4 | H1','Test de ma stratégie sur AUDUSD en timeframe D1/H4/H1','2025-03-21 00:00:00',400000.00,53,34.04,'backtest','valid'),(29,3,'Backtest AUDCHF Full D1','Test de ma stratégie sur AUDCHF en timeframe D1/H4/H1','2025-03-25 00:00:00',400000.00,20,2.69,'backtest','valid'),(31,3,'Backtest AUDCHF Full H4','Test de ma stratégie sur AUDCHF en timeframe D1/H4/H1','2025-03-25 00:00:00',400000.00,20,8.60,'backtest','valid'),(32,3,'Backtest Apple H1 | M5','Test de ma stratégie sur le pretrole en timeframe  H1 | M5','2025-03-27 00:00:00',400000.00,54,NULL,'backtest',NULL),(34,3,'Backtest Sugar H1 | M5','Test de ma stratégie sur le Wheat en timeframe H1 | M5','2025-03-27 00:00:00',400000.00,56,8.86,'backtest',NULL),(35,3,'Backtest EURJPY D1 | H4','Test de ma stratégie sur EURJPY en timeframe D1/H4','2025-04-05 00:00:00',600000.00,8,27.06,'backtest','recommandé'),(36,3,'Backtest Coffee D1 | H4','Test de ma stratégie sur le Café en timeframe H1 | M5','2025-04-06 00:00:00',600000.00,48,13.30,'backtest','valid'),(37,3,'Backtest WHEAT D1 | H4 | H1','Test de ma stratégie sur WHEAT en timeframe D1/H4/H1','2025-04-07 00:00:00',600000.00,51,NULL,'backtest',NULL),(38,3,'Backtest GBPJPY D1 | H4 | H1','Test de ma stratégie sur GBPJPY en timeframe D1/H4/H1','2025-04-07 00:00:00',600000.00,13,50.68,'backtest','valid'),(40,3,'Backtest AUDUSD H1 | M15','Test de ma stratégie sur AUDUSD en timeframe H1 | M15','2025-04-17 00:00:00',600000.00,53,5.79,'backtest','valid'),(41,3,'Backtest NAS100 H4 | H1','Test de ma stratégie sur NAS100 en timeframe H4/H1','2025-04-20 00:00:00',600000.00,31,10.68,'backtest','valid');
/*!40000 ALTER TABLE `sessions_backtest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strategies`
--

DROP TABLE IF EXISTS `strategies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strategies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_strategie_id` int NOT NULL,
  `user_id` int NOT NULL,
  `nom_strategie` varchar(100) NOT NULL,
  `contenu` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_strategie_id` (`type_strategie_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `strategies_ibfk_1` FOREIGN KEY (`type_strategie_id`) REFERENCES `types_strategies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strategies_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strategies`
--

LOCK TABLES `strategies` WRITE;
/*!40000 ALTER TABLE `strategies` DISABLE KEYS */;
INSERT INTO `strategies` VALUES (2,1,3,'R.Z.A-V -> O.D','Repérage zone achat ou vente et mise en place d\'un ordre différé.');
/*!40000 ALTER TABLE `strategies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeframes`
--

DROP TABLE IF EXISTS `timeframes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timeframes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timeframe` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `timeframe` (`timeframe`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeframes`
--

LOCK TABLES `timeframes` WRITE;
/*!40000 ALTER TABLE `timeframes` DISABLE KEYS */;
INSERT INTO `timeframes` VALUES (6,'D1'),(4,'h1'),(5,'h4'),(2,'m15'),(3,'m30'),(1,'m5'),(8,'MN1'),(7,'W1');
/*!40000 ALTER TABLE `timeframes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions_backtest`
--

DROP TABLE IF EXISTS `transactions_backtest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions_backtest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `session_backtest_id` int NOT NULL,
  `actif_id` int NOT NULL,
  `strategie_id` int NOT NULL,
  `date_entree` datetime NOT NULL,
  `rrp` decimal(5,2) DEFAULT NULL,
  `resultat_id` int DEFAULT NULL,
  `risque` decimal(10,2) NOT NULL,
  `timeframe_id` int NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'clôturé',
  `date_sortie` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `session_backtest_id` (`session_backtest_id`),
  KEY `actif_id` (`actif_id`),
  KEY `strategie_id` (`strategie_id`),
  KEY `resultat_id` (`resultat_id`),
  KEY `fk_timeframe` (`timeframe_id`),
  CONSTRAINT `fk_timeframe` FOREIGN KEY (`timeframe_id`) REFERENCES `timeframes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_backtest_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_backtest_ibfk_2` FOREIGN KEY (`session_backtest_id`) REFERENCES `sessions_backtest` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_backtest_ibfk_4` FOREIGN KEY (`actif_id`) REFERENCES `actifs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_backtest_ibfk_5` FOREIGN KEY (`strategie_id`) REFERENCES `strategies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_backtest_ibfk_6` FOREIGN KEY (`resultat_id`) REFERENCES `resultats` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=1246 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions_backtest`
--

LOCK TABLES `transactions_backtest` WRITE;
/*!40000 ALTER TABLE `transactions_backtest` DISABLE KEYS */;
INSERT INTO `transactions_backtest` VALUES (14,3,1,29,2,'2024-09-09 07:40:00',2.50,2,0.25,1,'clôturé',NULL),(15,3,1,29,2,'2024-09-09 14:35:00',1.89,3,0.25,1,'clôturé',NULL),(16,3,1,29,2,'2024-09-09 15:25:00',3.45,3,0.25,1,'clôturé',NULL),(17,3,1,29,2,'2024-09-09 21:00:00',1.58,3,0.25,1,'clôturé',NULL),(18,3,1,29,2,'2024-09-10 21:00:00',1.42,2,0.25,1,'clôturé',NULL),(19,3,1,29,2,'2024-09-10 09:00:00',3.90,2,0.25,1,'clôturé',NULL),(20,3,1,29,2,'2024-09-10 10:00:00',1.14,2,0.25,1,'clôturé',NULL),(21,3,1,29,2,'2024-09-10 19:00:00',1.94,3,0.25,1,'clôturé',NULL),(22,3,1,29,2,'2024-09-11 07:35:00',2.03,3,0.25,1,'clôturé',NULL),(23,3,1,29,2,'2024-09-11 11:40:00',2.42,2,0.25,1,'clôturé',NULL),(24,3,1,29,2,'2024-09-11 14:00:00',2.12,3,0.25,1,'clôturé',NULL),(25,3,1,29,2,'2024-09-16 03:55:00',1.58,2,0.25,1,'clôturé',NULL),(26,3,1,29,2,'2024-09-16 05:50:00',7.59,3,0.25,1,'clôturé',NULL),(27,3,1,29,2,'2024-09-16 10:10:00',2.11,2,0.25,1,'clôturé',NULL),(28,3,1,29,2,'2024-09-17 02:25:00',2.11,1,0.25,1,'clôturé',NULL),(33,3,1,29,2,'2024-09-18 16:30:00',2.20,3,0.25,1,'clôturé',NULL),(34,3,1,29,2,'2024-09-18 18:20:00',1.59,3,0.25,1,'clôturé',NULL),(35,3,1,29,2,'2024-09-19 05:00:00',2.54,2,0.25,1,'clôturé',NULL),(36,3,1,29,2,'2024-09-18 22:45:00',2.86,2,0.25,1,'clôturé',NULL),(37,3,1,29,2,'2024-09-19 06:45:00',7.51,2,0.25,1,'clôturé',NULL),(42,3,1,29,2,'2024-09-19 07:15:00',2.21,3,0.25,1,'clôturé',NULL),(43,3,1,29,2,'2024-09-20 03:15:00',2.07,2,0.25,1,'clôturé',NULL),(44,3,1,29,2,'2024-09-20 06:00:00',5.84,2,0.25,1,'clôturé',NULL),(45,3,1,29,2,'2024-09-19 14:30:00',4.67,3,0.25,1,'clôturé',NULL),(46,3,1,29,2,'2024-09-19 11:40:00',3.60,2,0.25,1,'clôturé',NULL),(47,3,1,29,2,'2024-09-19 13:00:00',6.00,2,0.25,1,'clôturé',NULL),(48,3,1,29,2,'2024-09-20 08:15:00',2.14,2,0.25,1,'clôturé',NULL),(49,3,1,29,2,'2024-09-20 11:10:00',3.79,2,0.25,1,'clôturé',NULL),(50,3,1,29,2,'2024-09-20 12:15:00',3.48,2,0.25,1,'clôturé',NULL),(51,3,1,29,2,'2024-09-20 14:35:00',1.26,3,0.25,1,'clôturé',NULL),(52,3,1,29,2,'2024-09-24 02:15:00',3.67,2,0.25,1,'clôturé',NULL),(53,3,1,29,2,'2024-09-24 06:00:00',1.44,3,0.25,1,'clôturé',NULL),(54,3,1,29,2,'2024-09-23 15:55:00',3.57,2,0.25,1,'clôturé',NULL),(55,3,1,29,2,'2024-09-20 17:15:00',1.99,3,0.25,1,'clôturé',NULL),(56,3,1,29,2,'2024-09-23 21:45:00',1.16,3,0.25,1,'clôturé',NULL),(57,3,1,29,2,'2024-09-23 07:35:00',3.02,3,0.25,1,'clôturé',NULL),(58,3,1,29,2,'2024-09-24 08:10:00',1.56,2,0.25,1,'clôturé',NULL),(59,3,1,29,2,'2024-09-24 09:40:00',1.68,2,0.25,1,'clôturé',NULL),(60,3,1,29,2,'2024-09-24 19:10:00',4.03,3,0.25,1,'clôturé',NULL),(61,3,1,29,2,'2024-09-20 16:25:00',1.86,3,0.25,1,'clôturé',NULL),(62,3,1,29,2,'2024-09-24 22:10:00',2.76,3,0.25,1,'clôturé',NULL),(63,3,1,29,2,'2024-09-27 05:05:00',1.83,3,0.25,1,'clôturé',NULL),(64,3,1,29,2,'2024-09-24 12:15:00',3.00,2,0.25,1,'clôturé',NULL),(65,3,1,29,2,'2024-09-26 11:20:00',4.15,2,0.25,1,'clôturé',NULL),(66,3,1,29,2,'2024-09-25 11:00:00',2.79,3,0.25,1,'clôturé',NULL),(67,3,1,29,2,'2024-09-27 20:50:00',2.19,3,0.25,1,'clôturé',NULL),(68,3,1,29,2,'2024-09-30 14:40:00',2.41,3,0.25,1,'clôturé',NULL),(69,3,1,29,2,'2024-09-30 19:15:00',2.64,2,0.25,1,'clôturé',NULL),(70,3,7,29,2,'2024-08-30 11:15:00',1.50,2,0.50,2,'clôturé',NULL),(71,3,7,29,2,'2024-08-29 16:45:00',1.76,2,0.50,2,'clôturé',NULL),(72,3,7,29,2,'2024-08-29 14:45:00',2.57,2,0.50,2,'clôturé',NULL),(73,3,7,29,2,'2024-09-04 16:00:00',3.38,2,0.50,2,'clôturé',NULL),(74,3,7,29,2,'2024-08-30 03:15:00',1.27,3,0.50,2,'clôturé',NULL),(75,3,7,29,2,'2024-09-02 03:00:00',1.13,3,0.50,2,'clôturé',NULL),(76,3,7,29,2,'2024-09-09 17:15:00',1.52,2,0.50,2,'clôturé',NULL),(77,3,7,29,2,'2024-09-12 14:00:00',5.79,3,0.50,2,'clôturé',NULL),(78,3,7,29,2,'2024-09-13 04:00:00',2.70,2,0.50,2,'clôturé',NULL),(79,3,7,29,2,'2024-09-16 21:45:00',3.49,2,0.50,2,'clôturé',NULL),(84,3,11,29,2,'2019-12-30 08:15:00',1.75,3,0.50,4,'clôturé',NULL),(85,3,11,29,2,'2020-01-08 14:15:00',2.50,3,0.50,4,'clôturé',NULL),(86,3,11,29,2,'2020-01-13 08:15:00',4.29,2,0.50,4,'clôturé',NULL),(87,3,11,29,2,'2020-01-23 02:15:00',1.40,3,0.50,4,'clôturé',NULL),(88,3,11,29,2,'2020-02-13 07:15:00',2.14,2,0.50,4,'clôturé',NULL),(89,3,11,29,2,'2020-02-20 08:15:00',2.62,3,0.50,4,'clôturé',NULL),(90,3,11,29,2,'2020-03-03 05:15:00',2.31,2,0.50,4,'clôturé',NULL),(91,3,11,29,2,'2020-03-27 09:15:00',2.85,2,0.50,4,'clôturé',NULL),(92,3,11,29,2,'2020-03-19 10:15:00',2.14,3,0.50,4,'clôturé',NULL),(93,3,11,29,2,'2020-03-26 13:15:00',1.50,2,0.50,4,'clôturé',NULL),(94,3,11,29,2,'2020-03-30 15:15:00',1.76,3,0.50,4,'clôturé',NULL),(95,3,11,29,2,'2024-04-07 07:15:00',2.56,2,0.50,4,'clôturé',NULL),(96,3,12,29,2,'2020-03-31 13:15:00',2.38,1,0.50,5,'clôturé',NULL),(97,3,12,29,2,'2020-04-20 09:15:00',2.70,2,0.50,5,'clôturé',NULL),(98,3,11,29,2,'2020-05-19 13:15:00',1.69,2,0.50,4,'clôturé',NULL),(99,3,11,29,2,'2020-05-05 17:15:00',2.54,1,0.50,4,'clôturé',NULL),(100,3,12,29,2,'2020-05-28 13:15:00',2.24,2,0.50,5,'clôturé',NULL),(101,3,12,29,2,'2020-06-23 13:15:00',1.50,2,0.50,5,'clôturé',NULL),(102,3,12,29,2,'2020-05-20 01:15:00',3.45,2,0.50,5,'clôturé',NULL),(103,3,12,29,2,'2020-07-29 21:15:00',1.51,3,0.50,5,'clôturé',NULL),(104,3,12,29,2,'2020-06-09 17:15:00',2.50,2,0.50,5,'clôturé',NULL),(105,3,12,29,2,'2020-08-05 09:15:00',2.18,2,0.50,5,'clôturé',NULL),(106,3,12,29,2,'2020-08-14 09:15:00',1.73,2,0.50,5,'clôturé',NULL),(125,3,6,34,2,'2019-03-05 17:30:00',5.74,1,0.50,4,'clôturé',NULL),(126,3,6,34,2,'2019-01-14 15:30:00',2.71,3,0.50,4,'clôturé',NULL),(127,3,6,34,2,'2018-12-28 19:30:00',3.28,2,0.50,4,'clôturé',NULL),(128,3,6,34,2,'2019-02-11 16:30:00',2.96,3,0.50,4,'clôturé',NULL),(129,3,6,34,2,'2019-05-21 21:30:00',1.84,2,0.50,4,'clôturé',NULL),(130,3,6,34,2,'2019-04-25 15:30:00',4.14,3,0.50,4,'clôturé',NULL),(131,3,6,34,2,'2019-04-26 20:30:00',6.10,2,0.50,4,'clôturé',NULL),(132,3,6,34,2,'2019-03-26 14:30:00',1.61,1,0.50,4,'clôturé',NULL),(133,3,6,34,2,'2019-04-12 15:30:00',2.19,2,0.50,4,'clôturé',NULL),(134,3,6,34,2,'2019-06-14 20:30:00',3.68,2,0.50,4,'clôturé',NULL),(135,3,6,34,2,'2019-06-24 15:30:00',19.76,1,0.50,4,'clôturé',NULL),(136,3,6,34,2,'2019-06-28 17:30:00',5.09,2,0.50,4,'clôturé',NULL),(137,3,6,34,2,'2019-09-10 18:30:00',3.59,2,0.50,4,'clôturé',NULL),(138,3,6,34,2,'2019-10-16 16:30:00',1.91,2,0.25,4,'clôturé',NULL),(139,3,6,34,2,'2019-09-06 18:30:00',4.18,2,0.50,4,'clôturé',NULL),(140,3,6,34,2,'2019-10-30 14:30:00',2.76,2,0.25,4,'clôturé',NULL),(141,3,6,34,2,'2019-11-08 15:30:00',6.79,2,0.25,4,'clôturé',NULL),(142,3,6,34,2,'2019-08-01 21:30:00',4.99,1,0.50,4,'clôturé',NULL),(143,3,6,34,2,'2019-11-14 21:30:00',8.61,2,0.25,4,'clôturé',NULL),(144,3,6,34,2,'2019-11-19 19:30:00',3.38,4,0.25,4,'clôturé',NULL),(145,3,6,34,2,'2019-12-02 21:30:00',13.67,1,0.50,4,'clôturé',NULL),(146,3,6,34,2,'2005-08-05 15:30:00',2.25,2,0.25,5,'clôturé',NULL),(147,3,6,34,2,'2005-04-29 15:30:00',2.20,1,0.50,5,'clôturé',NULL),(148,3,6,34,2,'2005-06-02 15:30:00',2.25,3,0.25,5,'clôturé',NULL),(149,3,6,34,2,'2005-06-09 15:30:00',3.00,2,1.00,5,'clôturé',NULL),(150,3,6,34,2,'2005-08-25 15:30:00',1.86,2,0.25,5,'clôturé',NULL),(151,3,6,34,2,'2005-09-02 15:30:00',2.67,3,1.00,5,'clôturé',NULL),(152,3,6,34,2,'2005-12-14 15:30:00',1.00,2,0.25,5,'clôturé',NULL),(153,3,15,34,2,'2023-08-21 15:30:00',4.72,3,0.50,2,'clôturé',NULL),(154,3,15,34,2,'2023-09-25 15:30:00',1.71,1,0.50,2,'clôturé',NULL),(155,3,15,34,2,'2023-09-25 19:30:00',2.79,2,0.50,2,'clôturé',NULL),(156,3,15,34,2,'2023-10-03 15:30:00',1.88,3,0.50,2,'clôturé',NULL),(157,3,15,34,2,'2023-08-02 19:30:00',3.73,3,0.50,2,'clôturé',NULL),(158,3,15,34,2,'2023-11-27 15:30:00',12.07,2,0.50,2,'clôturé',NULL),(159,3,15,34,2,'2023-12-05 15:30:00',9.93,2,0.50,2,'clôturé',NULL),(160,3,15,34,2,'2023-11-01 14:30:00',2.13,3,0.50,2,'clôturé',NULL),(161,3,15,34,2,'2025-01-10 15:30:00',5.20,2,0.50,2,'clôturé',NULL),(162,3,15,34,2,'2024-12-30 19:30:00',1.85,3,0.50,2,'clôturé',NULL),(163,3,15,34,2,'2025-01-15 15:30:00',1.79,2,0.50,2,'clôturé',NULL),(164,3,15,34,2,'2025-01-29 17:00:00',5.89,2,0.25,2,'clôturé',NULL),(165,3,16,51,2,'2024-11-15 05:55:00',4.96,3,0.50,1,'clôturé',NULL),(166,3,16,51,2,'2024-11-14 04:40:00',1.34,2,0.50,1,'clôturé',NULL),(167,3,16,51,2,'2024-11-21 18:05:00',0.56,4,0.50,1,'clôturé',NULL),(168,3,16,51,2,'2024-12-19 19:05:00',1.79,3,0.50,1,'clôturé',NULL),(169,3,16,51,2,'2024-12-17 11:35:00',1.17,4,0.50,1,'clôturé',NULL),(170,3,16,51,2,'2024-12-18 18:05:00',1.57,3,0.50,1,'clôturé',NULL),(171,3,16,51,2,'2024-12-03 03:00:00',2.36,2,0.50,1,'clôturé',NULL),(172,3,16,51,2,'2024-12-09 17:40:00',3.46,2,0.50,1,'clôturé',NULL),(173,3,16,51,2,'2024-12-06 15:50:00',1.89,2,0.50,1,'clôturé',NULL),(174,3,16,51,2,'2024-12-20 17:35:00',1.51,3,0.50,1,'clôturé',NULL),(175,3,16,51,2,'2025-01-13 18:05:00',1.99,3,0.50,1,'clôturé',NULL),(176,3,16,51,2,'2025-01-28 03:50:00',1.64,3,0.50,1,'clôturé',NULL),(177,3,16,51,2,'2025-02-21 09:15:00',1.61,1,0.50,1,'clôturé',NULL),(178,3,16,51,2,'2025-02-19 11:40:00',3.17,3,0.50,1,'clôturé',NULL),(179,3,16,51,2,'2025-01-31 02:35:00',2.49,3,0.50,1,'clôturé',NULL),(180,3,16,51,2,'2025-02-10 17:30:00',2.70,2,0.50,1,'clôturé',NULL),(181,3,16,51,2,'2025-02-11 17:10:00',3.41,2,0.50,1,'clôturé',NULL),(184,3,16,51,2,'2025-02-26 15:30:00',1.61,2,0.50,1,'clôturé',NULL),(185,3,18,48,2,'2024-08-02 11:45:00',1.44,3,0.50,1,'clôturé',NULL),(186,3,18,48,2,'2024-08-12 16:00:00',1.51,3,0.50,1,'clôturé',NULL),(187,3,18,48,2,'2024-08-14 10:45:00',2.04,3,0.50,1,'clôturé',NULL),(188,3,18,48,2,'2024-08-20 13:15:00',3.08,2,0.50,1,'clôturé',NULL),(189,3,18,48,2,'2024-08-08 16:15:00',3.30,3,0.50,1,'clôturé',NULL),(190,3,18,48,2,'2024-08-20 14:45:00',2.51,2,0.50,1,'clôturé',NULL),(191,3,18,48,2,'2024-08-21 10:15:00',1.79,2,0.50,1,'clôturé',NULL),(192,3,18,48,2,'2024-08-22 12:40:00',1.48,3,0.50,1,'clôturé',NULL),(193,3,18,48,2,'2024-08-21 11:45:00',0.99,3,0.50,1,'clôturé',NULL),(194,3,18,48,2,'2024-08-28 12:20:00',1.45,2,0.50,1,'clôturé',NULL),(195,3,18,48,2,'2024-08-29 18:25:00',0.79,3,0.50,1,'clôturé',NULL),(196,3,18,48,2,'2024-08-30 13:55:00',1.48,3,0.50,1,'clôturé',NULL),(197,3,18,48,2,'2024-09-03 18:35:00',1.02,3,0.50,1,'clôturé',NULL),(198,3,18,48,2,'2024-09-04 19:15:00',1.32,4,0.50,1,'clôturé',NULL),(199,3,18,48,2,'2024-09-09 11:15:00',2.48,3,0.50,1,'clôturé',NULL),(200,3,18,48,2,'2024-09-17 10:35:00',7.83,2,0.50,1,'clôturé',NULL),(201,3,18,48,2,'2024-09-20 12:20:00',2.52,2,0.50,1,'clôturé',NULL),(202,3,18,48,2,'2024-09-20 13:05:00',1.15,2,0.50,1,'clôturé',NULL),(203,3,18,48,2,'2024-09-17 14:45:00',1.69,3,0.50,1,'clôturé',NULL),(204,3,18,48,2,'2024-09-19 16:45:00',1.51,2,0.50,1,'clôturé',NULL),(205,3,18,48,2,'2024-09-25 16:10:00',1.64,2,0.50,1,'clôturé',NULL),(206,3,18,48,2,'2024-09-24 18:25:00',2.44,2,0.50,1,'clôturé',NULL),(207,3,18,48,2,'2024-09-27 10:35:00',1.27,4,0.50,1,'clôturé',NULL),(208,3,18,48,2,'2024-09-30 15:55:00',1.93,3,0.50,1,'clôturé',NULL),(209,3,18,48,2,'2024-10-01 12:00:00',3.77,2,0.50,1,'clôturé',NULL),(210,3,18,48,2,'2024-10-01 12:45:00',4.23,3,0.50,1,'clôturé',NULL),(211,3,18,48,2,'2024-10-02 12:55:00',2.46,2,0.50,1,'clôturé',NULL),(212,3,18,48,2,'2024-10-10 11:15:00',1.51,3,0.50,1,'clôturé',NULL),(213,3,18,48,2,'2024-10-09 13:45:00',1.26,2,0.50,1,'clôturé',NULL),(214,3,18,48,2,'2024-10-07 18:20:00',12.08,3,0.50,1,'clôturé',NULL),(215,3,18,48,2,'2024-10-08 17:00:00',1.34,3,0.50,1,'clôturé',NULL),(216,3,18,48,2,'2024-10-11 11:25:00',0.89,4,0.50,1,'clôturé',NULL),(217,3,18,48,2,'2024-10-15 10:40:00',1.38,2,0.50,1,'clôturé',NULL),(218,3,18,48,2,'2024-10-14 14:00:00',3.40,2,0.50,1,'clôturé',NULL),(219,3,18,48,2,'2024-10-11 16:05:00',1.30,1,0.50,1,'clôturé',NULL),(220,3,18,48,2,'2024-10-15 18:50:00',0.66,4,0.50,1,'clôturé',NULL),(221,3,18,48,2,'2024-10-22 16:50:00',4.17,2,0.50,1,'clôturé',NULL),(222,3,18,48,2,'2024-10-18 12:30:00',0.70,4,0.50,1,'clôturé',NULL),(223,3,18,48,2,'2024-10-16 16:45:00',1.27,3,0.50,1,'clôturé',NULL),(224,3,18,48,2,'2024-10-17 16:20:00',1.30,3,0.50,1,'clôturé',NULL),(225,3,18,48,2,'2024-10-22 13:20:00',0.77,2,0.50,1,'clôturé',NULL),(226,3,18,48,2,'2024-11-08 10:45:00',2.44,4,0.50,1,'clôturé',NULL),(227,3,18,48,2,'2024-11-08 12:25:00',1.04,4,0.50,1,'clôturé',NULL),(228,3,18,48,2,'2024-11-11 18:25:00',2.81,3,0.50,1,'clôturé',NULL),(229,3,18,48,2,'2024-11-08 16:20:00',2.58,2,0.50,1,'clôturé',NULL),(246,3,20,48,2,'2023-06-22 17:15:00',0.90,2,0.50,2,'clôturé',NULL),(247,3,20,48,2,'2023-06-20 17:15:00',3.35,1,0.50,2,'clôturé',NULL),(248,3,20,48,2,'2023-06-26 12:00:00',1.67,2,0.50,2,'clôturé',NULL),(249,3,20,48,2,'2023-06-23 13:30:00',2.13,2,0.50,2,'clôturé',NULL),(250,3,20,48,2,'2023-06-26 16:30:00',0.82,1,0.50,2,'clôturé',NULL),(251,3,20,48,2,'2023-06-16 09:00:00',2.85,3,0.50,2,'clôturé',NULL),(252,3,20,48,2,'2023-06-28 15:00:00',2.17,2,0.50,2,'clôturé',NULL),(253,3,20,48,2,'2023-06-30 17:00:00',1.91,3,0.50,2,'clôturé',NULL),(254,3,20,48,2,'2023-07-05 11:15:00',0.90,3,0.50,2,'clôturé',NULL),(255,3,20,48,2,'2023-07-19 09:00:00',1.46,1,0.50,2,'clôturé',NULL),(256,3,20,48,2,'2023-07-05 15:30:00',2.00,2,0.50,2,'clôturé',NULL),(257,3,20,48,2,'2023-07-06 12:15:00',3.25,2,0.50,2,'clôturé',NULL),(258,3,20,48,2,'2023-07-06 11:30:00',3.14,2,0.50,2,'clôturé',NULL),(259,3,20,48,2,'2023-07-18 10:00:00',4.23,2,0.50,2,'clôturé',NULL),(260,3,20,48,2,'2023-07-18 15:15:00',2.68,1,0.50,2,'clôturé',NULL),(261,3,20,48,2,'2023-07-20 09:00:00',0.99,2,0.50,2,'clôturé',NULL),(262,3,21,52,2,'2007-03-23 02:00:00',1.89,3,0.50,5,'clôturé',NULL),(263,3,21,52,2,'2007-04-16 22:00:00',3.10,3,0.50,5,'clôturé',NULL),(264,3,21,52,2,'2007-03-23 19:00:00',0.40,4,0.50,5,'clôturé',NULL),(265,3,21,52,2,'2007-03-29 06:00:00',0.75,4,0.50,5,'clôturé',NULL),(266,3,21,52,2,'2007-04-11 09:00:00',2.97,2,0.50,5,'clôturé',NULL),(267,3,21,52,2,'2007-04-11 02:00:00',2.97,2,0.50,5,'clôturé',NULL),(268,3,21,52,2,'2007-05-03 06:00:00',1.36,3,0.50,5,'clôturé',NULL),(269,3,21,52,2,'2007-05-23 10:00:00',1.36,2,0.50,5,'clôturé',NULL),(270,3,21,52,2,'2007-06-07 10:00:00',1.53,3,0.50,5,'clôturé',NULL),(271,3,21,52,2,'2007-06-13 18:00:00',1.47,3,0.50,5,'clôturé',NULL),(272,3,21,52,2,'2007-06-19 06:00:00',1.50,3,0.50,5,'clôturé',NULL),(273,3,21,52,2,'2007-07-11 14:00:00',1.80,2,0.50,5,'clôturé',NULL),(274,3,21,52,2,'2007-08-22 14:00:00',4.30,3,0.50,5,'clôturé',NULL),(275,3,21,52,2,'2007-07-25 06:00:00',1.18,3,0.50,5,'clôturé',NULL),(276,3,21,52,2,'2007-07-16 10:00:00',3.00,1,0.50,5,'clôturé',NULL),(277,3,21,52,2,'2007-09-05 10:00:00',1.41,2,0.50,5,'clôturé',NULL),(278,3,21,52,2,'2007-10-05 10:00:00',1.85,3,0.50,5,'clôturé',NULL),(279,3,21,52,2,'2007-10-12 06:00:00',1.15,2,0.50,5,'clôturé',NULL),(280,3,21,52,2,'2007-09-12 18:00:00',0.67,4,0.50,5,'clôturé',NULL),(281,3,21,52,2,'2007-09-27 06:00:00',1.66,2,0.50,5,'clôturé',NULL),(282,3,21,52,2,'2007-10-01 22:00:00',2.44,3,0.50,5,'clôturé',NULL),(283,3,21,52,2,'2007-10-12 18:00:00',1.98,2,0.50,5,'clôturé',NULL),(284,3,21,52,2,'2007-10-19 10:00:00',2.11,2,0.50,5,'clôturé',NULL),(285,3,21,52,2,'2007-11-20 14:00:00',0.71,4,0.50,5,'clôturé',NULL),(286,3,21,52,2,'2007-12-03 14:00:00',1.66,3,0.50,5,'clôturé',NULL),(287,3,21,52,2,'2007-12-17 18:00:00',2.42,3,0.50,5,'clôturé',NULL),(288,3,21,52,2,'2008-01-07 18:00:00',2.73,2,0.50,5,'clôturé',NULL),(289,3,21,52,2,'2007-12-31 14:00:00',4.35,2,0.50,5,'clôturé',NULL),(290,3,21,52,2,'2007-12-07 02:00:00',1.35,2,0.50,5,'clôturé',NULL),(291,3,21,52,2,'2007-12-28 02:00:00',2.88,2,0.50,5,'clôturé',NULL),(292,3,21,52,2,'2018-05-23 22:00:00',1.86,3,0.50,5,'clôturé',NULL),(293,3,21,52,2,'2018-06-26 10:00:00',4.44,2,0.50,5,'clôturé',NULL),(294,3,21,52,2,'2018-06-29 02:00:00',6.89,2,0.50,5,'clôturé',NULL),(295,3,21,52,2,'2018-07-24 10:00:00',2.11,2,0.50,5,'clôturé',NULL),(296,3,21,52,2,'2018-07-03 06:00:00',4.00,1,0.50,5,'clôturé',NULL),(297,3,21,52,2,'2018-05-02 02:00:00',1.80,3,0.50,5,'clôturé',NULL),(298,3,21,52,2,'2018-07-20 02:00:00',2.94,3,0.50,5,'clôturé',NULL),(299,3,21,52,2,'2018-08-03 10:00:00',3.77,2,0.50,5,'clôturé',NULL),(300,3,21,52,2,'2018-09-10 06:00:00',2.20,2,0.50,5,'clôturé',NULL),(301,3,21,52,2,'2018-12-04 22:00:00',1.45,3,0.50,5,'clôturé',NULL),(302,3,21,52,2,'2018-09-17 18:00:00',1.37,3,0.50,5,'clôturé',NULL),(303,3,21,52,2,'2018-09-12 10:00:00',2.20,1,0.50,5,'clôturé',NULL),(304,3,21,52,2,'2018-09-26 06:00:00',0.77,4,0.50,5,'clôturé',NULL),(305,3,21,52,2,'2018-12-14 10:00:00',1.40,1,0.50,5,'clôturé',NULL),(306,3,22,52,2,'2018-05-07 05:00:00',1.70,3,0.50,4,'clôturé',NULL),(307,3,22,52,2,'2018-05-16 14:00:00',1.55,3,0.50,4,'clôturé',NULL),(308,3,22,52,2,'2018-05-24 06:00:00',1.54,3,0.50,4,'clôturé',NULL),(309,3,22,52,2,'2018-05-17 18:00:00',1.50,2,0.50,4,'clôturé',NULL),(310,3,22,52,2,'2018-05-02 01:00:00',1.65,3,0.50,4,'clôturé',NULL),(311,3,22,52,2,'2018-05-20 22:00:00',2.30,1,0.50,4,'clôturé',NULL),(312,3,22,52,2,'2018-05-30 10:00:00',2.27,3,0.50,4,'clôturé',NULL),(313,3,22,52,2,'2018-06-01 14:00:00',1.84,2,0.50,4,'clôturé',NULL),(314,3,22,52,2,'2018-06-01 06:00:00',2.18,2,0.50,4,'clôturé',NULL),(315,3,22,52,2,'2018-05-29 22:00:00',1.52,2,0.50,4,'clôturé',NULL),(316,3,21,52,2,'2010-03-19 14:00:00',2.69,1,0.50,5,'clôturé',NULL),(317,3,21,52,2,'2010-02-11 14:00:00',1.59,3,0.50,5,'clôturé',NULL),(318,3,21,52,2,'2010-01-04 06:00:00',3.08,3,0.50,5,'clôturé',NULL),(319,3,21,52,2,'2010-05-26 22:00:00',1.23,3,0.50,5,'clôturé',NULL),(320,3,21,52,2,'2010-05-17 02:00:00',3.34,3,0.50,5,'clôturé',NULL),(321,3,21,52,2,'2010-04-15 22:00:00',3.33,3,0.50,5,'clôturé',NULL),(322,3,21,52,2,'2010-06-02 02:00:00',1.47,3,0.50,5,'clôturé',NULL),(323,3,21,52,2,'2010-06-10 06:00:00',1.33,4,0.50,5,'clôturé',NULL),(324,3,21,52,2,'2010-06-30 10:00:00',1.19,3,0.50,5,'clôturé',NULL),(325,3,21,52,2,'2010-07-25 22:00:00',2.60,2,0.50,5,'clôturé',NULL),(326,3,21,52,2,'2010-08-10 02:00:00',3.09,3,0.50,5,'clôturé',NULL),(327,3,21,52,2,'2010-08-10 18:00:00',1.87,3,0.50,5,'clôturé',NULL),(328,3,21,52,2,'2010-09-10 02:00:00',2.76,2,0.50,5,'clôturé',NULL),(329,3,21,52,2,'2010-10-24 22:00:00',1.86,2,0.50,5,'clôturé',NULL),(330,3,21,52,2,'2010-11-10 06:00:00',1.98,3,0.50,5,'clôturé',NULL),(331,3,21,52,2,'2010-11-20 14:00:00',3.50,3,0.50,5,'clôturé',NULL),(332,3,21,52,2,'2010-12-07 18:00:00',2.17,3,0.50,5,'clôturé',NULL),(333,3,21,52,2,'2010-12-08 22:00:00',1.76,2,0.50,5,'clôturé',NULL),(334,3,21,52,2,'2010-12-12 22:00:00',1.29,3,0.50,5,'clôturé',NULL),(335,3,21,52,2,'2011-01-17 14:00:00',2.51,3,0.50,5,'clôturé',NULL),(336,3,21,52,2,'2011-01-31 10:00:00',1.84,3,0.50,5,'clôturé',NULL),(337,3,21,52,2,'2011-01-09 22:00:00',2.72,3,0.50,5,'clôturé',NULL),(338,3,21,52,2,'2011-01-13 10:00:00',1.56,2,0.50,5,'clôturé',NULL),(339,3,21,52,2,'2011-01-25 22:00:00',1.88,3,0.50,5,'clôturé',NULL),(340,3,21,52,2,'2011-01-19 14:00:00',2.20,2,0.50,5,'clôturé',NULL),(341,3,21,52,2,'2011-03-03 15:00:00',3.15,2,0.50,5,'clôturé',NULL),(342,3,21,52,2,'2011-03-18 06:00:00',4.13,2,0.50,5,'clôturé',NULL),(343,3,21,52,2,'2011-04-12 06:00:00',3.25,2,0.50,5,'clôturé',NULL),(344,3,21,52,2,'2011-04-13 06:00:00',5.94,3,0.50,5,'clôturé',NULL),(345,3,21,52,2,'2011-04-27 02:00:00',2.50,3,0.50,5,'clôturé',NULL),(346,3,21,52,2,'2011-05-17 22:00:00',2.55,4,0.50,5,'clôturé',NULL),(347,3,21,52,2,'2011-06-06 06:00:00',1.64,1,0.50,5,'clôturé',NULL),(348,3,21,52,2,'2011-06-14 18:00:00',2.11,2,0.50,5,'clôturé',NULL),(349,3,21,52,2,'2011-06-16 02:00:00',1.80,3,0.50,5,'clôturé',NULL),(350,3,21,52,2,'2011-05-06 14:00:00',1.93,3,0.50,5,'clôturé',NULL),(351,3,21,52,2,'2011-06-23 02:00:00',1.06,3,0.50,5,'clôturé',NULL),(352,3,21,52,2,'2011-07-19 14:00:00',2.26,4,0.50,5,'clôturé',NULL),(353,3,21,52,2,'2011-08-02 02:00:00',1.63,3,0.50,5,'clôturé',NULL),(354,3,21,52,2,'2011-07-27 14:00:00',5.15,1,0.50,5,'clôturé',NULL),(355,3,21,52,2,'2011-08-09 22:00:00',1.63,3,0.50,5,'clôturé',NULL),(356,3,21,52,2,'2011-08-26 06:00:00',0.67,4,0.50,5,'clôturé',NULL),(357,3,21,52,2,'2011-08-12 14:00:00',2.44,3,0.50,5,'clôturé',NULL),(358,3,21,52,2,'2011-08-23 02:00:00',2.79,3,0.50,5,'clôturé',NULL),(359,3,21,52,2,'2011-09-06 10:00:00',1.84,3,0.50,5,'clôturé',NULL),(360,3,21,52,2,'2011-09-08 18:00:00',0.45,4,0.50,5,'clôturé',NULL),(361,3,21,52,2,'2011-09-13 14:00:00',2.13,3,0.50,5,'clôturé',NULL),(362,3,21,52,2,'2011-11-28 02:00:00',1.17,3,0.50,5,'clôturé',NULL),(363,3,21,52,2,'2011-10-25 14:00:00',1.75,2,0.50,5,'clôturé',NULL),(364,3,21,52,2,'2011-09-16 14:00:00',1.43,3,0.50,5,'clôturé',NULL),(365,3,21,52,2,'2011-09-21 18:00:00',1.43,2,0.50,5,'clôturé',NULL),(366,3,21,52,2,'2011-11-22 02:00:00',1.25,3,0.50,5,'clôturé',NULL),(367,3,21,52,2,'2011-12-04 22:00:00',1.51,3,0.50,5,'clôturé',NULL),(368,3,21,52,2,'2011-12-23 10:00:00',1.26,2,0.50,5,'clôturé',NULL),(369,3,21,52,2,'2018-05-02 06:00:00',1.73,3,0.50,5,'clôturé',NULL),(370,3,21,52,2,'2018-04-20 10:00:00',1.03,3,0.50,5,'clôturé',NULL),(371,3,21,52,2,'2018-05-07 10:00:00',2.08,2,0.50,5,'clôturé',NULL),(372,3,21,52,2,'2018-05-16 14:00:00',1.70,3,0.50,5,'clôturé',NULL),(373,3,21,52,2,'2018-05-16 02:00:00',1.94,2,0.50,5,'clôturé',NULL),(374,3,21,52,2,'2018-05-08 06:00:00',1.68,3,0.50,5,'clôturé',NULL),(375,3,21,52,2,'2018-05-17 06:00:00',0.68,4,0.50,5,'clôturé',NULL),(376,3,21,52,2,'2018-05-25 10:00:00',1.87,3,0.50,5,'clôturé',NULL),(377,3,21,52,2,'2018-05-30 10:00:00',1.66,3,0.50,5,'clôturé',NULL),(378,3,21,52,2,'2018-06-12 22:00:00',2.48,2,0.50,5,'clôturé',NULL),(379,3,21,52,2,'2018-07-27 10:00:00',2.33,2,0.50,5,'clôturé',NULL),(380,3,21,52,2,'2018-08-03 18:00:00',3.22,2,0.50,5,'clôturé',NULL),(381,3,21,52,2,'2018-06-29 10:00:00',4.83,2,0.50,5,'clôturé',NULL),(382,3,21,52,2,'2018-07-03 18:00:00',3.14,1,0.50,5,'clôturé',NULL),(383,3,21,52,2,'2018-09-07 10:00:00',1.95,2,0.50,5,'clôturé',NULL),(384,3,21,52,2,'2018-09-12 10:00:00',2.62,3,0.50,5,'clôturé',NULL),(385,3,21,52,2,'2018-09-21 10:00:00',5.74,1,0.50,5,'clôturé',NULL),(386,3,21,52,2,'2018-11-21 10:00:00',2.41,3,0.50,5,'clôturé',NULL),(387,3,21,52,2,'2018-01-03 18:00:00',2.62,2,0.50,5,'clôturé',NULL),(388,3,21,52,2,'2018-01-31 06:00:00',1.48,3,0.50,5,'clôturé',NULL),(389,3,21,52,2,'2018-01-10 14:00:00',1.25,2,0.50,5,'clôturé',NULL),(390,3,21,52,2,'2018-01-23 22:00:00',1.81,3,0.50,5,'clôturé',NULL),(391,3,21,52,2,'2018-01-17 10:00:00',4.23,1,0.50,5,'clôturé',NULL),(392,3,21,52,2,'2018-02-02 02:00:00',1.39,3,0.50,5,'clôturé',NULL),(393,3,21,52,2,'2018-02-12 10:00:00',2.51,3,0.50,5,'clôturé',NULL),(394,3,21,52,2,'2018-02-14 18:00:00',2.30,2,0.50,5,'clôturé',NULL),(395,3,21,52,2,'2018-02-21 06:00:00',2.24,3,0.50,5,'clôturé',NULL),(396,3,21,52,2,'2018-03-06 10:00:00',1.23,3,0.50,5,'clôturé',NULL),(397,3,21,52,2,'2018-03-23 06:00:00',0.93,4,0.50,5,'clôturé',NULL),(398,3,21,52,2,'2018-04-12 10:00:00',1.31,3,0.50,5,'clôturé',NULL),(728,3,26,53,2,'2018-02-09 18:00:00',3.74,3,0.50,5,'clôturé',NULL),(729,3,26,53,2,'2018-01-23 18:00:00',2.10,3,0.50,5,'clôturé',NULL),(730,3,26,53,2,'2018-01-09 06:00:00',5.97,2,0.50,5,'clôturé',NULL),(731,3,26,53,2,'2018-01-31 18:00:00',3.87,3,0.50,5,'clôturé',NULL),(732,3,26,53,2,'2018-03-14 21:00:00',1.42,3,0.50,5,'clôturé',NULL),(733,3,26,53,2,'2018-03-22 13:00:00',1.60,2,0.50,5,'clôturé',NULL),(734,3,26,53,2,'2018-03-26 21:00:00',2.21,2,0.50,5,'clôturé',NULL),(735,3,26,53,2,'2018-03-05 02:00:00',1.41,3,0.50,5,'clôturé',NULL),(736,3,26,53,2,'2018-03-06 22:00:00',1.55,3,0.50,5,'clôturé',NULL),(737,3,26,53,2,'2018-04-03 13:00:00',4.41,3,0.50,5,'clôturé',NULL),(738,3,26,53,2,'2018-05-03 13:00:00',6.05,2,0.50,5,'clôturé',NULL),(739,3,26,53,2,'2018-06-20 01:00:00',2.97,2,0.50,5,'clôturé',NULL),(740,3,26,53,2,'2018-05-15 17:00:00',3.01,3,0.50,5,'clôturé',NULL),(741,3,26,53,2,'2018-07-03 13:00:00',1.39,3,0.50,5,'clôturé',NULL),(742,3,26,53,2,'2018-09-06 01:00:00',1.67,2,0.50,5,'clôturé',NULL),(743,3,26,53,2,'2018-10-02 01:00:00',1.32,2,0.50,5,'clôturé',NULL),(744,3,26,53,2,'2018-08-15 21:00:00',3.36,3,0.50,5,'clôturé',NULL),(745,3,26,53,2,'2018-10-08 09:00:00',2.32,4,0.50,5,'clôturé',NULL),(746,3,26,53,2,'2018-11-13 06:00:00',1.42,3,0.50,5,'clôturé',NULL),(747,3,26,53,2,'2018-10-23 17:00:00',1.13,3,0.50,5,'clôturé',NULL),(748,3,26,53,2,'2018-10-30 09:00:00',1.17,3,0.50,5,'clôturé',NULL),(749,3,26,53,2,'2018-12-04 18:00:00',1.39,3,0.50,5,'clôturé',NULL),(750,3,26,53,2,'2018-12-12 10:00:00',3.65,2,0.50,5,'clôturé',NULL),(751,3,26,53,2,'2018-12-10 10:00:00',1.90,2,0.50,5,'clôturé',NULL),(752,3,26,53,2,'2018-12-18 14:00:00',3.14,2,0.50,5,'clôturé',NULL),(753,3,26,53,2,'2018-12-28 14:00:00',3.65,2,0.50,5,'clôturé',NULL),(754,3,26,53,2,'2019-02-12 06:00:00',3.63,3,0.50,5,'clôturé',NULL),(755,3,26,53,2,'2019-01-15 14:00:00',4.85,3,0.50,5,'clôturé',NULL),(756,3,26,53,2,'2019-01-23 14:00:00',1.69,3,0.50,5,'clôturé',NULL),(757,3,26,53,2,'2019-03-01 14:00:00',5.26,2,0.50,5,'clôturé',NULL),(758,3,26,53,2,'2019-03-08 14:00:00',3.51,3,0.50,5,'clôturé',NULL),(759,3,26,53,2,'2019-03-29 01:00:00',2.95,3,0.50,5,'clôturé',NULL),(760,3,26,53,2,'2019-03-19 10:00:00',2.25,2,0.50,5,'clôturé',NULL),(761,3,26,53,2,'2019-04-26 09:00:00',1.38,3,0.50,5,'clôturé',NULL),(762,3,26,53,2,'2019-04-30 09:00:00',4.11,3,0.50,5,'clôturé',NULL),(763,3,26,53,2,'2019-05-07 09:00:00',1.99,2,0.50,5,'clôturé',NULL),(764,3,26,53,2,'2019-05-10 09:00:00',2.21,2,0.50,5,'clôturé',NULL),(765,3,26,53,2,'2019-06-18 17:00:00',1.90,3,0.50,5,'clôturé',NULL),(766,3,26,53,2,'2019-05-25 05:00:00',2.58,3,0.50,5,'clôturé',NULL),(767,3,26,53,2,'2019-07-01 01:00:00',0.97,4,0.50,5,'clôturé',NULL),(768,3,26,53,2,'2019-08-08 01:00:00',1.34,2,0.50,5,'clôturé',NULL),(769,3,26,53,2,'2019-09-03 09:00:00',4.22,3,0.50,5,'clôturé',NULL),(770,3,26,53,2,'2019-07-22 17:00:00',1.48,3,0.50,5,'clôturé',NULL),(771,3,26,53,2,'2019-08-27 01:00:00',1.60,2,0.50,5,'clôturé',NULL),(772,3,26,53,2,'2019-09-16 17:00:00',3.88,3,0.50,5,'clôturé',NULL),(773,3,26,53,2,'2019-10-28 09:00:00',2.22,3,0.50,5,'clôturé',NULL),(774,3,26,53,2,'2019-09-25 05:00:00',2.21,2,0.50,5,'clôturé',NULL),(775,3,26,53,2,'2019-09-11 13:00:00',4.28,2,0.50,5,'clôturé',NULL),(776,3,26,53,2,'2019-10-08 13:00:00',1.34,2,0.50,5,'clôturé',NULL),(777,3,26,53,2,'2019-10-22 13:00:00',3.98,4,0.50,5,'clôturé',NULL),(778,3,26,53,2,'2019-10-30 13:00:00',4.02,2,0.50,5,'clôturé',NULL),(779,3,26,53,2,'2019-12-05 02:00:00',2.43,2,0.50,5,'clôturé',NULL),(780,3,26,53,2,'2019-11-04 14:00:00',0.91,4,0.50,5,'clôturé',NULL),(781,3,26,53,2,'2019-12-02 02:00:00',4.21,3,0.50,5,'clôturé',NULL),(782,3,26,53,2,'2019-11-27 02:00:00',4.07,2,0.50,5,'clôturé',NULL),(783,3,26,53,2,'2019-12-06 18:00:00',2.53,3,0.50,5,'clôturé',NULL),(784,3,26,53,2,'0020-01-02 02:50:39',3.20,3,0.50,5,'clôturé',NULL),(785,3,26,53,2,'2020-01-01 22:00:00',3.20,3,0.50,5,'clôturé',NULL),(787,3,12,29,2,'2015-01-11 23:00:00',12.00,1,0.50,4,'clôturé',NULL),(790,3,29,20,2,'2018-03-06 23:00:00',4.47,3,0.50,6,'clôturé',NULL),(791,3,29,20,2,'2018-02-13 23:00:00',2.47,2,0.50,6,'clôturé',NULL),(792,3,29,20,2,'2018-02-20 23:00:00',2.96,2,0.50,6,'clôturé',NULL),(793,3,29,20,2,'2018-05-09 22:00:00',1.61,2,0.50,6,'clôturé',NULL),(794,3,29,20,2,'2018-05-24 22:00:00',1.72,3,0.50,6,'clôturé',NULL),(795,3,29,20,2,'2018-04-03 22:00:00',1.33,3,0.50,6,'clôturé',NULL),(796,3,29,20,2,'2018-05-16 22:00:00',1.61,2,0.50,6,'clôturé',NULL),(797,3,29,20,2,'2018-07-04 22:00:00',2.52,3,0.50,5,'clôturé',NULL),(798,3,29,20,2,'2018-09-17 22:00:00',3.30,2,0.50,6,'clôturé',NULL),(799,3,29,20,2,'2018-09-19 22:00:00',1.35,3,0.50,6,'clôturé',NULL),(800,3,29,20,2,'2018-09-10 22:00:00',2.69,2,0.50,6,'clôturé',NULL),(801,3,31,20,2,'2018-03-06 22:00:00',2.49,3,0.50,5,'clôturé',NULL),(802,3,31,20,2,'2018-02-11 22:00:00',1.06,2,0.50,5,'clôturé',NULL),(803,3,31,20,2,'2018-01-10 10:00:00',1.41,2,0.50,5,'clôturé',NULL),(804,3,31,20,2,'2018-01-30 22:00:00',1.51,2,0.50,5,'clôturé',NULL),(805,3,31,20,2,'2018-02-16 14:00:00',2.28,2,0.50,5,'clôturé',NULL),(806,3,31,20,2,'2018-03-14 21:00:00',2.07,3,0.50,5,'clôturé',NULL),(807,3,31,20,2,'2018-02-21 17:00:00',1.74,2,0.50,5,'clôturé',NULL),(808,3,31,20,2,'2018-03-27 01:00:00',1.00,2,0.50,5,'clôturé',NULL),(809,3,31,20,2,'2018-03-28 13:00:00',1.95,3,0.50,5,'clôturé',NULL),(810,3,31,20,2,'2018-04-15 21:00:00',1.47,2,0.50,5,'clôturé',NULL),(811,3,31,20,2,'2018-04-19 21:00:00',1.15,3,0.50,5,'clôturé',NULL),(812,3,31,20,2,'2018-05-11 17:00:00',1.94,3,0.50,5,'clôturé',NULL),(813,3,31,20,2,'2018-04-24 17:00:00',1.82,3,0.50,5,'clôturé',NULL),(814,3,31,20,2,'2018-06-27 01:00:00',2.54,2,0.50,5,'clôturé',NULL),(815,3,31,20,2,'2018-06-20 05:00:00',1.44,2,0.50,5,'clôturé',NULL),(816,3,31,20,2,'2018-06-22 05:00:00',2.72,2,0.50,5,'clôturé',NULL),(817,3,31,20,2,'2018-07-03 13:00:00',2.37,3,0.50,5,'clôturé',NULL),(818,3,31,20,2,'2018-06-27 01:00:00',3.33,2,0.50,5,'clôturé',NULL),(819,3,31,20,2,'2018-08-08 13:00:00',1.71,3,0.50,5,'clôturé',NULL),(820,3,31,20,2,'2018-08-20 01:00:00',5.46,3,0.50,5,'clôturé',NULL),(821,3,31,20,2,'2018-09-03 05:00:00',5.60,2,0.50,5,'clôturé',NULL),(822,3,31,20,2,'2018-09-10 09:00:00',2.38,2,0.50,5,'clôturé',NULL),(823,3,31,20,2,'2018-09-18 09:00:00',3.00,3,0.50,5,'clôturé',NULL),(824,3,31,20,2,'2018-10-23 17:00:00',1.61,3,0.50,5,'clôturé',NULL),(825,3,31,20,2,'2018-11-09 10:00:00',7.17,2,0.50,5,'clôturé',NULL),(826,3,31,20,2,'2018-10-08 09:00:00',3.06,3,0.50,5,'clôturé',NULL),(827,3,31,20,2,'2018-12-04 02:00:00',1.51,3,0.50,5,'clôturé',NULL),(828,3,31,20,2,'2018-10-22 01:00:00',1.25,3,0.50,5,'clôturé',NULL),(829,3,31,20,2,'2018-12-10 10:00:00',2.76,2,0.50,5,'clôturé',NULL),(830,3,31,20,2,'2018-11-21 10:00:00',2.82,3,0.50,5,'clôturé',NULL),(831,3,31,20,2,'2018-11-30 06:00:00',1.70,2,0.50,5,'clôturé',NULL),(832,3,31,20,2,'2018-12-24 10:00:00',2.87,2,0.50,5,'clôturé',NULL),(835,3,19,48,2,'2025-03-26 07:00:00',2.20,2,0.50,1,'clôturé',NULL),(836,3,34,56,2,'2018-04-26 07:30:00',1.71,3,0.50,4,'clôturé',NULL),(837,3,34,56,2,'2018-05-08 13:30:00',5.00,3,0.50,4,'clôturé',NULL),(838,3,34,56,2,'2018-05-11 14:30:00',3.25,3,0.50,4,'clôturé',NULL),(839,3,34,56,2,'2018-05-11 11:30:00',2.40,2,0.50,4,'clôturé',NULL),(840,3,34,56,2,'2018-05-11 10:30:00',1.50,2,0.50,4,'clôturé',NULL),(841,3,34,56,2,'2018-05-04 14:30:00',1.29,3,0.50,4,'clôturé',NULL),(842,3,34,56,2,'2018-05-22 16:30:00',3.71,2,0.50,4,'clôturé',NULL),(843,3,34,56,2,'2018-06-01 16:30:00',1.34,3,0.50,4,'clôturé',NULL),(844,3,34,56,2,'2018-06-11 16:30:00',3.11,2,0.50,4,'clôturé',NULL),(845,3,34,56,2,'2018-06-12 13:30:00',2.90,2,0.50,4,'clôturé',NULL),(846,3,34,56,2,'2018-06-14 11:30:00',9.00,3,0.50,4,'clôturé',NULL),(847,3,34,56,2,'2018-06-20 08:30:00',1.13,3,0.50,4,'clôturé',NULL),(848,3,35,8,2,'2018-01-03 14:00:00',3.04,2,0.50,5,'clôturé',NULL),(849,3,36,48,2,'2018-01-05 17:15:00',1.48,3,0.50,5,'clôturé',NULL),(850,3,36,48,2,'2017-12-14 19:15:00',4.20,3,0.50,5,'clôturé',NULL),(851,3,36,48,2,'2018-02-12 13:15:00',1.63,3,0.50,5,'clôturé',NULL),(852,3,36,48,2,'2018-01-18 13:15:00',1.95,2,0.50,5,'clôturé',NULL),(853,3,36,48,2,'2018-03-06 09:15:00',0.79,4,0.50,5,'clôturé',NULL),(854,3,36,48,2,'2018-01-22 13:15:00',0.97,3,0.50,5,'clôturé',NULL),(855,3,36,48,2,'2018-03-28 12:15:00',1.88,2,0.50,5,'clôturé',NULL),(856,3,36,48,2,'2018-04-16 12:15:00',2.39,3,0.50,5,'clôturé',NULL),(857,3,36,48,2,'2018-04-20 16:15:00',1.51,3,0.50,5,'clôturé',NULL),(858,3,36,48,2,'2018-05-04 08:15:00',1.81,3,0.50,5,'clôturé',NULL),(859,3,36,48,2,'2018-06-20 12:15:00',2.71,1,0.50,5,'clôturé',NULL),(860,3,36,48,2,'2018-05-16 16:15:00',3.22,4,0.50,5,'clôturé',NULL),(861,3,36,48,2,'2018-05-30 08:15:00',1.22,2,0.50,5,'clôturé',NULL),(862,3,36,48,2,'2018-08-03 13:00:00',0.56,4,0.50,5,'clôturé',NULL),(863,3,36,48,2,'2018-07-25 12:15:00',1.88,1,0.50,5,'clôturé',NULL),(864,3,36,48,2,'2018-07-11 12:15:00',2.66,3,0.50,5,'clôturé',NULL),(865,3,36,48,2,'2018-08-23 16:15:00',2.03,3,0.50,5,'clôturé',NULL),(866,3,36,48,2,'2018-07-20 08:15:00',4.31,3,0.50,5,'clôturé',NULL),(867,3,36,48,2,'2018-07-30 12:15:00',1.46,2,0.50,5,'clôturé',NULL),(868,3,36,48,2,'2018-01-31 17:15:00',2.53,2,0.50,5,'clôturé',NULL),(869,3,36,48,2,'2018-09-04 16:15:00',2.67,2,0.50,5,'clôturé',NULL),(870,3,36,48,2,'2018-09-19 16:15:00',1.93,3,0.50,5,'clôturé',NULL),(871,3,36,48,2,'2018-09-27 16:15:00',1.48,3,0.50,5,'clôturé',NULL),(872,3,36,48,2,'2018-11-07 17:15:00',0.99,3,0.50,5,'clôturé',NULL),(873,3,36,48,2,'2018-11-27 09:15:00',1.43,3,0.50,5,'clôturé',NULL),(874,3,36,48,2,'2018-11-20 13:15:00',0.92,2,0.50,5,'clôturé',NULL),(875,3,36,48,2,'2018-08-23 12:15:00',2.79,3,0.50,5,'clôturé',NULL),(876,3,36,48,2,'2018-11-14 13:15:00',1.46,3,0.50,5,'clôturé',NULL),(877,3,36,48,2,'2018-08-10 12:15:00',8.07,2,0.50,5,'clôturé',NULL),(878,3,36,48,2,'2018-11-28 17:15:00',1.69,2,0.50,5,'clôturé',NULL),(879,3,36,48,2,'2018-12-04 17:15:00',3.50,2,0.50,5,'clôturé',NULL),(880,3,36,48,2,'2018-12-07 13:15:00',4.32,2,0.50,5,'clôturé',NULL),(881,3,36,48,2,'2018-12-11 09:15:00',5.20,2,0.50,5,'clôturé',NULL),(882,3,36,48,2,'2018-12-14 17:15:00',4.82,2,0.50,5,'clôturé',NULL),(883,3,36,48,2,'2018-12-21 13:15:00',1.97,3,0.50,5,'clôturé',NULL),(884,3,35,8,2,'2018-01-11 06:00:00',5.15,3,0.50,5,'clôturé',NULL),(885,3,35,8,2,'2018-01-19 06:00:00',3.78,1,0.50,5,'clôturé',NULL),(886,3,35,8,2,'2018-01-29 14:00:00',2.35,2,0.50,5,'clôturé',NULL),(887,3,35,8,2,'2018-01-08 14:00:00',2.19,3,0.50,5,'clôturé',NULL),(888,3,35,8,2,'2018-01-16 10:00:00',2.69,2,0.50,5,'clôturé',NULL),(889,3,35,8,2,'2018-01-23 14:00:00',3.15,2,0.50,5,'clôturé',NULL),(890,3,35,8,2,'2018-01-23 10:00:00',2.49,3,0.50,5,'clôturé',NULL),(891,3,35,8,2,'2018-02-05 06:00:00',3.32,3,0.50,5,'clôturé',NULL),(892,3,35,8,2,'2018-03-05 10:00:00',1.81,3,0.50,5,'clôturé',NULL),(893,3,35,8,2,'2018-02-20 10:00:00',6.54,2,0.50,5,'clôturé',NULL),(894,3,35,8,2,'2018-02-13 02:00:00',1.41,2,0.50,5,'clôturé',NULL),(895,3,35,8,2,'2018-03-04 22:00:00',6.02,2,0.50,5,'clôturé',NULL),(896,3,35,8,2,'2018-02-15 02:00:00',2.61,2,0.50,5,'clôturé',NULL),(897,3,35,8,2,'2018-02-26 14:00:00',1.16,3,0.50,5,'clôturé',NULL),(898,3,35,8,2,'2018-03-22 01:00:00',1.74,2,0.50,5,'clôturé',NULL),(899,3,35,8,2,'2018-03-27 13:00:00',2.24,1,0.50,5,'clôturé',NULL),(900,3,35,8,2,'2018-03-06 06:00:00',3.33,2,0.50,5,'clôturé',NULL),(901,3,35,8,2,'2018-03-29 05:00:00',2.56,3,0.50,5,'clôturé',NULL),(902,3,35,8,2,'2018-03-18 21:00:00',5.63,2,0.50,5,'clôturé',NULL),(903,3,35,8,2,'2018-03-23 17:00:00',3.02,3,0.50,5,'clôturé',NULL),(904,3,35,8,2,'2018-04-02 13:00:00',2.40,3,0.50,5,'clôturé',NULL),(905,3,35,8,2,'2018-04-17 09:00:00',3.22,2,0.50,5,'clôturé',NULL),(906,3,35,8,2,'2018-05-02 07:34:00',9.34,2,0.50,5,'clôturé',NULL),(907,3,35,8,2,'2018-04-12 09:00:00',2.36,2,0.50,5,'clôturé',NULL),(908,3,35,8,2,'2018-04-26 17:00:00',1.88,3,0.50,5,'clôturé',NULL),(909,3,35,8,2,'2018-04-20 09:00:00',2.88,2,0.50,5,'clôturé',NULL),(910,3,35,8,2,'2018-05-09 01:00:00',4.24,3,0.50,5,'clôturé',NULL),(911,3,35,8,2,'2018-05-15 12:00:00',2.62,3,0.50,5,'clôturé',NULL),(912,3,35,8,2,'2018-05-21 13:00:00',6.84,2,0.50,5,'clôturé',NULL),(913,3,35,8,2,'2018-05-22 17:00:00',1.04,3,0.50,5,'clôturé',NULL),(914,3,35,8,2,'2018-05-30 21:00:00',1.17,3,0.50,5,'clôturé',NULL),(915,3,35,8,2,'2018-06-08 05:00:00',3.90,2,0.50,5,'clôturé',NULL),(916,3,35,8,2,'2018-06-14 01:00:00',5.00,3,0.50,5,'clôturé',NULL),(917,3,35,8,2,'2018-06-18 09:00:00',5.56,2,0.50,5,'clôturé',NULL),(918,3,35,8,2,'2018-06-21 05:00:00',2.00,3,0.50,5,'clôturé',NULL),(919,3,35,8,2,'2018-07-18 21:00:00',5.02,3,0.50,5,'clôturé',NULL),(920,3,35,8,2,'2018-07-30 09:00:00',2.28,3,0.50,5,'clôturé',NULL),(921,3,35,8,2,'2018-07-17 21:00:00',4.56,3,0.50,5,'clôturé',NULL),(922,3,35,8,2,'2018-07-26 01:00:00',1.44,2,0.50,5,'clôturé',NULL),(923,3,35,8,2,'2018-08-03 05:00:00',3.26,2,0.50,5,'clôturé',NULL),(924,3,35,8,2,'2018-07-03 13:00:00',2.09,2,0.50,5,'clôturé',NULL),(925,3,35,8,2,'2018-08-13 13:00:00',2.21,1,0.50,5,'clôturé',NULL),(926,3,35,8,2,'2018-08-16 09:00:00',2.70,3,0.50,5,'clôturé',NULL),(927,3,35,8,2,'2018-08-27 01:00:00',4.15,2,0.50,5,'clôturé',NULL),(928,3,35,8,2,'2018-09-03 09:00:00',7.50,2,0.50,5,'clôturé',NULL),(929,3,35,8,2,'2018-09-04 21:00:00',1.71,3,0.50,5,'clôturé',NULL),(930,3,35,8,2,'2018-09-11 09:00:00',1.76,3,0.50,5,'clôturé',NULL),(931,3,35,8,2,'2018-09-27 01:00:00',8.29,3,0.50,5,'clôturé',NULL),(932,3,35,8,2,'2018-10-11 13:00:00',3.04,2,0.50,5,'clôturé',NULL),(933,3,35,8,2,'2018-10-22 05:00:00',1.42,2,0.50,5,'clôturé',NULL),(934,3,35,8,2,'2018-10-29 17:00:00',1.25,3,0.50,5,'clôturé',NULL),(935,3,35,8,2,'2018-11-08 18:00:00',5.54,3,0.50,5,'clôturé',NULL),(1001,3,35,8,2,'2018-11-13 18:00:00',3.04,1,0.50,5,'clôturé',NULL),(1002,3,35,8,2,'2018-12-19 06:00:00',3.53,2,0.50,5,'clôturé',NULL),(1003,3,35,8,2,'2018-12-20 10:00:00',2.59,2,0.50,5,'clôturé',NULL),(1004,3,35,8,2,'2018-12-26 14:00:00',2.85,4,0.50,5,'clôturé',NULL),(1005,3,35,8,2,'2018-12-05 14:00:00',3.12,4,0.50,5,'clôturé',NULL),(1006,3,38,13,2,'2018-01-12 02:00:00',3.17,3,0.50,5,'clôturé',NULL),(1007,3,38,13,2,'2018-01-22 06:00:00',3.43,2,0.50,5,'clôturé',NULL),(1008,3,38,13,2,'2018-02-14 02:00:00',4.54,2,0.50,5,'clôturé',NULL),(1009,3,38,13,2,'2018-02-15 02:00:00',0.72,4,0.50,5,'clôturé',NULL),(1010,3,38,13,2,'2018-02-20 10:00:00',2.71,2,0.50,5,'clôturé',NULL),(1011,3,38,13,2,'2018-02-08 06:00:00',1.65,4,0.50,5,'clôturé',NULL),(1012,3,38,13,2,'2018-01-25 22:00:00',2.41,2,0.50,5,'clôturé',NULL),(1013,3,38,13,2,'2018-02-04 22:00:00',1.98,3,0.50,5,'clôturé',NULL),(1014,3,38,13,2,'2018-03-05 10:00:00',2.94,3,0.50,5,'clôturé',NULL),(1015,3,38,13,2,'2018-03-08 10:00:00',3.11,3,0.50,5,'clôturé',NULL),(1016,3,38,13,2,'2018-04-12 05:00:00',3.31,2,0.50,5,'clôturé',NULL),(1017,3,38,13,2,'2018-04-17 09:00:00',4.39,3,0.50,5,'clôturé',NULL),(1018,3,38,13,2,'2018-04-18 09:00:00',1.55,4,0.50,5,'clôturé',NULL),(1019,3,38,13,2,'2018-04-26 17:00:00',1.50,3,0.50,5,'clôturé',NULL),(1020,3,38,13,2,'2018-05-01 05:00:00',2.04,3,0.50,5,'clôturé',NULL),(1021,3,38,13,2,'2018-04-26 09:00:00',4.16,2,0.50,5,'clôturé',NULL),(1022,3,38,13,2,'2018-05-11 13:00:00',1.75,3,0.50,5,'clôturé',NULL),(1023,3,38,13,2,'2018-05-02 13:00:00',3.34,2,0.50,5,'clôturé',NULL),(1024,3,38,13,2,'2018-05-07 13:00:00',3.38,2,0.50,5,'clôturé',NULL),(1025,3,38,13,2,'2018-05-07 17:00:00',1.74,4,0.50,5,'clôturé',NULL),(1026,3,38,13,2,'2018-05-30 21:00:00',3.13,3,0.50,5,'clôturé',NULL),(1027,3,38,13,2,'2018-05-18 09:00:00',7.74,3,0.50,5,'clôturé',NULL),(1028,3,38,13,2,'2018-06-07 13:00:00',3.40,3,0.50,5,'clôturé',NULL),(1029,3,38,13,2,'2018-06-14 13:00:00',2.75,3,0.50,5,'clôturé',NULL),(1030,3,38,13,2,'2018-06-20 17:00:00',1.37,2,0.50,5,'clôturé',NULL),(1049,3,38,13,2,'2018-01-21 18:00:00',1.12,3,0.50,5,'clôturé',NULL),(1050,3,38,13,2,'2018-06-25 13:00:00',1.93,3,0.50,5,'clôturé',NULL),(1051,3,38,13,2,'2018-06-28 21:00:00',4.43,3,0.50,5,'clôturé',NULL),(1052,3,38,13,2,'2018-07-10 05:00:00',2.72,2,0.50,5,'clôturé',NULL),(1053,3,38,13,2,'2018-07-17 13:00:00',4.03,3,0.50,5,'clôturé',NULL),(1054,3,38,13,2,'2018-07-03 17:00:00',2.27,2,0.50,5,'clôturé',NULL),(1055,3,38,13,2,'2018-07-06 01:00:00',2.80,2,0.50,5,'clôturé',NULL),(1056,3,38,13,2,'2018-07-12 17:00:00',4.68,3,0.50,5,'clôturé',NULL),(1057,3,38,13,2,'2018-07-03 01:00:00',2.41,2,0.50,5,'clôturé',NULL),(1058,3,38,13,2,'2018-07-25 21:00:00',2.41,2,0.50,5,'clôturé',NULL),(1059,3,38,13,2,'2018-07-30 05:00:00',2.94,3,0.50,5,'clôturé',NULL),(1060,3,38,13,2,'2018-08-01 21:00:00',1.21,3,0.50,5,'clôturé',NULL),(1061,3,38,13,2,'2018-08-08 05:00:00',3.71,2,0.50,5,'clôturé',NULL),(1062,3,38,13,2,'2018-09-05 05:00:00',3.71,2,0.50,5,'clôturé',NULL),(1064,3,38,13,2,'2018-08-14 13:00:00',2.53,2,0.50,5,'clôturé',NULL),(1065,3,38,13,2,'2018-08-19 21:00:00',5.03,3,0.50,5,'clôturé',NULL),(1066,3,38,13,2,'2018-09-26 21:00:00',2.22,3,0.50,5,'clôturé',NULL),(1067,3,38,13,2,'2018-09-20 05:00:00',4.00,2,0.50,5,'clôturé',NULL),(1068,3,38,13,2,'2018-10-15 17:00:00',1.25,3,0.50,5,'clôturé',NULL),(1069,3,38,13,2,'2018-09-10 01:00:00',2.67,3,0.50,5,'clôturé',NULL),(1070,3,38,13,2,'2018-09-24 13:00:00',2.34,2,0.50,5,'clôturé',NULL),(1071,3,38,13,2,'2018-10-02 05:00:00',2.08,2,0.50,5,'clôturé',NULL),(1072,3,38,13,2,'2018-10-16 09:00:00',1.93,3,0.50,5,'clôturé',NULL),(1073,3,38,13,2,'2018-10-29 05:00:00',2.35,3,0.50,5,'clôturé',NULL),(1074,3,38,13,2,'2018-11-09 14:00:00',2.02,3,0.50,5,'clôturé',NULL),(1075,3,38,13,2,'2018-11-13 10:00:00',1.06,3,0.50,5,'clôturé',NULL),(1076,3,38,13,2,'2018-11-27 06:00:00',1.95,2,0.50,5,'clôturé',NULL),(1077,3,38,13,2,'2018-12-14 02:00:00',1.97,3,0.50,5,'clôturé',NULL),(1078,3,38,13,2,'2018-12-26 22:00:00',1.96,2,0.50,5,'clôturé',NULL),(1079,3,38,13,2,'2018-12-13 02:00:00',1.41,2,0.50,5,'clôturé',NULL),(1080,3,21,52,2,'2019-01-22 15:00:00',3.22,3,0.50,5,'clôturé',NULL),(1081,3,21,52,2,'2019-01-09 11:00:00',2.93,4,0.50,5,'clôturé',NULL),(1082,3,21,52,2,'2019-01-25 03:00:00',1.12,3,0.50,5,'clôturé',NULL),(1083,3,21,52,2,'2019-01-29 07:00:00',8.53,2,0.50,5,'clôturé',NULL),(1084,3,21,52,2,'2019-01-30 15:00:00',2.40,2,0.50,5,'clôturé',NULL),(1085,3,21,52,2,'2019-02-01 11:00:00',3.09,3,0.50,5,'clôturé',NULL),(1086,3,21,52,2,'2019-02-07 23:00:00',5.42,2,0.50,5,'clôturé',NULL),(1087,3,21,52,2,'2019-02-12 11:00:00',2.17,2,0.50,5,'clôturé',NULL),(1088,3,21,52,2,'2019-02-14 23:00:00',4.95,3,0.50,5,'clôturé',NULL),(1089,3,21,52,2,'2019-04-27 18:00:00',1.60,2,0.50,5,'clôturé',NULL),(1090,3,21,52,2,'2019-03-08 03:00:00',4.28,3,0.50,5,'clôturé',NULL),(1091,3,21,52,2,'2019-03-14 10:00:00',0.85,4,0.50,5,'clôturé',NULL),(1092,3,21,52,2,'2019-03-25 22:00:00',5.00,3,0.50,5,'clôturé',NULL),(1093,3,21,52,2,'2019-04-03 10:00:00',1.77,2,0.50,5,'clôturé',NULL),(1094,3,21,52,2,'2019-04-05 06:00:00',1.34,3,0.50,5,'clôturé',NULL),(1095,3,21,52,2,'2019-03-13 18:00:00',5.47,3,0.50,5,'clôturé',NULL),(1096,3,21,52,2,'2019-04-26 10:00:00',2.92,2,0.50,5,'clôturé',NULL),(1097,3,21,52,2,'2019-04-10 06:00:00',1.45,3,0.50,5,'clôturé',NULL),(1098,3,21,52,2,'2019-05-09 22:00:00',0.65,3,0.50,5,'clôturé',NULL),(1099,3,21,52,2,'2019-05-02 18:00:00',3.19,3,0.50,5,'clôturé',NULL),(1100,3,21,52,2,'2019-05-15 14:00:00',2.36,3,0.50,5,'clôturé',NULL),(1101,3,21,52,2,'2019-05-08 14:00:00',3.02,3,0.50,5,'clôturé',NULL),(1102,3,21,52,2,'2019-05-20 06:00:00',2.30,3,0.50,5,'clôturé',NULL),(1103,3,21,52,2,'2019-06-05 14:00:00',1.41,2,0.50,5,'clôturé',NULL),(1104,3,21,52,2,'2019-06-03 06:00:00',3.39,3,0.50,5,'clôturé',NULL),(1105,3,21,52,2,'2019-06-17 14:00:00',1.93,3,0.50,5,'clôturé',NULL),(1106,3,21,52,2,'2019-05-30 10:00:00',0.99,4,0.50,5,'clôturé',NULL),(1107,3,21,52,2,'2019-06-10 22:00:00',6.08,2,0.50,5,'clôturé',NULL),(1108,3,21,52,2,'2019-07-04 02:00:00',1.97,3,0.50,5,'clôturé',NULL),(1109,3,21,52,2,'2019-06-25 18:00:00',2.13,3,0.50,5,'clôturé',NULL),(1110,3,21,52,2,'2019-07-05 10:00:00',1.17,2,0.50,5,'clôturé',NULL),(1111,3,21,52,2,'2019-07-09 14:00:00',1.24,3,0.50,5,'clôturé',NULL),(1112,3,21,52,2,'2019-06-27 18:00:00',2.43,2,0.50,5,'clôturé',NULL),(1113,3,21,52,2,'2019-07-19 18:00:00',2.09,2,0.50,5,'clôturé',NULL),(1114,3,21,52,2,'2019-07-25 14:00:00',1.79,4,0.50,5,'clôturé',NULL),(1115,3,21,52,2,'2019-08-30 02:00:00',1.82,3,0.50,5,'clôturé',NULL),(1116,3,21,52,2,'2019-08-20 02:00:00',7.05,3,0.50,5,'clôturé',NULL),(1117,3,21,52,2,'2019-08-09 02:00:00',8.20,2,0.50,5,'clôturé',NULL),(1118,3,21,52,2,'2019-08-20 06:00:00',1.32,2,0.50,5,'clôturé',NULL),(1119,3,21,52,2,'2019-08-22 02:00:00',1.58,3,0.50,5,'clôturé',NULL),(1120,3,21,52,2,'2019-08-26 18:00:00',4.02,2,0.50,5,'clôturé',NULL),(1121,3,21,52,2,'2019-09-02 22:00:00',4.35,2,0.50,5,'clôturé',NULL),(1122,3,21,52,2,'2019-09-06 10:00:00',2.25,2,0.50,5,'clôturé',NULL),(1123,3,21,52,2,'2019-09-04 22:00:00',2.44,3,0.50,5,'clôturé',NULL),(1124,3,21,52,2,'2019-09-24 14:00:00',2.02,3,0.50,5,'clôturé',NULL),(1125,3,21,52,2,'2019-10-01 10:00:00',8.57,3,0.50,5,'clôturé',NULL),(1126,3,21,52,2,'2019-09-10 06:00:00',9.12,3,0.50,5,'clôturé',NULL),(1127,3,21,52,2,'2019-11-04 23:00:00',1.11,3,0.50,5,'clôturé',NULL),(1128,3,21,52,2,'2019-09-16 18:00:00',1.95,3,0.50,5,'clôturé',NULL),(1129,3,21,52,2,'2019-10-29 14:00:00',2.37,2,0.50,5,'clôturé',NULL),(1130,3,21,52,2,'2019-11-18 07:00:00',1.35,3,0.50,5,'clôturé',NULL),(1131,3,21,52,2,'2019-11-22 15:00:00',1.81,3,0.50,5,'clôturé',NULL),(1132,3,21,52,2,'2019-12-05 15:00:00',1.91,2,0.50,5,'clôturé',NULL),(1133,3,21,52,2,'2019-11-26 11:00:00',3.79,2,0.50,5,'clôturé',NULL),(1134,3,21,52,2,'2019-12-11 03:00:00',3.45,3,0.50,5,'clôturé',NULL),(1135,3,21,52,2,'2019-12-27 07:00:00',3.46,2,0.50,5,'clôturé',NULL),(1136,3,21,52,2,'2020-01-01 11:00:00',8.64,2,0.50,5,'clôturé',NULL),(1141,3,38,13,2,'2018-01-09 10:00:00',4.89,2,0.50,5,'clôturé',NULL),(1146,3,38,13,2,'2019-04-05 05:00:00',1.98,3,0.50,5,'clôturé',NULL),(1151,3,40,53,2,'2023-07-27 21:00:00',12.50,2,0.50,4,'clôturé','2023-07-28 01:00:00'),(1152,3,40,53,2,'2023-07-31 19:00:00',3.49,3,0.50,4,'clôturé','2023-08-01 04:00:00'),(1153,3,40,53,2,'2023-07-28 17:00:00',4.92,3,0.50,4,'clôturé','2023-07-31 14:00:00'),(1154,3,40,53,2,'2023-08-07 18:00:00',1.13,2,0.50,4,'clôturé','2023-08-08 01:00:00'),(1155,3,40,53,2,'2023-08-08 15:00:00',3.36,3,0.50,4,'clôturé','2023-08-08 19:00:00'),(1156,3,40,53,2,'2023-08-09 10:00:00',1.13,3,0.50,4,'clôturé','2023-08-09 14:00:00'),(1157,3,40,53,2,'2023-08-10 00:00:00',2.69,3,0.50,4,'clôturé','2023-08-10 06:00:00'),(1158,3,40,53,2,'2023-08-04 02:00:00',1.95,1,0.50,4,'clôturé','2023-08-04 19:00:00'),(1159,3,40,53,2,'2023-08-09 19:00:00',2.47,2,0.50,4,'clôturé','2023-08-09 21:00:00'),(1160,3,40,53,2,'2023-08-11 02:00:00',4.64,2,0.50,4,'clôturé','2023-08-11 08:00:00'),(1161,3,38,13,2,'2019-03-04 06:00:00',10.55,3,0.50,5,'clôturé',NULL),(1162,3,38,13,2,'2019-02-06 18:00:00',2.86,2,0.50,5,'clôturé',NULL),(1163,3,38,13,2,'2019-02-04 02:00:00',5.37,2,0.50,5,'clôturé',NULL),(1164,3,38,13,2,'2019-01-15 14:00:00',2.67,3,0.50,5,'clôturé',NULL),(1165,3,38,13,2,'2019-02-15 10:00:00',1.73,3,0.50,5,'clôturé',NULL),(1166,3,38,13,2,'2019-01-28 10:00:00',2.78,3,0.50,5,'clôturé',NULL),(1167,3,38,13,2,'2019-03-11 09:00:00',4.48,3,0.50,5,'clôturé',NULL),(1168,3,38,13,2,'2019-03-18 09:00:00',3.99,3,0.50,5,'clôturé',NULL),(1169,3,38,13,2,'2019-02-22 05:00:00',1.43,3,0.50,5,'clôturé',NULL),(1170,3,38,13,2,'2019-03-29 13:00:00',1.97,2,0.50,5,'clôturé',NULL),(1171,3,38,13,2,'2019-03-01 10:00:00',1.97,3,0.50,5,'clôturé',NULL),(1172,3,38,13,2,'2019-04-09 09:00:00',2.21,2,0.50,5,'clôturé',NULL),(1173,3,38,13,2,'2019-04-11 05:00:00',1.43,3,0.50,5,'clôturé',NULL),(1174,3,38,13,2,'2019-04-05 01:00:00',1.41,3,0.50,5,'clôturé',NULL),(1175,3,38,13,2,'2019-05-21 17:00:00',3.57,2,0.50,5,'clôturé',NULL),(1176,3,38,13,2,'2019-04-23 09:00:00',4.05,2,0.50,5,'clôturé',NULL),(1177,3,38,13,2,'2019-04-16 01:00:00',3.53,3,0.50,5,'clôturé',NULL),(1178,3,38,13,2,'2019-04-26 17:00:00',3.21,3,0.50,5,'clôturé',NULL),(1179,3,38,13,2,'2019-05-03 13:00:00',1.73,2,0.50,5,'clôturé',NULL),(1180,3,38,13,2,'2019-06-06 05:00:00',4.61,2,0.50,5,'clôturé',NULL),(1181,3,38,13,2,'2019-05-21 17:00:00',4.07,2,0.50,5,'clôturé',NULL),(1182,3,38,13,2,'2019-05-27 05:00:00',3.75,2,0.50,5,'clôturé',NULL),(1183,3,38,13,2,'2019-05-30 21:00:00',4.49,2,0.50,5,'clôturé',NULL),(1184,3,38,13,2,'0019-07-04 06:50:39',4.99,2,0.50,5,'clôturé',NULL),(1185,3,38,13,2,'2019-06-19 01:00:00',1.40,3,0.50,5,'clôturé',NULL),(1186,3,38,13,2,'2019-07-09 05:00:00',2.29,3,0.50,5,'clôturé',NULL),(1187,3,38,13,2,'2019-07-11 13:00:00',2.10,2,0.50,5,'clôturé',NULL),(1188,3,38,13,2,'2019-08-08 05:00:00',5.69,2,0.50,5,'clôturé',NULL),(1189,3,38,13,2,'2019-08-06 05:00:00',2.84,2,0.50,5,'clôturé',NULL),(1190,3,38,13,2,'2019-07-18 09:00:00',1.98,3,0.50,5,'clôturé',NULL),(1191,3,38,13,2,'2019-07-17 13:00:00',2.09,2,0.50,5,'clôturé',NULL),(1192,3,38,13,2,'2019-08-14 13:00:00',1.91,4,0.50,5,'clôturé',NULL),(1193,3,38,13,2,'2019-09-04 09:00:00',1.43,3,0.50,5,'clôturé',NULL),(1194,3,38,13,2,'2019-09-06 13:00:00',5.05,2,0.50,5,'clôturé',NULL),(1195,3,38,13,2,'2019-09-16 01:00:00',2.24,2,0.50,5,'clôturé',NULL),(1196,3,38,13,2,'2019-09-24 09:00:00',2.60,3,0.50,5,'clôturé',NULL),(1197,3,38,13,2,'2019-10-10 09:00:00',2.37,3,0.50,5,'clôturé',NULL),(1198,3,38,13,2,'2019-10-14 21:00:00',3.97,2,0.50,5,'clôturé',NULL),(1199,3,38,13,2,'2019-10-23 13:00:00',4.38,2,0.50,5,'clôturé',NULL),(1200,3,38,13,2,'2019-10-28 13:00:00',1.08,3,0.50,5,'clôturé',NULL),(1201,3,38,13,2,'2019-10-31 13:00:00',2.18,3,0.50,5,'clôturé',NULL),(1202,3,38,13,2,'2019-11-15 06:00:00',1.97,3,0.50,5,'clôturé',NULL),(1203,3,38,13,2,'2019-11-26 10:00:00',1.18,3,0.50,5,'clôturé',NULL),(1204,3,38,13,2,'2019-11-20 22:00:00',2.23,3,0.50,5,'clôturé',NULL),(1205,3,38,13,2,'2019-12-03 22:00:00',1.48,2,0.50,5,'clôturé',NULL),(1206,3,38,13,2,'2019-12-11 10:00:00',4.27,2,0.50,5,'clôturé',NULL),(1207,3,38,13,2,'2019-11-29 14:00:00',3.46,2,0.50,5,'clôturé',NULL),(1208,3,38,13,2,'2019-12-03 06:00:00',2.06,2,0.50,5,'clôturé',NULL),(1209,3,38,13,2,'2019-12-16 18:00:00',2.14,2,0.50,5,'clôturé',NULL),(1210,3,38,13,2,'2019-12-26 10:00:00',2.19,3,0.50,5,'clôturé',NULL),(1211,3,18,48,2,'2019-01-02 14:15:00',1.40,3,0.50,4,'clôturé',NULL),(1212,3,18,48,2,'2019-01-15 11:15:00',2.68,2,0.50,4,'clôturé',NULL),(1213,3,18,48,2,'2019-01-04 14:15:00',0.85,3,0.50,4,'clôturé',NULL),(1214,3,18,48,2,'2019-01-03 11:15:00',1.28,3,0.50,4,'clôturé',NULL),(1215,3,18,48,2,'2019-01-09 17:15:00',1.80,3,0.50,4,'clôturé',NULL),(1216,3,18,48,2,'2019-01-16 13:15:00',2.66,3,0.50,4,'clôturé',NULL),(1217,3,18,48,2,'2019-01-22 12:15:00',2.19,3,0.50,4,'clôturé',NULL),(1218,3,18,48,2,'2019-01-23 15:15:00',1.40,2,0.50,4,'clôturé',NULL),(1219,3,18,48,2,'2019-01-29 12:15:00',1.48,3,0.50,4,'clôturé',NULL),(1220,3,18,48,2,'2019-02-15 14:15:00',2.97,2,0.50,4,'clôturé',NULL),(1221,3,18,48,2,'2019-02-22 14:15:00',4.96,2,0.50,4,'clôturé',NULL),(1222,3,18,48,2,'2019-02-01 14:15:00',1.53,3,0.50,4,'clôturé',NULL),(1223,3,18,48,2,'2019-02-20 11:15:00',2.84,2,0.50,4,'clôturé',NULL),(1224,3,18,48,2,'2019-02-12 14:15:00',3.05,2,0.50,4,'clôturé',NULL),(1225,3,18,48,2,'2019-02-05 12:15:00',3.64,2,0.50,4,'clôturé',NULL),(1226,3,18,48,2,'2019-03-04 10:15:00',1.55,3,0.50,4,'clôturé',NULL),(1227,3,18,48,2,'2019-02-28 12:15:00',1.30,3,0.50,4,'clôturé',NULL),(1228,3,18,48,2,'2019-03-06 13:15:00',1.40,3,0.50,4,'clôturé',NULL),(1229,3,18,48,2,'2019-03-08 13:15:00',1.58,3,0.50,4,'clôturé',NULL),(1230,3,18,48,2,'2019-03-15 13:15:00',1.56,3,0.50,4,'clôturé',NULL),(1231,3,18,48,2,'2019-04-04 16:15:00',1.37,3,0.50,4,'clôturé',NULL),(1232,3,18,48,2,'2019-04-08 17:15:00',1.58,3,0.50,4,'clôturé',NULL),(1233,3,18,48,2,'2019-03-25 14:15:00',1.44,3,0.50,4,'clôturé',NULL),(1234,3,18,48,2,'2019-03-29 16:15:00',1.34,3,0.50,4,'clôturé',NULL),(1235,3,18,48,2,'2019-04-11 09:15:00',5.83,3,0.50,4,'clôturé',NULL),(1236,3,18,48,2,'2019-04-12 16:15:00',2.05,2,0.50,4,'clôturé',NULL),(1237,3,41,31,2,'2018-05-31 11:00:00',5.36,4,0.50,4,'clôturé',NULL),(1238,3,41,31,2,'2018-05-29 12:00:00',1.67,3,0.50,4,'clôturé',NULL),(1239,3,41,31,2,'2018-05-28 13:00:00',1.56,3,0.50,4,'clôturé',NULL),(1240,3,41,31,2,'2018-05-24 11:00:00',10.21,3,0.50,4,'clôturé',NULL),(1241,3,41,31,2,'2018-05-30 13:00:00',1.45,2,0.50,4,'clôturé',NULL),(1242,3,41,31,2,'2018-05-25 04:00:00',4.01,3,0.50,4,'clôturé',NULL),(1243,3,41,31,2,'2018-06-01 06:00:00',1.32,2,0.50,4,'clôturé',NULL),(1244,3,41,31,2,'2018-09-03 22:00:00',14.92,2,0.50,4,'clôturé',NULL),(1245,3,41,31,2,'2018-05-30 05:00:00',1.55,3,0.50,4,'clôturé',NULL);
/*!40000 ALTER TABLE `transactions_backtest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions_photos`
--

DROP TABLE IF EXISTS `transactions_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions_photos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_backtest_id` int NOT NULL,
  `photo_url` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `session_backtest_id` (`session_backtest_id`),
  CONSTRAINT `transactions_photos_ibfk_1` FOREIGN KEY (`session_backtest_id`) REFERENCES `sessions_backtest` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions_photos`
--

LOCK TABLES `transactions_photos` WRITE;
/*!40000 ALTER TABLE `transactions_photos` DISABLE KEYS */;
INSERT INTO `transactions_photos` VALUES (22,21,'/uploads/images/1744492359814.png','2025-04-12 21:12:39');
/*!40000 ALTER TABLE `transactions_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types_abonnement`
--

DROP TABLE IF EXISTS `types_abonnement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types_abonnement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_abonnement` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_abonnement` (`type_abonnement`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_abonnement`
--

LOCK TABLES `types_abonnement` WRITE;
/*!40000 ALTER TABLE `types_abonnement` DISABLE KEYS */;
INSERT INTO `types_abonnement` VALUES (4,'annuel'),(1,'gratuit'),(2,'mensuel'),(5,'premium'),(3,'trimestriel');
/*!40000 ALTER TABLE `types_abonnement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types_actif`
--

DROP TABLE IF EXISTS `types_actif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types_actif` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_actif` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_actif`
--

LOCK TABLES `types_actif` WRITE;
/*!40000 ALTER TABLE `types_actif` DISABLE KEYS */;
INSERT INTO `types_actif` VALUES (1,'forex'),(2,'commodity'),(3,'index'),(4,'stock');
/*!40000 ALTER TABLE `types_actif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types_strategies`
--

DROP TABLE IF EXISTS `types_strategies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types_strategies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_strategie` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_strategies`
--

LOCK TABLES `types_strategies` WRITE;
/*!40000 ALTER TABLE `types_strategies` DISABLE KEYS */;
INSERT INTO `types_strategies` VALUES (1,'Index'),(2,'Forex');
/*!40000 ALTER TABLE `types_strategies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types_user`
--

DROP TABLE IF EXISTS `types_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_user` (`type_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_user`
--

LOCK TABLES `types_user` WRITE;
/*!40000 ALTER TABLE `types_user` DISABLE KEYS */;
INSERT INTO `types_user` VALUES (2,'admin'),(1,'user');
/*!40000 ALTER TABLE `types_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_user_id` int NOT NULL,
  `type_abonnement_id` int NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `is_actif` enum('ACTIVE','INACTIVE') DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nickname` (`nickname`),
  UNIQUE KEY `email` (`email`),
  KEY `type_user_id` (`type_user_id`),
  KEY `type_abonnement_id` (`type_abonnement_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`type_user_id`) REFERENCES `types_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`type_abonnement_id`) REFERENCES `types_abonnement` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,2,1,'salimallagbe','arielallagbe15@gmail.com','$argon2id$v=19$m=65536,t=3,p=1$dDcKfQadK6+dbYzeACaPOQ$qkaqe+iJ7fFGPrzikZkQyS2GXBqNSru2KEGUcTrXLJw','ACTIVE','2025-01-10 21:26:24');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `validation`
--

DROP TABLE IF EXISTS `validation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `validation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `code` varchar(255) NOT NULL,
  `activation_date` datetime(6) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `validation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `validation`
--

LOCK TABLES `validation` WRITE;
/*!40000 ALTER TABLE `validation` DISABLE KEYS */;
INSERT INTO `validation` VALUES (2,3,'457499',NULL,'2025-01-10 21:26:24.292000','2025-01-10 21:41:24.292000');
/*!40000 ALTER TABLE `validation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-22 13:31:16




INSERT INTO `user` (`id`, `firstname`, `lastname`, `email`, `password`, `role`, `created_at`, `updated_at`)
VALUES (9999, 'Prof', 'Demo', 'prof@gmail.com', '$2b$12$tYcVmKCNvM4eEWzMoh/yreIgyz.HohXnDAD5e6cgPXQI87GZMpc7u$2y$10$abcdef1234567890abcdef1234567890abcdef1234567890abcdef', 'admin', NOW(), NOW());