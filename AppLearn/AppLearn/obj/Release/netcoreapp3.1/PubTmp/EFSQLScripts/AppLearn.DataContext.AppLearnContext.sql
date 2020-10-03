CREATE TABLE IF NOT EXISTS `__EFMigrationsHistory` (
    `MigrationId` varchar(95) NOT NULL,
    `ProductVersion` varchar(32) NOT NULL,
    CONSTRAINT `PK___EFMigrationsHistory` PRIMARY KEY (`MigrationId`)
);


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20201003024648_init') THEN

    CREATE TABLE `institute` (
        `id` int NOT NULL AUTO_INCREMENT,
        `name` nvarchar(150) NOT NULL,
        CONSTRAINT `PK_institute` PRIMARY KEY (`id`)
    );

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20201003024648_init') THEN

    CREATE TABLE `role` (
        `id` int NOT NULL AUTO_INCREMENT,
        `name` nvarchar(150) NOT NULL,
        CONSTRAINT `PK_role` PRIMARY KEY (`id`)
    );

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20201003024648_init') THEN

    CREATE TABLE `user` (
        `id` int NOT NULL AUTO_INCREMENT,
        `name` nvarchar(150) NOT NULL,
        `email` nvarchar(150) NOT NULL,
        `phone` nvarchar(150) NOT NULL,
        `institute` nvarchar(150) NOT NULL,
        `institute_Id` int NOT NULL,
        `role_Id` int NOT NULL,
        CONSTRAINT `PK_user` PRIMARY KEY (`id`),
        CONSTRAINT `FK_user_institute_institute_Id` FOREIGN KEY (`institute_Id`) REFERENCES `institute` (`id`) ON DELETE RESTRICT,
        CONSTRAINT `FK_user_role_role_Id` FOREIGN KEY (`role_Id`) REFERENCES `role` (`id`) ON DELETE RESTRICT
    );

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20201003024648_init') THEN

    CREATE INDEX `IX_user_institute_Id` ON `user` (`institute_Id`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20201003024648_init') THEN

    CREATE INDEX `IX_user_role_Id` ON `user` (`role_Id`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20201003024648_init') THEN

    INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
    VALUES ('20201003024648_init', '3.1.8');

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

