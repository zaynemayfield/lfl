-- CreateTable
CREATE TABLE `attendance` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `matchId` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `userId` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `willAttend` BOOLEAN NOT NULL DEFAULT false,

    INDEX `matchId on matchgoal`(`matchId`),
    INDEX `userId on matchgoal`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `club` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `name` VARCHAR(256) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `clubteam` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `clubId` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `teamId` INTEGER UNSIGNED NOT NULL DEFAULT 0,

    INDEX `clubId on clubteam`(`clubId`),
    INDEX `teamId on clubteam`(`teamId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `field` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `name` VARCHAR(256) NOT NULL,
    `description` VARCHAR(2000) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `friendreferral` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `userId` INTEGER UNSIGNED NOT NULL,
    `friendPhone` VARCHAR(50) NULL,
    `friendEmail` VARCHAR(100) NULL,

    INDEX `userId on friendreferral`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `league` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `leagueCategoryId` INTEGER UNSIGNED NOT NULL,
    `leagueName` VARCHAR(256) NOT NULL,
    `description` VARCHAR(2000) NULL,
    `dayOfWeek` INTEGER UNSIGNED NULL,
    `order` INTEGER UNSIGNED NULL,
    `price` FLOAT NULL,

    INDEX `leagueCategoryId on league`(`leagueCategoryId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `leaguecategory` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `name` VARCHAR(256) NOT NULL,
    `description` VARCHAR(2000) NULL,
    `ageFrom` INTEGER UNSIGNED NOT NULL,
    `ageTo` INTEGER UNSIGNED NOT NULL,
    `sex` ENUM('Male', 'Female', 'Coed') NOT NULL DEFAULT 'Coed',

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `leaguemember` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `userId` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `leagueId` INTEGER UNSIGNED NOT NULL DEFAULT 0,

    INDEX `leagueId on leaguemember`(`leagueId`),
    INDEX `userId on leaguemember`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `leagueteam` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `teamId` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `leagueId` INTEGER UNSIGNED NOT NULL DEFAULT 0,

    INDEX `leagueId on leagueteam`(`leagueId`),
    INDEX `teamId on leagueteam`(`teamId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `match` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `timeSlotId` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `fieldId` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `homeTeamId` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `awayTeamId` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `refereeId` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `homeGoals` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `awayGoals` INTEGER UNSIGNED NOT NULL DEFAULT 0,

    INDEX `awayTeamId on match`(`awayTeamId`),
    INDEX `fieldId on match`(`fieldId`),
    INDEX `homeTeamId on match`(`homeTeamId`),
    INDEX `refereeId on match`(`refereeId`),
    INDEX `timeSlotId on match`(`timeSlotId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `matchfoul` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `matchId` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `userId` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `type` ENUM('Yellow', 'Red') NOT NULL,
    `note` VARCHAR(2000) NOT NULL,

    INDEX `matchId on matchgoal`(`matchId`),
    INDEX `userId on matchgoal`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `matchgoal` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `matchId` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `userId` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `teamId` INTEGER UNSIGNED NOT NULL DEFAULT 0,

    INDEX `matchId on matchgoal`(`matchId`),
    INDEX `teamId on matchgoal`(`teamId`),
    INDEX `userId on matchgoal`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `offdays` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `date` DATE NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `playercard` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `userId` INTEGER UNSIGNED NOT NULL,
    `image` VARCHAR(512) NOT NULL,
    `notes` VARCHAR(512) NOT NULL,
    `status` ENUM('Pending', 'Ready', 'Complete') NOT NULL DEFAULT 'Pending',

    INDEX `userId on playercard`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `refereeattendance` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `matchId` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `userId` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `teamId` INTEGER UNSIGNED NOT NULL DEFAULT 0,

    INDEX `matchId on matchgoal`(`matchId`),
    INDEX `teamId on refereeattendance`(`teamId`),
    INDEX `userId on matchgoal`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `refereeinfo` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `userId` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `legalFullName` VARCHAR(256) NOT NULL,
    `streetAddress` VARCHAR(256) NOT NULL,
    `suiteNumber` VARCHAR(256) NOT NULL,
    `city` VARCHAR(256) NOT NULL,
    `state` VARCHAR(256) NOT NULL,
    `zip` VARCHAR(256) NOT NULL,
    `ssn` VARCHAR(256) NOT NULL,

    INDEX `userId on refereeinfo`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `refereepay` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `userId` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `matchId` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `payAmount` FLOAT NOT NULL DEFAULT 0.00,

    INDEX `matchId on refereepay`(`matchId`),
    INDEX `userId on refereepay`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `refereesurvey` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `userId` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `matchId` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `gameFlow` INTEGER UNSIGNED NOT NULL DEFAULT 5,
    `clearCalls` INTEGER UNSIGNED NOT NULL DEFAULT 5,
    `aggressivePlayers` INTEGER UNSIGNED NOT NULL DEFAULT 5,
    `attitude` INTEGER UNSIGNED NOT NULL DEFAULT 5,

    INDEX `matchId on refereepay`(`matchId`),
    INDEX `userId on refereepay`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `season` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `startDate` DATE NOT NULL,
    `endDate` DATE NOT NULL,
    `name` VARCHAR(512) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `shirt` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `size` VARCHAR(256) NOT NULL,
    `order` TINYINT NOT NULL,
    `description` VARCHAR(2000) NULL,
    `sex` ENUM('Male', 'Femail', 'Unisex') NULL DEFAULT 'Unisex',
    `price` FLOAT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `shirtorder` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `userId` INTEGER UNSIGNED NOT NULL,
    `shirtId` INTEGER UNSIGNED NOT NULL,
    `notes` VARCHAR(256) NULL,
    `status` ENUM('Pending', 'Ready', 'Complete') NOT NULL DEFAULT 'Pending',

    INDEX `shirtId on shirtOrder`(`shirtId`),
    INDEX `userId on shirtOrder`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sysvar` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `name` VARCHAR(256) NOT NULL,
    `value` VARCHAR(256) NOT NULL,
    `description` VARCHAR(256) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `team` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `name` VARCHAR(256) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `teammember` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `userId` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `teamid` INTEGER UNSIGNED NOT NULL DEFAULT 0,

    INDEX `teamId on teammember`(`teamid`),
    INDEX `userId on teammember`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `template` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `timeslot` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `dayOfWeek` INTEGER NOT NULL,
    `startTime` TIME(0) NOT NULL,
    `endTime` TIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `created` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `firstName` VARCHAR(100) NOT NULL,
    `lastName` VARCHAR(100) NOT NULL,
    `dob` VARCHAR(100) NOT NULL,
    `phone` VARCHAR(100) NOT NULL,
    `shirtSize` INTEGER UNSIGNED NOT NULL,
    `sex` ENUM('M', 'F') NULL DEFAULT 'M',
    `keeper` TINYINT NOT NULL DEFAULT 0,
    `referee` TINYINT NOT NULL DEFAULT 0,
    `admin` TINYINT NOT NULL DEFAULT 0,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `attendance` ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`matchId`) REFERENCES `match`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `attendance` ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `clubteam` ADD CONSTRAINT `clubId on clubteam` FOREIGN KEY (`clubId`) REFERENCES `club`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `clubteam` ADD CONSTRAINT `teamId on clubteam` FOREIGN KEY (`teamId`) REFERENCES `team`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `friendreferral` ADD CONSTRAINT `userId on friendreferral` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `league` ADD CONSTRAINT `leagueCategoryId on league` FOREIGN KEY (`leagueCategoryId`) REFERENCES `leaguecategory`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `leaguemember` ADD CONSTRAINT `leagueId on leaguemember` FOREIGN KEY (`leagueId`) REFERENCES `league`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `leaguemember` ADD CONSTRAINT `userId on leaguemember` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `leagueteam` ADD CONSTRAINT `leagueId on leagueteam` FOREIGN KEY (`leagueId`) REFERENCES `league`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `leagueteam` ADD CONSTRAINT `teamId on leagueteam` FOREIGN KEY (`teamId`) REFERENCES `team`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `match` ADD CONSTRAINT `fieldId on match` FOREIGN KEY (`fieldId`) REFERENCES `field`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `match` ADD CONSTRAINT `awayTeamId on match` FOREIGN KEY (`awayTeamId`) REFERENCES `team`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `match` ADD CONSTRAINT `homeTeamId on match` FOREIGN KEY (`homeTeamId`) REFERENCES `team`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `match` ADD CONSTRAINT `timeSlotId on match` FOREIGN KEY (`timeSlotId`) REFERENCES `timeslot`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `match` ADD CONSTRAINT `refereeId on match` FOREIGN KEY (`refereeId`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `matchfoul` ADD CONSTRAINT `matchfoul_ibfk_1` FOREIGN KEY (`matchId`) REFERENCES `match`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `matchfoul` ADD CONSTRAINT `matchfoul_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `matchgoal` ADD CONSTRAINT `matchId on matchgoal` FOREIGN KEY (`matchId`) REFERENCES `match`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `matchgoal` ADD CONSTRAINT `teamId on matchgoal` FOREIGN KEY (`teamId`) REFERENCES `team`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `matchgoal` ADD CONSTRAINT `userId on matchgoal` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `playercard` ADD CONSTRAINT `userId on playercard` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `refereeattendance` ADD CONSTRAINT `refereeattendance_ibfk_1` FOREIGN KEY (`matchId`) REFERENCES `match`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `refereeattendance` ADD CONSTRAINT `teamId on refereeattendance` FOREIGN KEY (`teamId`) REFERENCES `team`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `refereeattendance` ADD CONSTRAINT `refereeattendance_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `refereeinfo` ADD CONSTRAINT `userId on refereeinfo` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `refereepay` ADD CONSTRAINT `matchId on refereepay` FOREIGN KEY (`matchId`) REFERENCES `match`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `refereepay` ADD CONSTRAINT `userId on refereepay` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `refereesurvey` ADD CONSTRAINT `refereesurvey_ibfk_1` FOREIGN KEY (`matchId`) REFERENCES `match`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `refereesurvey` ADD CONSTRAINT `refereesurvey_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `shirtorder` ADD CONSTRAINT `shirtId on shirtOrder` FOREIGN KEY (`shirtId`) REFERENCES `shirt`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `shirtorder` ADD CONSTRAINT `userId on shirtOrder` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `teammember` ADD CONSTRAINT `teamId on teammember` FOREIGN KEY (`teamid`) REFERENCES `team`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `teammember` ADD CONSTRAINT `userId on teammember` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
