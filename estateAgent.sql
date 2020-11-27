-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema emlakDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema emlakDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `emlakDB` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `emlakDB` ;

-- -----------------------------------------------------
-- Table `emlakDB`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `emlakDB`.`Admin` (
  `adminID` INT NOT NULL AUTO_INCREMENT,
  `adminAd` NVARCHAR(50) NOT NULL,
  `adminSoyad` NVARCHAR(50) NOT NULL,
  `adminSifre` NVARCHAR(50) NOT NULL,
  PRIMARY KEY (`adminID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emlakDB`.`Kategori`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `emlakDB`.`Kategori` (
  `kategoriID` INT NOT NULL AUTO_INCREMENT,
  `kategoriAd` NVARCHAR(50) NOT NULL,
  PRIMARY KEY (`kategoriID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emlakDB`.`Islem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `emlakDB`.`Islem` (
  `islemID` INT NOT NULL AUTO_INCREMENT,
  `islemAd` NVARCHAR(50) NOT NULL,
  PRIMARY KEY (`islemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emlakDB`.`Kimden`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `emlakDB`.`Kimden` (
  `kimdenID` INT NOT NULL AUTO_INCREMENT,
  `kimdenAd` NVARCHAR(50) NOT NULL,
  `kimdenSoyad` NVARCHAR(50) NOT NULL,
  PRIMARY KEY (`kimdenID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emlakDB`.`Ilan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `emlakDB`.`Ilan` (
  `ilanID` INT NOT NULL AUTO_INCREMENT,
  `ilanBaslik` NVARCHAR(500) NOT NULL,
  `ilanFiyat` INT NOT NULL,
  `ilanTarih` DATETIME NOT NULL,
  `ilanVitrin` BIT(1) NOT NULL,
  `ilanVResim` NVARCHAR(500) NOT NULL,
  `ilanAdres` NVARCHAR(500) NOT NULL,
  `ilanAciklama` NVARCHAR(5000) NOT NULL,
  `kategoriID` INT NOT NULL,
  `islemID` INT NOT NULL,
  `kimdenID` INT NOT NULL,
  PRIMARY KEY (`ilanID`),
  INDEX `key_1_idx` (`kategoriID` ASC) VISIBLE,
  INDEX `key_2_idx` (`islemID` ASC) VISIBLE,
  INDEX `key_3_idx` (`kimdenID` ASC) VISIBLE,
  CONSTRAINT `key_1`
    FOREIGN KEY (`kategoriID`)
    REFERENCES `emlakDB`.`Kategori` (`kategoriID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `key_2`
    FOREIGN KEY (`islemID`)
    REFERENCES `emlakDB`.`Islem` (`islemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `key_3`
    FOREIGN KEY (`kimdenID`)
    REFERENCES `emlakDB`.`Kimden` (`kimdenID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emlakDB`.`IlanDetay`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `emlakDB`.`IlanDetay` (
  `idID` INT NOT NULL AUTO_INCREMENT,
  `idOdaSayi` INT NOT NULL,
  `idBinaYas` INT NOT NULL,
  `idBinaKat` INT NOT NULL,
  `idDaireKat` INT NOT NULL,
  `idIsitma` NVARCHAR(50) NOT NULL,
  `idEsya` BIT(1) NOT NULL,
  `ilanID` INT NOT NULL,
  PRIMARY KEY (`idID`),
  INDEX `key_1_idx` (`ilanID` ASC) VISIBLE,
  CONSTRAINT `key_1`
    FOREIGN KEY (`ilanID`)
    REFERENCES `emlakDB`.`Ilan` (`ilanID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emlakDB`.`Resim`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `emlakDB`.`Resim` (
  `resimID` INT NOT NULL,
  `resimAd` NVARCHAR(50) NOT NULL,
  `resimResim` NVARCHAR(500) NOT NULL,
  `ilanID` INT NOT NULL,
  PRIMARY KEY (`resimID`),
  INDEX `key_1_idx` (`ilanID` ASC) VISIBLE,
  CONSTRAINT `key_1`
    FOREIGN KEY (`ilanID`)
    REFERENCES `emlakDB`.`Ilan` (`ilanID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emlakDB`.`IcOzellik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `emlakDB`.`IcOzellik` (
  `ioID` INT NOT NULL AUTO_INCREMENT,
  `ioKuvet` BIT(1) NOT NULL,
  `ioAsansor` BIT(1) NOT NULL,
  `ioSomine` BIT(1) NOT NULL,
  `ioKapici` BIT(1) NOT NULL,
  `ilanID` INT NOT NULL,
  PRIMARY KEY (`ioID`),
  INDEX `key_1_idx` (`ilanID` ASC) VISIBLE,
  CONSTRAINT `key_1`
    FOREIGN KEY (`ilanID`)
    REFERENCES `emlakDB`.`Ilan` (`ilanID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `emlakDB`.`DisOzellik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `emlakDB`.`DisOzellik` (
  `doID` INT NOT NULL AUTO_INCREMENT,
  `doAlarm` BIT(1) NOT NULL,
  `doPark` BIT(1) NOT NULL,
  `doYuruyus` BIT(1) NOT NULL,
  `ilanID` INT NOT NULL,
  PRIMARY KEY (`doID`),
  INDEX `key_1_idx` (`ilanID` ASC) VISIBLE,
  CONSTRAINT `key_1`
    FOREIGN KEY (`ilanID`)
    REFERENCES `emlakDB`.`Ilan` (`ilanID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNI
