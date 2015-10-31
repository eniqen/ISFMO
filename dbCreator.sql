-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mobile_office
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mobile_office
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mobile_office`
  DEFAULT CHARACTER SET utf8
  COLLATE utf8_general_ci;
USE `mobile_office`;

-- -----------------------------------------------------
-- Table `mobile_office`.`CLIENT_TBL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_office`.`CLIENT_TBL` (
  `ID`        INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `FIRSTNAME` VARCHAR(50)  NOT NULL,
  `LASTNAME`  VARCHAR(50)  NOT NULL,
  `BIRTHDAY`  DATE         NOT NULL,
  `PASSPORT`  BIGINT(10)   NOT NULL,
  `ADDRESS`   VARCHAR(100) NOT NULL,
  `EMAIL`     VARCHAR(64)  NOT NULL,
  `PASSWORD`  VARCHAR(20)  NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC)
)
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_office`.`TARIFF_TBL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_office`.`TARIFF_TBL` (
  `ID`    INT UNSIGNED   NOT NULL AUTO_INCREMENT,
  `TITLE` VARCHAR(100)   NOT NULL,
  `PRICE` DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC)
)
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_office`.`CONTRACT_TBL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_office`.`CONTRACT_TBL` (
  `ID`            INT UNSIGNED        NOT NULL AUTO_INCREMENT
  COMMENT '',
  `NUMBER`        BIGINT(11) UNSIGNED NOT NULL,
  `CLIENT_TBL_ID` INT UNSIGNED        NOT NULL,
  UNIQUE INDEX `NUMBER_UNIQUE` (`NUMBER` ASC),
  PRIMARY KEY (`ID`, `CLIENT_TBL_ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC),
  INDEX `fk_CONTRACT_TBL_CLIENT_TBL1_idx` (`CLIENT_TBL_ID` ASC),
  CONSTRAINT `fk_CONTRACT_TBL_CLIENT_TBL1`
  FOREIGN KEY (`CLIENT_TBL_ID`)
  REFERENCES `mobile_office`.`CLIENT_TBL` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_office`.`OPTION_TBL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_office`.`OPTION_TBL` (
  `ID`               INT UNSIGNED   NOT NULL AUTO_INCREMENT,
  `TITLE`            VARCHAR(100)   NOT NULL,
  `PRICE`            DECIMAL(10, 2) NOT NULL,
  `CONNECTION_PRICE` DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC)
)
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_office`.`TARIFF_TBL_has_OPTION_TBL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_office`.`TARIFF_TBL_has_OPTION_TBL` (
  `TARIFF_TBL_ID` INT UNSIGNED NOT NULL,
  `OPTION_TBL_ID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`TARIFF_TBL_ID`, `OPTION_TBL_ID`),
  INDEX `fk_TARIFF_TBL_has_OPTION_TBL_OPTION_TBL1_idx` (`OPTION_TBL_ID` ASC),
  INDEX `fk_TARIFF_TBL_has_OPTION_TBL_TARIFF_TBL_idx` (`TARIFF_TBL_ID` ASC),
  CONSTRAINT `fk_TARIFF_TBL_has_OPTION_TBL_TARIFF_TBL`
  FOREIGN KEY (`TARIFF_TBL_ID`)
  REFERENCES `mobile_office`.`TARIFF_TBL` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TARIFF_TBL_has_OPTION_TBL_OPTION_TBL1`
  FOREIGN KEY (`OPTION_TBL_ID`)
  REFERENCES `mobile_office`.`OPTION_TBL` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_office`.`CONTRACT_TBL_has_OPTION_TBL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_office`.`CONTRACT_TBL_has_OPTION_TBL` (
  `CONTRACT_TBL_ID` INT UNSIGNED NOT NULL
  COMMENT '',
  `OPTION_TBL_ID`   INT UNSIGNED NOT NULL,
  PRIMARY KEY (`CONTRACT_TBL_ID`, `OPTION_TBL_ID`),
  INDEX `fk_CONTRACT_TBL_has_OPTION_TBL_OPTION_TBL1_idx` (`OPTION_TBL_ID` ASC),
  INDEX `fk_CONTRACT_TBL_has_OPTION_TBL_CONTRACT_TBL1_idx` (`CONTRACT_TBL_ID` ASC),
  CONSTRAINT `fk_CONTRACT_TBL_has_OPTION_TBL_CONTRACT_TBL1`
  FOREIGN KEY (`CONTRACT_TBL_ID`)
  REFERENCES `mobile_office`.`CONTRACT_TBL` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONTRACT_TBL_has_OPTION_TBL_OPTION_TBL1`
  FOREIGN KEY (`OPTION_TBL_ID`)
  REFERENCES `mobile_office`.`OPTION_TBL` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_office`.`COMPATIBLE_OPTIONS_TBL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_office`.`COMPATIBLE_OPTIONS_TBL` (
  `OPTION_TBL_ID`  INT UNSIGNED NOT NULL,
  `OPTION_TBL_ID1` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`OPTION_TBL_ID`, `OPTION_TBL_ID1`),
  INDEX `fk_table1_OPTION_TBL2_idx` (`OPTION_TBL_ID1` ASC),
  CONSTRAINT `fk_table1_OPTION_TBL1`
  FOREIGN KEY (`OPTION_TBL_ID`)
  REFERENCES `mobile_office`.`OPTION_TBL` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_OPTION_TBL2`
  FOREIGN KEY (`OPTION_TBL_ID1`)
  REFERENCES `mobile_office`.`OPTION_TBL` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_office`.`INCOMPATIBLE_OPTIONS_TBL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_office`.`INCOMPATIBLE_OPTIONS_TBL` (
  `OPTION_TBL_ID`  INT UNSIGNED NOT NULL,
  `OPTION_TBL_ID1` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`OPTION_TBL_ID`, `OPTION_TBL_ID1`),
  INDEX `fk_table2_OPTION_TBL2_idx` (`OPTION_TBL_ID1` ASC),
  CONSTRAINT `fk_table2_OPTION_TBL1`
  FOREIGN KEY (`OPTION_TBL_ID`)
  REFERENCES `mobile_office`.`OPTION_TBL` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table2_OPTION_TBL2`
  FOREIGN KEY (`OPTION_TBL_ID1`)
  REFERENCES `mobile_office`.`OPTION_TBL` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB;


SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;
