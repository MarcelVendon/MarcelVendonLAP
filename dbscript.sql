-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema rentabike
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `rentabike` ;

-- -----------------------------------------------------
-- Schema rentabike
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rentabike` DEFAULT CHARACTER SET utf8 ;
USE `rentabike` ;

-- -----------------------------------------------------
-- Table `rentabike`.`bike`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentabike`.`bike` ;

CREATE TABLE IF NOT EXISTS `rentabike`.`bike` (
  `bikeId` INT NOT NULL AUTO_INCREMENT,
  `bikeName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`bikeId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentabike`.`person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentabike`.`person` ;

CREATE TABLE IF NOT EXISTS `rentabike`.`person` (
  `personId` INT NOT NULL AUTO_INCREMENT,
  `personFirstName` VARCHAR(45) NOT NULL,
  `personLastName` VARCHAR(45) NOT NULL,
  `personEmail` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`personId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentabike`.`rentedbikes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentabike`.`rentedbikes` ;

CREATE TABLE IF NOT EXISTS `rentabike`.`rentedbikes` (
  `rentedbikesId` INT NOT NULL AUTO_INCREMENT,
  `bikeId` INT NOT NULL,
  `personId` INT NOT NULL,
  `rentedUntil` DATETIME NOT NULL,
  `rentedFrom` DATETIME NOT NULL,
  PRIMARY KEY (`rentedbikesId`),
  INDEX `fk_rentedbikes_bike_idx` (`bikeId` ASC) ,
  INDEX `fk_rentedbikes_person1_idx` (`personId` ASC) ,
  CONSTRAINT `fk_rentedbikes_bike`
    FOREIGN KEY (`bikeId`)
    REFERENCES `rentabike`.`bike` (`bikeId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_rentedbikes_person1`
    FOREIGN KEY (`personId`)
    REFERENCES `rentabike`.`person` (`personId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `rentabike`.`bike`
-- -----------------------------------------------------
START TRANSACTION;
USE `rentabike`;
INSERT INTO `rentabike`.`bike` (`bikeId`, `bikeName`) VALUES (DEFAULT, 'Freddy');
INSERT INTO `rentabike`.`bike` (`bikeId`, `bikeName`) VALUES (DEFAULT, 'Tom Turbo');
INSERT INTO `rentabike`.`bike` (`bikeId`, `bikeName`) VALUES (DEFAULT, 'Guapo');

COMMIT;


-- -----------------------------------------------------
-- Data for table `rentabike`.`person`
-- -----------------------------------------------------
START TRANSACTION;
USE `rentabike`;
INSERT INTO `rentabike`.`person` (`personId`, `personFirstName`, `personLastName`, `personEmail`) VALUES (DEFAULT, 'Bert', 'Huber', 'berthuber@mail.at');
INSERT INTO `rentabike`.`person` (`personId`, `personFirstName`, `personLastName`, `personEmail`) VALUES (DEFAULT, 'Emilia', 'Erhart', 'emihart@wub.de');
INSERT INTO `rentabike`.`person` (`personId`, `personFirstName`, `personLastName`, `personEmail`) VALUES (DEFAULT, 'Siegfried', 'Lukocevic', 'siggicevic@mail.de');
INSERT INTO `rentabike`.`person` (`personId`, `personFirstName`, `personLastName`, `personEmail`) VALUES (DEFAULT, 'Mai', 'Nguyen', 'may.nguyen@mail.at');

COMMIT;


-- -----------------------------------------------------
-- Data for table `rentabike`.`rentedbikes`
-- -----------------------------------------------------
START TRANSACTION;
USE `rentabike`;
INSERT INTO `rentabike`.`rentedbikes` (`rentedbikesId`, `bikeId`, `personId`, `rentedUntil`, `rentedFrom`) VALUES (DEFAULT, 1, 1, '2020-06-06 12:00:00', '2020-06-05 12:00:00');
INSERT INTO `rentabike`.`rentedbikes` (`rentedbikesId`, `bikeId`, `personId`, `rentedUntil`, `rentedFrom`) VALUES (DEFAULT, 2, 3, '2020-06-07 12:00:00', '2020-06-05 12:00:00');
INSERT INTO `rentabike`.`rentedbikes` (`rentedbikesId`, `bikeId`, `personId`, `rentedUntil`, `rentedFrom`) VALUES (DEFAULT, 3, 4, '2020-06-08 12:00:00', '2020-06-05 12:00:00');
INSERT INTO `rentabike`.`rentedbikes` (`rentedbikesId`, `bikeId`, `personId`, `rentedUntil`, `rentedFrom`) VALUES (DEFAULT, 1, 2, '2020-06-04 12:00:00', '2020-06-03 12:00:00');

COMMIT;


