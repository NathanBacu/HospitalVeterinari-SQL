/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.7.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: HospitalVeterinari
-- ------------------------------------------------------
-- Server version	12.1.2-MariaDB-ubu2404

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `Animal`
--

DROP TABLE IF EXISTS `Animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Animal` (
  `IdAnimal` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nom` varchar(15) NOT NULL,
  `Especie` varchar(15) NOT NULL,
  `Raza` varchar(20) NOT NULL,
  `DataNaixement` date DEFAULT NULL,
  `IdPropietari` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IdAnimal`),
  KEY `IdPropietari` (`IdPropietari`),
  CONSTRAINT `1` FOREIGN KEY (`IdPropietari`) REFERENCES `Propietari` (`IdPropietari`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Animal`
--

LOCK TABLES `Animal` WRITE;
/*!40000 ALTER TABLE `Animal` DISABLE KEYS */;
/*!40000 ALTER TABLE `Animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medicament`
--

DROP TABLE IF EXISTS `Medicament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Medicament` (
  `IdMedicament` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NomComercial` varchar(20) NOT NULL,
  `PrincipiActiu` varchar(50) NOT NULL,
  `Fabricant` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`IdMedicament`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medicament`
--

LOCK TABLES `Medicament` WRITE;
/*!40000 ALTER TABLE `Medicament` DISABLE KEYS */;
/*!40000 ALTER TABLE `Medicament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medicament_Tractament`
--

DROP TABLE IF EXISTS `Medicament_Tractament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Medicament_Tractament` (
  `IdTractament` int(10) unsigned NOT NULL,
  `IdMedicament` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IdTractament`,`IdMedicament`),
  KEY `IdMedicament` (`IdMedicament`),
  CONSTRAINT `1` FOREIGN KEY (`IdTractament`) REFERENCES `Tractament` (`IdTractament`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`IdMedicament`) REFERENCES `Medicament` (`IdMedicament`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medicament_Tractament`
--

LOCK TABLES `Medicament_Tractament` WRITE;
/*!40000 ALTER TABLE `Medicament_Tractament` DISABLE KEYS */;
/*!40000 ALTER TABLE `Medicament_Tractament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Propietari`
--

DROP TABLE IF EXISTS `Propietari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Propietari` (
  `IdPropietari` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nom` varchar(15) NOT NULL,
  `Cognom` varchar(30) NOT NULL DEFAULT '',
  `Telefon` char(9) NOT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdPropietari`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Propietari`
--

LOCK TABLES `Propietari` WRITE;
/*!40000 ALTER TABLE `Propietari` DISABLE KEYS */;
/*!40000 ALTER TABLE `Propietari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tractament`
--

DROP TABLE IF EXISTS `Tractament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tractament` (
  `IdTractament` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CantidadMedicaments` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`IdTractament`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tractament`
--

LOCK TABLES `Tractament` WRITE;
/*!40000 ALTER TABLE `Tractament` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tractament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Veterinario`
--

DROP TABLE IF EXISTS `Veterinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Veterinario` (
  `IdVeterinario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nom` varchar(15) NOT NULL,
  `Especialidad` varchar(20) NOT NULL,
  `DataInici` date DEFAULT NULL,
  `IdSupervisor` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`IdVeterinario`),
  KEY `fk_veterinario_supervisor` (`IdSupervisor`),
  CONSTRAINT `fk_veterinario_supervisor` FOREIGN KEY (`IdSupervisor`) REFERENCES `Veterinario` (`IdVeterinario`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Veterinario`
--

LOCK TABLES `Veterinario` WRITE;
/*!40000 ALTER TABLE `Veterinario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Veterinario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Visita`
--

DROP TABLE IF EXISTS `Visita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Visita` (
  `IdVisita` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Motivo` varchar(100) NOT NULL,
  `DiagnosticInicial` varchar(100) DEFAULT NULL,
  `IdTractament` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`IdVisita`),
  KEY `fk_Visita_Tractament` (`IdTractament`),
  CONSTRAINT `fk_Visita_Tractament` FOREIGN KEY (`IdTractament`) REFERENCES `Tractament` (`IdTractament`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Visita`
--

LOCK TABLES `Visita` WRITE;
/*!40000 ALTER TABLE `Visita` DISABLE KEYS */;
/*!40000 ALTER TABLE `Visita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Visita_Veterinario`
--

DROP TABLE IF EXISTS `Visita_Veterinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Visita_Veterinario` (
  `IdVisita` int(10) unsigned NOT NULL,
  `IdVeterinario` int(10) unsigned NOT NULL,
  `IdAnimal` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IdVisita`,`IdVeterinario`),
  KEY `fk_vv_veterinari` (`IdVeterinario`),
  KEY `fk_vv_animal` (`IdAnimal`),
  CONSTRAINT `fk_vv_animal` FOREIGN KEY (`IdAnimal`) REFERENCES `Animal` (`IdAnimal`),
  CONSTRAINT `fk_vv_veterinari` FOREIGN KEY (`IdVeterinario`) REFERENCES `Veterinario` (`IdVeterinario`),
  CONSTRAINT `fk_vv_visita` FOREIGN KEY (`IdVisita`) REFERENCES `Visita` (`IdVisita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Visita_Veterinario`
--

LOCK TABLES `Visita_Veterinario` WRITE;
/*!40000 ALTER TABLE `Visita_Veterinario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Visita_Veterinario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'HospitalVeterinari'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-04-13 19:45:32
