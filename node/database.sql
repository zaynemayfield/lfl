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

-- Data exporting was unselected.

-- Dumping structure for table lfl.club
CREATE TABLE IF NOT EXISTS `club` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

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

-- Data exporting was unselected.

-- Dumping structure for table lfl.field
CREATE TABLE IF NOT EXISTS `field` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leagueCategoryId on league` (`leagueCategoryId`),
  CONSTRAINT `leagueCategoryId on league` FOREIGN KEY (`leagueCategoryId`) REFERENCES `leaguecategory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table lfl.leaguecategory
CREATE TABLE IF NOT EXISTS `leaguecategory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ageFrom` int(10) unsigned NOT NULL,
  `ageTo` int(10) unsigned NOT NULL,
  `sex` enum('Male','Female','Coed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Coed',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

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

-- Data exporting was unselected.

-- Dumping structure for table lfl.leagueseason
CREATE TABLE IF NOT EXISTS `leagueseason` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `leagueId` int(10) unsigned NOT NULL DEFAULT 0,
  `seasonId` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `leagueId on leagueseason` (`leagueId`),
  KEY `seasonId on leagueseason` (`seasonId`),
  CONSTRAINT `leagueId on leagueseason` FOREIGN KEY (`leagueId`) REFERENCES `league` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `seasonId on leagueseason` FOREIGN KEY (`seasonId`) REFERENCES `season` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

-- Dumping structure for table lfl.offdays
CREATE TABLE IF NOT EXISTS `offdays` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

-- Dumping structure for table lfl.team
CREATE TABLE IF NOT EXISTS `team` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

-- Dumping structure for table lfl.temp
CREATE TABLE IF NOT EXISTS `temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
