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
  `description` VARCHAR(256) NOT NULL,
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
    ('Double Side Black and White Jacket','Double-sided jacket with a contrast faux shearling collar and long sleeves. Featuring two side pockets, an adjustable collar with buckle and a zip-up front.','img/top1.jpg','1300','Tops'), 
    ('Two Colour Training T-shirt','Two colour woven T-shirt with featured back details.','img/top2.jpg','150','Tops'),
    ('Rope Chain Neck-Tie Shirt','A semi-sheer woven top featuring a V-neckline with self-tie straps, long buttoned-cuff sleeves, shirred seams throughout, and a curved hem.','img/top3.jpg','200','Tops'),
    ('Contrast Tie-Nect Shirt','A semi-sheer woven shirt featuring a basic collar, contrast self-tie neck straps, short sleeves with banded trim, button-front closures, a darted bust, and curved hem.','img/top4.jpg','350','Tops'),   
    ('Leather Hangbag','Handbag in soft leather. Two handles and a zip at top, detachable, adjustable shoulder strap, and two inner compartments, one with zip.','img/acc1.jpg','1200','Accessories'),
    ('Polarized Light Sunglasses','Sunglasses with plastic and metal frames and tinted, UV-protective lenses.','img/acc2.jpg','650','Accessories'),
    ('Leather Gloves','Keep your hands warm with these leather gloves featuring channel quilted trim.','img/acc3.jpg','250','Accessories'),
    ('Lock Chain-Link Bracelet','A high-polish bracelet featuring a lock chain-link design and a toggle closure.','img/acc4.jpg','300','Accessories'),
    ('Plaid High-Waist Ankle Pants','A pair of stretch-woven skinny pants featuring an allover plaid pattern, five-pocket construction, a zip fly, and a high-waist cut.','img/bottom1.jpg','200','Bottoms'),
    ('Plaid Flare Pants','A pair of stretch-woven pants featuring a plaid pattern, elasticized high-rise waist, and a flare leg.','img/bottom2.jpg','250','Bottoms'),
    ('High-Waist Skinny Jeans','A pair of skinny jeans with a five-pocket construction designed to fit high on the waist and slim and sleek through the leg.','img/bottom3.jpg','450','Bottoms'),
    ('High-Rise Skinny Jeans','A pair of true vintage-inspired high-waisted skinny jeans featuring a super-stretch construction, five-pocket construction, zip fly, distressed accents, and a fit that sits on the natural waistline and is fitted through the leg.','img/bottom4.jpg','450','Bottoms'),
    ('Striped Bodycon Dress','A ribbed knit dress featuring a contrast striped design, solid crew neck, long sleeves, and a bodycon silhouette.','img/dress1.jpg','280','Dresses'),
    ('Chiffon Seft-Tie Floral Print Dress','A chiffon woven dress featuring a V-neckline, long buttoned sleeves, a round hemline, and self-tie sash belt.','img/dress2.jpg','350','Dresses'),
    ('Belted Chiffon Maxi Dress','A chiffon woven wrapped dress with a V-next,middle length shirred sleeves, back pleat, a self-tie belted waist, and a maxi length.','img/dress3.jpg','300','Dresses'),
    ('Floral Print Ruffle Dress','A woven midi dress featuring an allover floral print, round neckline secured by interior buttons, cap sleeves, notched collar, and a tulip hem.','img/dress4.jpg','650','Dresses'),
    ('Microfiber Bra & Panty Set','A microfiber knit bra featuring a V-neckline, adjustable cami straps, banded waist, wire-free structured detail under the bust, and pull-on styling.','img/under1.jpg','300','Underwear'),
    ('Low Impact - Sports Bra','A low-impact knit sports bra featuring a seamless construction, a crisscross back, V-neckline, adjustable straps, removable cups, and a moisture management wicking fabric.','img/under2.jpg','250','Underwear'),
    ('Satin Linerie PJ Set','This two-piece satin lingerie pajama set comes with a relaxed cami top featuring a V-cut neck and back with scalloped floral lace that extends to form shoulder straps, and a matching pair of shorts with slant front pockets and an elasticized waistband.','img/under3.jpg','350','Underwear'),
    ('Cotton Bra & Panty Set','A ribbed knit set with elasticized striped trim, featuring a sports bra with a scoop neck, as well as a high-leg cut panty with a cheeky bottom.','img/under4.jpg','450','Underwear');

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
