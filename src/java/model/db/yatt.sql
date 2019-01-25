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
  `name` VARCHAR(45) NOT NULL,
  `imageURL` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;
INSERT INTO category 
    (name,imageURL) 
VALUES 
    ('Tops','img/top_category.jpg'),
    ('Bottoms','img/bottom_category.jpg'),
    ('Dresses','img/dress_category.jpg'),
    ('Accessories','img/accessory_category.jpg'),
    ('Underwear','img/underwear_category.jpg'),
    ('Gift Card','img/gift_card_category.png');


-- -----------------------------------------------------
-- Table `yattdb`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yattdb`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `imageURL` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;
INSERT INTO product 
    (name,description,imageURL,price) 
VALUES 
    ('top1','d','img/top1.jpg','300'), 
    ('top2','d','img/top2.jpg','300'),
    ('top3','d','img/top3.jpg','300'),
    ('top4','d','img/top4.jpg','300'),   
    ('acc1','d','img/acc1.jpg','300'),
    ('acc2','d','img/acc2.jpg','300'),
    ('acc3','d','img/acc3.jpg','300'),
    ('acc4','d','img/acc4.jpg','300'),
    ('bottom1','d','img/bottom1.jpg','300'),
    ('bottom2','d','img/bottom2.jpg','300'),
    ('bottom3','d','img/bottom3.jpg','300'),
    ('bottom4','d','img/bottom4.jpg','300'),
    ('dress1','d','img/dress1.jpg','300'),
    ('dress2','d','img/dress2.jpg','300'),
    ('dress3','d','img/dress3.jpg','300'),
    ('dress4','d','img/dress4.jpg','300'),
    ('under1','d','img/under1.jpg','300'),
    ('under2','d','img/under2.jpg','300'),
    ('under3','d','img/under3.jpg','300'),
    ('under4','d','img/under4.png','300');


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


-- -----------------------------------------------------
-- Table `yattdb`.`category_has_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yattdb`.`category_has_product` (
  `category_name` VARCHAR(45) NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`category_name`, `product_id`),
  INDEX `fk_category_has_product_product1_idx` (`product_id` ASC),
  INDEX `fk_category_has_product_category1_idx` (`category_name` ASC),
  CONSTRAINT `fk_category_has_product_category1`
    FOREIGN KEY (`category_name`)
    REFERENCES `yattdb`.`category` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_has_product_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `yattdb`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
INSERT INTO category_has_product
    (category_name,product_id) 
VALUES 
    ('Tops','1'),
    ('Tops','2'),
    ('Tops','3'),
    ('Tops','4'),
    ('Bottoms','9'),
    ('Bottoms','10'),
    ('Bottoms','11'),
    ('Bottoms','12'),
    ('Dresses','13'),
    ('Dresses','14'),
    ('Dresses','15'),
    ('Dresses','16'),
    ('Accessories','5'),
    ('Accessories','6'),
    ('Accessories','7'),
    ('Accessories','8'),
    ('Underwear','17'),
    ('Underwear','18'),
    ('Underwear','19'),
    ('Underwear','20');


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
