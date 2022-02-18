-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.6.5-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for lfl
CREATE DATABASE IF NOT EXISTS `lfl` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `lfl`;

-- Dumping structure for table lfl.attendance
CREATE TABLE IF NOT EXISTS `attendance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `matchId` int(10) unsigned NOT NULL DEFAULT 0,
  `userId` int(10) unsigned NOT NULL DEFAULT 0,
  `willAttend` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `matchId on matchgoal` (`matchId`),
  KEY `userId on matchgoal` (`userId`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`matchId`) REFERENCES `match` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.attendance: ~0 rows (approximately)
DELETE FROM `attendance`;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;

-- Dumping structure for table lfl.club
CREATE TABLE IF NOT EXISTS `club` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.club: ~2 rows (approximately)
DELETE FROM `club`;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
INSERT INTO `club` (`id`, `created`, `updated`, `name`) VALUES
	(1, '2022-02-07 09:16:43', '2022-02-07 09:16:43', 'Outlaws'),
	(2, '2022-02-07 09:16:50', '2022-02-07 09:16:50', 'Inlaws');
/*!40000 ALTER TABLE `club` ENABLE KEYS */;

-- Dumping structure for table lfl.clubteam
CREATE TABLE IF NOT EXISTS `clubteam` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `clubId` int(10) unsigned NOT NULL DEFAULT 0,
  `teamId` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `clubId on clubteam` (`clubId`),
  KEY `teamId on clubteam` (`teamId`),
  CONSTRAINT `clubId on clubteam` FOREIGN KEY (`clubId`) REFERENCES `club` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `teamId on clubteam` FOREIGN KEY (`teamId`) REFERENCES `team` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.clubteam: ~0 rows (approximately)
DELETE FROM `clubteam`;
/*!40000 ALTER TABLE `clubteam` DISABLE KEYS */;
/*!40000 ALTER TABLE `clubteam` ENABLE KEYS */;

-- Dumping structure for table lfl.field
CREATE TABLE IF NOT EXISTS `field` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.field: ~0 rows (approximately)
DELETE FROM `field`;
/*!40000 ALTER TABLE `field` DISABLE KEYS */;
INSERT INTO `field` (`id`, `created`, `updated`, `name`, `description`) VALUES
	(1, '2022-02-07 09:17:39', '2022-02-07 09:17:39', 'Main', 'The Main Field in the center of the building');
/*!40000 ALTER TABLE `field` ENABLE KEYS */;

-- Dumping structure for table lfl.invitefriends
CREATE TABLE IF NOT EXISTS `invitefriends` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `userId` int(15) unsigned NOT NULL,
  `phone` bigint(20) NOT NULL DEFAULT 0,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Pending','Help','Sent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  KEY `userId on friendreferral` (`userId`),
  CONSTRAINT `userId on friendreferral` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.invitefriends: ~0 rows (approximately)
DELETE FROM `invitefriends`;
/*!40000 ALTER TABLE `invitefriends` DISABLE KEYS */;
/*!40000 ALTER TABLE `invitefriends` ENABLE KEYS */;

-- Dumping structure for table lfl.league
CREATE TABLE IF NOT EXISTS `league` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `leagueCategoryId` int(10) unsigned NOT NULL,
  `leagueName` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dayOfWeek` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `maxTeams` int(10) unsigned DEFAULT NULL,
  `minTeams` int(10) unsigned DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leagueCategoryId on league` (`leagueCategoryId`),
  CONSTRAINT `leagueCategoryId on league` FOREIGN KEY (`leagueCategoryId`) REFERENCES `leaguecategory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.league: ~7 rows (approximately)
DELETE FROM `league`;
/*!40000 ALTER TABLE `league` DISABLE KEYS */;
INSERT INTO `league` (`id`, `created`, `updated`, `leagueCategoryId`, `leagueName`, `description`, `dayOfWeek`, `order`, `maxTeams`, `minTeams`, `price`) VALUES
	(1, '2022-02-05 13:46:04', '2022-02-05 13:46:04', 1, 'Premiere', 'The Priemere League is the highest league.', 'Monday', 1, NULL, NULL, 65),
	(2, '2022-02-05 13:46:46', '2022-02-05 13:46:46', 1, 'Championship', 'THe championship league is the second highest league.', 'Tuesday', 2, NULL, NULL, 65),
	(3, '2022-02-05 13:47:31', '2022-02-05 13:47:31', 1, 'League 1', 'League 1 is the third highest league.', 'Wednesday', 3, NULL, NULL, 65),
	(4, '2022-02-05 13:48:06', '2022-02-05 13:48:06', 2, 'Priemere', 'The Priemere League is the highest league.', 'Thursday', 1, NULL, NULL, 65),
	(5, '2022-02-05 13:48:41', '2022-02-05 13:48:41', 2, 'Championship', 'THe championship league is the second highest league.', 'Friday', 2, NULL, NULL, 65),
	(6, '2022-02-05 13:49:17', '2022-02-05 13:49:17', 3, 'Premiere', 'The Priemere League is the highest league.', 'Monday', 1, NULL, NULL, 65),
	(7, '2022-02-05 13:49:17', '2022-02-05 13:49:17', 3, 'Championship', 'THe championship league is the second highest league.', 'Tuesday', 2, NULL, NULL, 65);
/*!40000 ALTER TABLE `league` ENABLE KEYS */;

-- Dumping structure for table lfl.leaguecategory
CREATE TABLE IF NOT EXISTS `leaguecategory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ageFrom` int(10) unsigned NOT NULL,
  `ageTo` int(10) unsigned NOT NULL,
  `maxLeagues` int(10) unsigned NOT NULL,
  `minLeagues` int(10) unsigned NOT NULL,
  `sex` enum('Male','Female','Coed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Coed',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.leaguecategory: ~3 rows (approximately)
DELETE FROM `leaguecategory`;
/*!40000 ALTER TABLE `leaguecategory` DISABLE KEYS */;
INSERT INTO `leaguecategory` (`id`, `created`, `updated`, `name`, `description`, `ageFrom`, `ageTo`, `maxLeagues`, `minLeagues`, `sex`) VALUES
	(1, '2022-02-05 13:42:27', '2022-02-05 13:42:27', 'Men\'s', 'Lubbock Futsal Men\'s League', 18, 99, 0, 0, 'Male'),
	(2, '2022-02-05 13:43:20', '2022-02-05 13:43:20', 'Co-ed', 'Lubbock Futsal Co-ed League', 18, 99, 0, 0, 'Coed'),
	(3, '2022-02-05 13:44:17', '2022-02-05 13:44:17', 'Women\'s', 'Lubbock Futsal Women\'s League', 18, 99, 0, 0, 'Female');
/*!40000 ALTER TABLE `leaguecategory` ENABLE KEYS */;

-- Dumping structure for table lfl.leaguemember
CREATE TABLE IF NOT EXISTS `leaguemember` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `userId` int(10) unsigned NOT NULL DEFAULT 0,
  `leagueSeasonId` int(10) unsigned NOT NULL DEFAULT 0,
  `status` enum('Pending','Help','Complete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `hasTeam` enum('No','Yes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `price` float(7,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `userId on leaguemember` (`userId`),
  KEY `leagueSeasonId on leaguemember` (`leagueSeasonId`) USING BTREE,
  CONSTRAINT `leagueSeasonId on leaguemember` FOREIGN KEY (`leagueSeasonId`) REFERENCES `leagueseason` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userId on leaguemember` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.leaguemember: ~0 rows (approximately)
DELETE FROM `leaguemember`;
/*!40000 ALTER TABLE `leaguemember` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaguemember` ENABLE KEYS */;

-- Dumping structure for table lfl.leagueseason
CREATE TABLE IF NOT EXISTS `leagueseason` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `leagueId` int(10) unsigned NOT NULL DEFAULT 0,
  `seasonId` int(10) unsigned NOT NULL DEFAULT 0,
  `leagueCategoryId` int(11) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `leagueId on leagueseason` (`leagueId`),
  KEY `seasonId on leagueseason` (`seasonId`),
  KEY `leagueCategoryId` (`leagueCategoryId`),
  CONSTRAINT `leagueCategoryId` FOREIGN KEY (`leagueCategoryId`) REFERENCES `leaguecategory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `leagueId on leagueseason` FOREIGN KEY (`leagueId`) REFERENCES `league` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `seasonId on leagueseason` FOREIGN KEY (`seasonId`) REFERENCES `season` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.leagueseason: ~14 rows (approximately)
DELETE FROM `leagueseason`;
/*!40000 ALTER TABLE `leagueseason` DISABLE KEYS */;
INSERT INTO `leagueseason` (`id`, `created`, `updated`, `leagueId`, `seasonId`, `leagueCategoryId`) VALUES
	(1, '2022-02-07 13:42:46', '2022-02-07 13:42:46', 1, 1, 1),
	(2, '2022-02-07 13:42:56', '2022-02-07 13:42:56', 2, 1, 1),
	(3, '2022-02-07 13:43:03', '2022-02-07 13:43:03', 3, 1, 1),
	(4, '2022-02-07 13:43:10', '2022-02-07 13:43:10', 4, 1, 2),
	(6, '2022-02-07 13:43:19', '2022-02-07 13:43:19', 5, 1, 2),
	(7, '2022-02-07 13:43:25', '2022-02-07 13:43:25', 6, 1, 3),
	(8, '2022-02-07 13:43:32', '2022-02-07 13:43:32', 7, 1, 3),
	(9, '2022-02-17 12:00:01', '2022-02-17 12:00:01', 2, 2, 1),
	(10, '2022-02-17 12:00:09', '2022-02-17 12:00:09', 3, 2, 1),
	(11, '2022-02-17 12:00:18', '2022-02-17 12:00:18', 4, 2, 2),
	(12, '2022-02-17 12:00:24', '2022-02-17 12:00:24', 5, 2, 2),
	(13, '2022-02-17 12:00:31', '2022-02-17 12:00:31', 6, 2, 3),
	(14, '2022-02-17 12:00:39', '2022-02-17 12:00:39', 7, 2, 3),
	(15, '2022-02-17 13:37:10', '2022-02-17 13:37:10', 1, 2, 1);
/*!40000 ALTER TABLE `leagueseason` ENABLE KEYS */;

-- Dumping structure for table lfl.leagueteam
CREATE TABLE IF NOT EXISTS `leagueteam` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `teamId` int(10) unsigned NOT NULL DEFAULT 0,
  `leagueId` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `leagueId on leagueteam` (`leagueId`),
  KEY `teamId on leagueteam` (`teamId`),
  CONSTRAINT `leagueId on leagueteam` FOREIGN KEY (`leagueId`) REFERENCES `league` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `teamId on leagueteam` FOREIGN KEY (`teamId`) REFERENCES `team` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.leagueteam: ~0 rows (approximately)
DELETE FROM `leagueteam`;
/*!40000 ALTER TABLE `leagueteam` DISABLE KEYS */;
/*!40000 ALTER TABLE `leagueteam` ENABLE KEYS */;

-- Dumping structure for table lfl.match
CREATE TABLE IF NOT EXISTS `match` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `timeSlotId` int(10) unsigned NOT NULL DEFAULT 0,
  `fieldId` int(10) unsigned NOT NULL DEFAULT 0,
  `homeTeamSeasonId` int(10) unsigned NOT NULL DEFAULT 0,
  `awayTeamSeasonId` int(10) unsigned NOT NULL DEFAULT 0,
  `refereeId` int(10) unsigned NOT NULL DEFAULT 0,
  `homeGoals` int(10) unsigned NOT NULL DEFAULT 0,
  `awayGoals` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fieldId on match` (`fieldId`),
  KEY `refereeId on match` (`refereeId`),
  KEY `timeSlotId on match` (`timeSlotId`),
  KEY `awayTeamSeasonId on match` (`awayTeamSeasonId`) USING BTREE,
  KEY `homeTeamSeasonId on match` (`homeTeamSeasonId`) USING BTREE,
  CONSTRAINT `awayTeamSeasonId on match` FOREIGN KEY (`awayTeamSeasonId`) REFERENCES `teamseason` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fieldId on match` FOREIGN KEY (`fieldId`) REFERENCES `field` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `homeTeamSeasonId on match` FOREIGN KEY (`homeTeamSeasonId`) REFERENCES `teamseason` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `refereeId on match` FOREIGN KEY (`refereeId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `timeSlotId on match` FOREIGN KEY (`timeSlotId`) REFERENCES `timeslot` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.match: ~0 rows (approximately)
DELETE FROM `match`;
/*!40000 ALTER TABLE `match` DISABLE KEYS */;
/*!40000 ALTER TABLE `match` ENABLE KEYS */;

-- Dumping structure for table lfl.matchfoul
CREATE TABLE IF NOT EXISTS `matchfoul` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `matchId` int(10) unsigned NOT NULL DEFAULT 0,
  `userId` int(10) unsigned NOT NULL DEFAULT 0,
  `type` enum('Yellow','Red') COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `matchId on matchgoal` (`matchId`),
  KEY `userId on matchgoal` (`userId`),
  CONSTRAINT `matchfoul_ibfk_1` FOREIGN KEY (`matchId`) REFERENCES `match` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `matchfoul_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.matchfoul: ~0 rows (approximately)
DELETE FROM `matchfoul`;
/*!40000 ALTER TABLE `matchfoul` DISABLE KEYS */;
/*!40000 ALTER TABLE `matchfoul` ENABLE KEYS */;

-- Dumping structure for table lfl.matchgoal
CREATE TABLE IF NOT EXISTS `matchgoal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `matchId` int(10) unsigned NOT NULL DEFAULT 0,
  `userId` int(10) unsigned NOT NULL DEFAULT 0,
  `teamSeasonId` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `matchId on matchgoal` (`matchId`),
  KEY `userId on matchgoal` (`userId`),
  KEY `teamSeasonId on matchgoal` (`teamSeasonId`) USING BTREE,
  CONSTRAINT `matchId on matchgoal` FOREIGN KEY (`matchId`) REFERENCES `match` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `teamSeasonId on matchgoal` FOREIGN KEY (`teamSeasonId`) REFERENCES `teamseason` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userId on matchgoal` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.matchgoal: ~0 rows (approximately)
DELETE FROM `matchgoal`;
/*!40000 ALTER TABLE `matchgoal` DISABLE KEYS */;
/*!40000 ALTER TABLE `matchgoal` ENABLE KEYS */;

-- Dumping structure for table lfl.offdays
CREATE TABLE IF NOT EXISTS `offdays` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.offdays: ~0 rows (approximately)
DELETE FROM `offdays`;
/*!40000 ALTER TABLE `offdays` DISABLE KEYS */;
/*!40000 ALTER TABLE `offdays` ENABLE KEYS */;

-- Dumping structure for table lfl.playercard
CREATE TABLE IF NOT EXISTS `playercard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `userId` int(10) unsigned NOT NULL,
  `image` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Pending','Ready','Complete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  KEY `userId on playercard` (`userId`),
  CONSTRAINT `userId on playercard` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.playercard: ~0 rows (approximately)
DELETE FROM `playercard`;
/*!40000 ALTER TABLE `playercard` DISABLE KEYS */;
/*!40000 ALTER TABLE `playercard` ENABLE KEYS */;

-- Dumping structure for table lfl.refereeattendance
CREATE TABLE IF NOT EXISTS `refereeattendance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `matchId` int(10) unsigned NOT NULL DEFAULT 0,
  `userId` int(10) unsigned NOT NULL DEFAULT 0,
  `teamSeasonId` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `matchId on matchgoal` (`matchId`),
  KEY `userId on matchgoal` (`userId`),
  KEY `teamSeasonId on refereeattendance` (`teamSeasonId`) USING BTREE,
  CONSTRAINT `refereeattendance_ibfk_1` FOREIGN KEY (`matchId`) REFERENCES `match` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `refereeattendance_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `teamSeasonId on refereeattendance` FOREIGN KEY (`teamSeasonId`) REFERENCES `teamseason` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.refereeattendance: ~0 rows (approximately)
DELETE FROM `refereeattendance`;
/*!40000 ALTER TABLE `refereeattendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `refereeattendance` ENABLE KEYS */;

-- Dumping structure for table lfl.refereeinfo
CREATE TABLE IF NOT EXISTS `refereeinfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `userId` int(10) unsigned NOT NULL DEFAULT 0,
  `legalFullName` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `streetAddress` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `suiteNumber` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ssn` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId on refereeinfo` (`userId`),
  CONSTRAINT `userId on refereeinfo` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.refereeinfo: ~0 rows (approximately)
DELETE FROM `refereeinfo`;
/*!40000 ALTER TABLE `refereeinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `refereeinfo` ENABLE KEYS */;

-- Dumping structure for table lfl.refereepay
CREATE TABLE IF NOT EXISTS `refereepay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `userId` int(10) unsigned NOT NULL DEFAULT 0,
  `matchId` int(10) unsigned NOT NULL DEFAULT 0,
  `payAmount` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `matchId on refereepay` (`matchId`),
  KEY `userId on refereepay` (`userId`),
  CONSTRAINT `matchId on refereepay` FOREIGN KEY (`matchId`) REFERENCES `match` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userId on refereepay` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.refereepay: ~0 rows (approximately)
DELETE FROM `refereepay`;
/*!40000 ALTER TABLE `refereepay` DISABLE KEYS */;
/*!40000 ALTER TABLE `refereepay` ENABLE KEYS */;

-- Dumping structure for table lfl.refereesurvey
CREATE TABLE IF NOT EXISTS `refereesurvey` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `userId` int(10) unsigned NOT NULL DEFAULT 0,
  `matchId` int(10) unsigned NOT NULL DEFAULT 0,
  `gameFlow` int(10) unsigned NOT NULL DEFAULT 5,
  `clearCalls` int(10) unsigned NOT NULL DEFAULT 5,
  `aggressivePlayers` int(10) unsigned NOT NULL DEFAULT 5,
  `attitude` int(10) unsigned NOT NULL DEFAULT 5,
  PRIMARY KEY (`id`),
  KEY `matchId on refereepay` (`matchId`),
  KEY `userId on refereepay` (`userId`),
  CONSTRAINT `refereesurvey_ibfk_1` FOREIGN KEY (`matchId`) REFERENCES `match` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `refereesurvey_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.refereesurvey: ~0 rows (approximately)
DELETE FROM `refereesurvey`;
/*!40000 ALTER TABLE `refereesurvey` DISABLE KEYS */;
/*!40000 ALTER TABLE `refereesurvey` ENABLE KEYS */;

-- Dumping structure for table lfl.season
CREATE TABLE IF NOT EXISTS `season` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `lastRegisterDate` date NOT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numberOfGames` int(11) unsigned NOT NULL DEFAULT 8,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.season: ~2 rows (approximately)
DELETE FROM `season`;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
INSERT INTO `season` (`id`, `created`, `updated`, `startDate`, `endDate`, `lastRegisterDate`, `name`, `numberOfGames`) VALUES
	(1, '2022-02-07 09:25:39', '2022-02-07 09:25:39', '2022-09-01', '2022-10-31', '2022-02-01', 'Fall', 8),
	(2, '2022-02-07 15:26:54', '2022-02-07 15:26:54', '2022-11-01', '2022-12-31', '2022-11-01', 'Winter', 8);
/*!40000 ALTER TABLE `season` ENABLE KEYS */;

-- Dumping structure for table lfl.shirt
CREATE TABLE IF NOT EXISTS `shirt` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `size` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint(4) NOT NULL,
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` enum('Male','Femail','Unisex') COLLATE utf8mb4_unicode_ci DEFAULT 'Unisex',
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.shirt: ~0 rows (approximately)
DELETE FROM `shirt`;
/*!40000 ALTER TABLE `shirt` DISABLE KEYS */;
/*!40000 ALTER TABLE `shirt` ENABLE KEYS */;

-- Dumping structure for table lfl.shirtorder
CREATE TABLE IF NOT EXISTS `shirtorder` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `userId` int(10) unsigned NOT NULL,
  `shirtId` int(10) unsigned NOT NULL,
  `notes` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Pending','Ready','Complete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  KEY `shirtId on shirtOrder` (`shirtId`),
  KEY `userId on shirtOrder` (`userId`),
  CONSTRAINT `shirtId on shirtOrder` FOREIGN KEY (`shirtId`) REFERENCES `shirt` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userId on shirtOrder` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.shirtorder: ~0 rows (approximately)
DELETE FROM `shirtorder`;
/*!40000 ALTER TABLE `shirtorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `shirtorder` ENABLE KEYS */;

-- Dumping structure for table lfl.sysvar
CREATE TABLE IF NOT EXISTS `sysvar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.sysvar: ~0 rows (approximately)
DELETE FROM `sysvar`;
/*!40000 ALTER TABLE `sysvar` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysvar` ENABLE KEYS */;

-- Dumping structure for table lfl.team
CREATE TABLE IF NOT EXISTS `team` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `maxTeamMembers` int(11) DEFAULT 0,
  `minTeamMembers` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.team: ~0 rows (approximately)
DELETE FROM `team`;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;

-- Dumping structure for table lfl.teammember
CREATE TABLE IF NOT EXISTS `teammember` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `userId` int(10) unsigned NOT NULL DEFAULT 0,
  `teamSeasonId` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `userId on teammember` (`userId`),
  KEY `teamSeasonId on teammember` (`teamSeasonId`) USING BTREE,
  CONSTRAINT `teamSeasonId on teammember` FOREIGN KEY (`teamSeasonId`) REFERENCES `teamseason` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userId on teammember` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.teammember: ~0 rows (approximately)
DELETE FROM `teammember`;
/*!40000 ALTER TABLE `teammember` DISABLE KEYS */;
/*!40000 ALTER TABLE `teammember` ENABLE KEYS */;

-- Dumping structure for table lfl.teamseason
CREATE TABLE IF NOT EXISTS `teamseason` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `teamId` int(10) unsigned NOT NULL DEFAULT 0,
  `seasonId` int(10) unsigned NOT NULL DEFAULT 0,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `teamId on teamseason` (`teamId`),
  KEY `seasonId on teamseason` (`seasonId`),
  CONSTRAINT `seasonId on teamseason` FOREIGN KEY (`seasonId`) REFERENCES `season` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `teamId on teamseason` FOREIGN KEY (`teamId`) REFERENCES `team` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table lfl.teamseason: ~0 rows (approximately)
DELETE FROM `teamseason`;
/*!40000 ALTER TABLE `teamseason` DISABLE KEYS */;
/*!40000 ALTER TABLE `teamseason` ENABLE KEYS */;

-- Dumping structure for table lfl.temp
CREATE TABLE IF NOT EXISTS `temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table lfl.temp: ~0 rows (approximately)
DELETE FROM `temp`;
/*!40000 ALTER TABLE `temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp` ENABLE KEYS */;

-- Dumping structure for table lfl.timeslot
CREATE TABLE IF NOT EXISTS `timeslot` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `dayOfWeek` int(11) NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.timeslot: ~0 rows (approximately)
DELETE FROM `timeslot`;
/*!40000 ALTER TABLE `timeslot` DISABLE KEYS */;
/*!40000 ALTER TABLE `timeslot` ENABLE KEYS */;

-- Dumping structure for table lfl.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint(20) unsigned NOT NULL DEFAULT 0,
  `shirtSize` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` enum('Male','Female') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Male',
  `keeper` tinyint(1) NOT NULL DEFAULT 0,
  `terms` tinyint(1) NOT NULL DEFAULT 0,
  `referee` tinyint(1) NOT NULL DEFAULT 0,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl.user: ~2 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `created`, `updated`, `email`, `token`, `password`, `firstName`, `lastName`, `dob`, `phone`, `shirtSize`, `sex`, `keeper`, `terms`, `referee`, `admin`) VALUES
	(25, '2022-02-17 22:25:03', '2022-02-17 22:25:03', 'zaynemayfield@gmail.com', 'a65aaf38fa7dc36d8aa05f317e7fcd37', '$2b$12$X6hnjsgkfL.lzCPCWu7b.OA6Q8n0EdL99cbh//4V7tRX4MguI1Ul6', 'Zayne', 'Mayfield', '1987-03-02', 5033585124, 'L', 'Male', 0, 1, 0, 0),
	(26, '2022-02-17 23:03:51', '2022-02-17 23:03:51', 'aynemayfield@gmail.com', '0f89fee608409cb797636e92a80e7fa9', '$2b$12$wApoR.lgQ3cW3J.lbZxtiuCQCk08oSs6lIVisZfrsG8n1ujMrB45K', 'Zayne', 'Mayfield', '1987-03-02', 5033585124, 'L', 'Female', 1, 1, 0, 0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for table lfl.waitlist
CREATE TABLE IF NOT EXISTS `waitlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `userId` int(10) unsigned NOT NULL DEFAULT 0,
  `status` enum('Pending','Removed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userId on waitlist` (`userId`),
  CONSTRAINT `userId on waitlist` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table lfl.waitlist: ~0 rows (approximately)
DELETE FROM `waitlist`;
/*!40000 ALTER TABLE `waitlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `waitlist` ENABLE KEYS */;

-- Dumping structure for table lfl._prisma_migrations
CREATE TABLE IF NOT EXISTS `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lfl._prisma_migrations: ~0 rows (approximately)
DELETE FROM `_prisma_migrations`;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
	('64244b0f-d370-44d6-a7ca-424da6c0234d', '54f5db3ede92ec779854e1c493edecb582f2cc4e64028513235cfc09e42294d4', '2022-02-04 16:10:51.468', '20220204161050_init', NULL, NULL, '2022-02-04 16:10:50.680', 1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
