-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema hanssonsjjsocial
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hanssonsjjsocial
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hanssonsjjsocial` DEFAULT CHARACTER SET utf8 ;
USE `hanssonsjjsocial` ;

-- -----------------------------------------------------
-- Table `hanssonsjjsocial`.`hifi_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hanssonsjjsocial`.`hifi_category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `categoryName` VARCHAR(28) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `categoryName_UNIQUE` (`categoryName` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hanssonsjjsocial`.`hifi_pictures`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hanssonsjjsocial`.`hifi_pictures` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `filename` VARCHAR(256) NOT NULL,
  `dateAdded` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hanssonsjjsocial`.`hifi_manufacturers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hanssonsjjsocial`.`hifi_manufacturers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `manufactureName` VARCHAR(48) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`manufactureName` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hanssonsjjsocial`.`hifi_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hanssonsjjsocial`.`hifi_products` (
  `pid` INT NOT NULL AUTO_INCREMENT,
  `title` INT NOT NULL,
  `productDetails` TEXT NOT NULL,
  `price` DECIMAL(8,2) NOT NULL,
  `manufacturerId` INT NOT NULL,
  `dateAdded` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `productPicture` INT NOT NULL DEFAULT 1,
  `categoryId` INT NOT NULL,
  PRIMARY KEY (`pid`),
  INDEX `fk_category_idx` (`categoryId` ASC),
  INDEX `fk_productPicture_idx` (`productPicture` ASC),
  INDEX `fk_manufactor_idx` (`manufacturerId` ASC),
  CONSTRAINT `fk_category`
    FOREIGN KEY (`categoryId`)
    REFERENCES `hanssonsjjsocial`.`hifi_category` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productPicture`
    FOREIGN KEY (`productPicture`)
    REFERENCES `hanssonsjjsocial`.`hifi_pictures` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_manufactor`
    FOREIGN KEY (`manufacturerId`)
    REFERENCES `hanssonsjjsocial`.`hifi_manufacturers` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hanssonsjjsocial`.`hifi_contactMessages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hanssonsjjsocial`.`hifi_contactMessages` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fullname` VARCHAR(64) NOT NULL,
  `email` VARCHAR(192) NOT NULL,
  `subject` VARCHAR(64) NOT NULL,
  `message` TEXT NOT NULL,
  `submitDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hanssonsjjsocial`.`hifi_menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hanssonsjjsocial`.`hifi_menu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `menupath` VARCHAR(45) NULL,
  `isVisible` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hanssonsjjsocial`.`hifi_news`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hanssonsjjsocial`.`hifi_news` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `content` TEXT NOT NULL,
  `pictureId` INT NOT NULL,
  `dateAdded` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_pictureId_idx` (`pictureId` ASC),
  CONSTRAINT `fk_pictureId`
    FOREIGN KEY (`pictureId`)
    REFERENCES `hanssonsjjsocial`.`hifi_pictures` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
