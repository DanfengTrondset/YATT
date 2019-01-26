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
  `category_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_product_category1_idx` (`category_name` ASC),
  CONSTRAINT `fk_product_category1`
    FOREIGN KEY (`category_name`)
    REFERENCES `yattdb`.`category` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
INSERT INTO product 
    (name,description,imageURL,price,category_name) 
VALUES 
    ('top1','d','img/top1.jpg','300','Tops'), 
    ('top2','d','img/top2.jpg','300','Tops'),
    ('top3','d','img/top3.jpg','300','Tops'),
    ('top4','d','img/top4.jpg','300','Tops'),   
    ('acc1','d','img/acc1.jpg','300','Accessories'),
    ('acc2','d','img/acc2.jpg','300','Accessories'),
    ('acc3','d','img/acc3.jpg','300','Accessories'),
    ('acc4','d','img/acc4.jpg','300','Accessories'),
    ('bottom1','d','img/bottom1.jpg','300','Bottoms'),
    ('bottom2','d','img/bottom2.jpg','300','Bottoms'),
    ('bottom3','d','img/bottom3.jpg','300','Bottoms'),
    ('bottom4','d','img/bottom4.jpg','300','Bottoms'),
    ('dress1','d','img/dress1.jpg','300','Dresses'),
    ('dress2','d','img/dress2.jpg','300','Dresses'),
    ('dress3','d','img/dress3.jpg','300','Dresses'),
    ('dress4','d','img/dress4.jpg','300','Dresses'),
    ('under1','d','img/under1.jpg','300','Underwear'),
    ('under2','d','img/under2.jpg','300','Underwear'),
    ('under3','d','img/under3.jpg','300','Underwear'),
    ('under4','d','img/under4.png','300','Underwear');

-- -----------------------------------------------------
-- Table `yattdb`.`customer_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yattdb`.`customer_order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `customer_email` VARCHAR(45) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_customer_order_customer1_idx` (`customer_email` ASC),
  CONSTRAINT `fk_customer_order_customer1`
    FOREIGN KEY (`customer_email`)
    REFERENCES `yattdb`.`customer` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yattdb`.`ordered_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yattdb`.`ordered_product` (
  `customer_order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`customer_order_id`, `product_id`),
  INDEX `fk_ordered_product_product1_idx` (`product_id` ASC),
  CONSTRAINT `fk_ordered_product_customer_order1`
    FOREIGN KEY (`customer_order_id`)
    REFERENCES `yattdb`.`customer_order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordered_product_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `yattdb`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
