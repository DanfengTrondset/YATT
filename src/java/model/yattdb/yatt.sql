-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema yattdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema yattdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `yattdb` DEFAULT CHARACTER SET utf8 ;
USE `yattdb` ;

-- -----------------------------------------------------
-- Table `yattdb`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yattdb`.`customer` (
  `email` VARCHAR(45) NOT NULL,
  `userName` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yattdb`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yattdb`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `imageURL` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yattdb`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yattdb`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NULL,
  `imageURL` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yattdb`.`category_has_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yattdb`.`category_has_product` (
  `category_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`category_id`, `product_id`),
  INDEX `fk_category_has_product_product1_idx` (`product_id` ASC),
  INDEX `fk_category_has_product_category_idx` (`category_id` ASC),
  CONSTRAINT `fk_category_has_product_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `yattdb`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_has_product_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `yattdb`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yattdb`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yattdb`.`cart` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yattdb`.`cart_has_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yattdb`.`cart_has_product` (
  `cart_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`cart_id`, `product_id`),
  INDEX `fk_cart_has_product_product1_idx` (`product_id` ASC),
  INDEX `fk_cart_has_product_cart1_idx` (`cart_id` ASC),
  CONSTRAINT `fk_cart_has_product_cart1`
    FOREIGN KEY (`cart_id`)
    REFERENCES `yattdb`.`cart` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_has_product_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `yattdb`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
