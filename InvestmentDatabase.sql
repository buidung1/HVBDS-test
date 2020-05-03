-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema investmentDatabase
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema investmentDatabase
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `investmentDatabase` DEFAULT CHARACTER SET utf8 ;
USE `investmentDatabase` ;

-- -----------------------------------------------------
-- Table `investmentDatabase`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `investmentDatabase`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `UserName` VARCHAR(45) NULL,
  `UserPassword` VARCHAR(45) NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `investmentDatabase`.`Project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `investmentDatabase`.`Project` (
  `idProject` INT NOT NULL AUTO_INCREMENT,
  `ProjectName` VARCHAR(45) NULL,
  `ProjectDes` TEXT(10000) NULL,
  `ProjectFee` INT(20) NULL,
  `ProjectHolder` VARCHAR(45) NULL,
  PRIMARY KEY (`idProject`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `investmentDatabase`.`Investor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `investmentDatabase`.`Investor` (
  `idInvestor` INT NOT NULL AUTO_INCREMENT,
  `InvestorName` VARCHAR(45) NULL,
  `InvestorPhoneNum` VARCHAR(45) NULL,
  `InvestorFund` INT(20) NULL,
  PRIMARY KEY (`idInvestor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `investmentDatabase`.`Investment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `investmentDatabase`.`Investment` (
  `idInvestment` INT NOT NULL AUTO_INCREMENT,
  `InvestmentDetails` TEXT(10000) NULL,
  `InvestmentSatus` VARCHAR(45) NULL,
  `Project_idProject` INT NOT NULL,
  `Investor_idInvestor` INT NOT NULL,
  `User_idUser` INT NOT NULL,
  PRIMARY KEY (`idInvestment`, `Project_idProject`, `Investor_idInvestor`, `User_idUser`),
  INDEX `fk_Investment_Project_idx` (`Project_idProject` ASC),
  INDEX `fk_Investment_Investor1_idx` (`Investor_idInvestor` ASC),
  INDEX `fk_Investment_User1_idx` (`User_idUser` ASC),
  CONSTRAINT `fk_Investment_Project`
    FOREIGN KEY (`Project_idProject`)
    REFERENCES `investmentDatabase`.`Project` (`idProject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Investment_Investor1`
    FOREIGN KEY (`Investor_idInvestor`)
    REFERENCES `investmentDatabase`.`Investor` (`idInvestor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Investment_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `investmentDatabase`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
