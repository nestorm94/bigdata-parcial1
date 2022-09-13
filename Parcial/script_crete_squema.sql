-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema classicmodels
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `classicmodels` ;

-- -----------------------------------------------------
-- Schema classicmodels
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `classicmodels` DEFAULT CHARACTER SET latin1 ;
USE `classicmodels` ;

-- -----------------------------------------------------
-- Table `classicmodels`.`offices`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `classicmodels`.`offices` ;

CREATE TABLE IF NOT EXISTS `classicmodels`.`offices` (
  `officeCode` VARCHAR(10) NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(50) NOT NULL,
  `addressLine1` VARCHAR(50) NOT NULL,
  `addressLine2` VARCHAR(50) NULL DEFAULT NULL,
  `state` VARCHAR(50) NULL DEFAULT NULL,
  `country` VARCHAR(50) NOT NULL,
  `postalCode` VARCHAR(15) NOT NULL,
  `territory` VARCHAR(10) NOT NULL,
  `city_copy1` VARCHAR(50) NOT NULL,
  `phone_copy1` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`officeCode`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `classicmodels`.`employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `classicmodels`.`employees` ;

CREATE TABLE IF NOT EXISTS `classicmodels`.`employees` (
  `employeeNumber` INT NOT NULL,
  `lastName` VARCHAR(50) NOT NULL,
  `firstName` VARCHAR(50) NOT NULL,
  `extension` VARCHAR(10) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `officeCode` VARCHAR(10) NOT NULL,
  `jobTitle` VARCHAR(50) NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(50) NOT NULL,
  `addressLine1` VARCHAR(50) NOT NULL,
  `addressLine2` VARCHAR(50) NULL DEFAULT NULL,
  `state` VARCHAR(50) NULL DEFAULT NULL,
  `country` VARCHAR(50) NOT NULL,
  `postalCode` VARCHAR(15) NOT NULL,
  `territory` VARCHAR(10) NOT NULL,
  `city_copy1` VARCHAR(50) NOT NULL,
  `phone_copy1` VARCHAR(50) NOT NULL,
  `employeescol` VARCHAR(45) NULL,
  PRIMARY KEY (`employeeNumber`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `classicmodels`.`customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `classicmodels`.`customers` ;

CREATE TABLE IF NOT EXISTS `classicmodels`.`customers` (
  `customerNumber` INT NOT NULL,
  `customerName` VARCHAR(50) NOT NULL,
  `contactLastName` VARCHAR(50) NOT NULL,
  `contactFirstName` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(50) NOT NULL,
  `addressLine1` VARCHAR(50) NOT NULL,
  `addressLine2` VARCHAR(50) NULL DEFAULT NULL,
  `city` VARCHAR(50) NOT NULL,
  `state` VARCHAR(50) NULL DEFAULT NULL,
  `postalCode` VARCHAR(15) NULL DEFAULT NULL,
  `country` VARCHAR(50) NOT NULL,
  `salesRepEmployeeNumber` INT NULL DEFAULT NULL,
  `creditLimit` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`customerNumber`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `classicmodels`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `classicmodels`.`orders` ;

CREATE TABLE IF NOT EXISTS `classicmodels`.`orders` (
  `orderNumber` INT NOT NULL,
  `orderDate` DATE NOT NULL,
  `requiredDate` DATE NOT NULL,
  `shippedDate` DATE NULL DEFAULT NULL,
  `status` VARCHAR(15) NOT NULL,
  `comments` TEXT NULL DEFAULT NULL,
  `customerNumber` INT NOT NULL,
  `quantityOrdered` INT NULL,
  `priceEach` VARCHAR(45) NULL,
  `orderLineNumber` VARCHAR(45) NULL,
  PRIMARY KEY (`orderNumber`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `classicmodels`.`orderdetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `classicmodels`.`orderdetails` ;

CREATE TABLE IF NOT EXISTS `classicmodels`.`orderdetails` (
  `orderNumber` INT NOT NULL,
  `quantityOrdered` INT NOT NULL,
  `priceEach` DECIMAL(10,2) NOT NULL,
  `orderLineNumber` SMALLINT NOT NULL,
  PRIMARY KEY (`orderNumber`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `classicmodels`.`payments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `classicmodels`.`payments` ;

CREATE TABLE IF NOT EXISTS `classicmodels`.`payments` (
  `customerNumber` INT NOT NULL,
  `checkNumber` VARCHAR(50) NOT NULL,
  `paymentDate` DATE NOT NULL,
  `amount` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`customerNumber`, `checkNumber`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `classicmodels`.`productlines`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `classicmodels`.`productlines` ;

CREATE TABLE IF NOT EXISTS `classicmodels`.`productlines` (
  `productLine` VARCHAR(50) NOT NULL,
  `textDescription` VARCHAR(4000) NULL DEFAULT NULL,
  `htmlDescription` MEDIUMTEXT NULL DEFAULT NULL,
  `image` MEDIUMBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`productLine`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `classicmodels`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `classicmodels`.`products` ;

CREATE TABLE IF NOT EXISTS `classicmodels`.`products` (
  `productCode` VARCHAR(15) NOT NULL,
  `productName` VARCHAR(70) NOT NULL,
  `productLine` VARCHAR(50) NOT NULL,
  `productScale` VARCHAR(10) NOT NULL,
  `productVendor` VARCHAR(50) NOT NULL,
  `productDescription` TEXT NOT NULL,
  `quantityInStock` SMALLINT NOT NULL,
  `buyPrice` DECIMAL(10,2) NOT NULL,
  `MSRP` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`productCode`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `classicmodels`.`Dimension_tiempo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `classicmodels`.`Dimension_tiempo` ;

CREATE TABLE IF NOT EXISTS `classicmodels`.`Dimension_tiempo` (
  `idDimension_tiempo` INT NOT NULL,
  `Fecha` DATE NULL,
  `ano` INT NULL,
  `mes` INT NULL,
  PRIMARY KEY (`idDimension_tiempo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `classicmodels`.`Hecho_Ventas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `classicmodels`.`Hecho_Ventas` ;

CREATE TABLE IF NOT EXISTS `classicmodels`.`Hecho_Ventas` (
  `products_productCode` VARCHAR(15) NOT NULL,
  `orders_orderNumber` INT NOT NULL,
  `employees_employeeNumber` INT NOT NULL,
  `Dimension_tiempo_idDimension_tiempo` INT NOT NULL,
  `Unidades` INT NULL,
  `precio` DOUBLE NULL,
  PRIMARY KEY (`products_productCode`, `orders_orderNumber`, `employees_employeeNumber`, `Dimension_tiempo_idDimension_tiempo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `classicmodels`.`Dimension_tiempo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `classicmodels`.`Dimension_tiempo` ;

CREATE TABLE IF NOT EXISTS `classicmodels`.`Dimension_tiempo` (
  `idDimension_tiempo` INT NOT NULL,
  `Fecha` DATE NULL,
  `ano` INT NULL,
  `mes` INT NULL,
  PRIMARY KEY (`idDimension_tiempo`))
ENGINE = InnoDB;

USE `classicmodels` ;

-- -----------------------------------------------------
-- Placeholder table for view `classicmodels`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `classicmodels`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `classicmodels`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `classicmodels`.`view1`;
DROP VIEW IF EXISTS `classicmodels`.`view1` ;
USE `classicmodels`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
