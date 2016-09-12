-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema superhero
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `superhero` ;

-- -----------------------------------------------------
-- Schema superhero
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `superhero` DEFAULT CHARACTER SET utf8 ;
USE `superhero` ;

-- -----------------------------------------------------
-- Table `superhero`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `superhero` ;

CREATE TABLE IF NOT EXISTS `superhero` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hero_name` VARCHAR(30) NOT NULL,
  `alter_ego` VARCHAR(45) NOT NULL,
  `universe` VARCHAR(30) NULL,
  `has_cape` VARCHAR(15) NULL,
  `power` VARCHAR(45) NULL,
  `arch_nemesis` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `arch_nemesis`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `arch_nemesis` ;

CREATE TABLE IF NOT EXISTS `arch_nemesis` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nemesis_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `superhero_nemesis`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `superhero_nemesis` ;

CREATE TABLE IF NOT EXISTS `superhero_nemesis` (
  `superhero_id` INT NOT NULL,
  `nemesis_id` INT NOT NULL,
  PRIMARY KEY (`nemesis_id`, `superhero_id`),
  INDEX `fk_nemesis_superhero_nemesis_idx` (`nemesis_id` ASC),
  CONSTRAINT `fk_nemesis_superhero_nemesis`
    FOREIGN KEY (`nemesis_id`)
    REFERENCES `arch_nemesis` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_superhero_nemesis_superhero`
    FOREIGN KEY (`superhero_id`)
    REFERENCES `superhero` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO user@localhost;
 DROP USER user@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'user'@'localhost' IDENTIFIED BY 'user';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'user'@'localhost';

-- -----------------------------------------------------
-- Data for table `superhero`
-- -----------------------------------------------------
START TRANSACTION;
USE `superhero`;
INSERT INTO `superhero` (`id`, `hero_name`, `alter_ego`, `universe`, `has_cape`, `power`, `arch_nemesis`) VALUES (1, 'Superman', 'Clark Kent', 'DC', 'true', 'strength/flight/laser vision', 'Lex Luthor');
INSERT INTO `superhero` (`id`, `hero_name`, `alter_ego`, `universe`, `has_cape`, `power`, `arch_nemesis`) VALUES (2, 'Wonder Woman', 'Diana Prince', 'DC', 'false', 'strength/speed', 'Cheetah');
INSERT INTO `superhero` (`id`, `hero_name`, `alter_ego`, `universe`, `has_cape`, `power`, `arch_nemesis`) VALUES (3, 'Batman', 'Bruce Wayne', 'DC', 'true', 'intelligence/wealth', 'Joker');
INSERT INTO `superhero` (`id`, `hero_name`, `alter_ego`, `universe`, `has_cape`, `power`, `arch_nemesis`) VALUES (4, 'Professor X', 'Charles Xavier', 'Marvel', 'false', 'psychic', 'Magneto');
INSERT INTO `superhero` (`id`, `hero_name`, `alter_ego`, `universe`, `has_cape`, `power`, `arch_nemesis`) VALUES (5, 'Spiderman', 'Peter Parker', 'Marvel', 'false', 'wall climbing/web-slinging', 'Doctor Octopus');
INSERT INTO `superhero` (`id`, `hero_name`, `alter_ego`, `universe`, `has_cape`, `power`, `arch_nemesis`) VALUES (6, 'Captain America', 'Steve Rogers', 'Marvel', 'false', 'super soldier', 'Red Skull');
INSERT INTO `superhero` (`id`, `hero_name`, `alter_ego`, `universe`, `has_cape`, `power`, `arch_nemesis`) VALUES (7, 'Iron Man', 'Tony Stark', 'Marvel', 'false', 'iron suit/wealth', 'Mandarin');
INSERT INTO `superhero` (`id`, `hero_name`, `alter_ego`, `universe`, `has_cape`, `power`, `arch_nemesis`) VALUES (8, 'Wolverine', 'Logan', 'Marvel', 'false', 'healing/adamantium bones', 'Sabretooth');
INSERT INTO `superhero` (`id`, `hero_name`, `alter_ego`, `universe`, `has_cape`, `power`, `arch_nemesis`) VALUES (9, 'Black Widow', 'Natasha Romanoff', 'Marvel', 'false', 'super spy', 'Winter Soldier');
INSERT INTO `superhero` (`id`, `hero_name`, `alter_ego`, `universe`, `has_cape`, `power`, `arch_nemesis`) VALUES (10, 'Hulk', 'Bruce Banner', 'Marvel', 'false', 'indestructible/strength', 'Red Hulk');
INSERT INTO `superhero` (`id`, `hero_name`, `alter_ego`, `universe`, `has_cape`, `power`, `arch_nemesis`) VALUES (11, 'Thor Odinson', 'None', 'Marvel', 'true', 'worthy of Mjolnir', 'Loki');
INSERT INTO `superhero` (`id`, `hero_name`, `alter_ego`, `universe`, `has_cape`, `power`, `arch_nemesis`) VALUES (12, 'Flash', 'Barry Allen', 'DC', 'false', 'super-dooper speed', 'Reverse-Flash');
INSERT INTO `superhero` (`id`, `hero_name`, `alter_ego`, `universe`, `has_cape`, `power`, `arch_nemesis`) VALUES (13, 'Aquaman', 'Arthur Curry', 'DC', 'false', 'talks to fish', 'Black Manta');
INSERT INTO `superhero` (`id`, `hero_name`, `alter_ego`, `universe`, `has_cape`, `power`, `arch_nemesis`) VALUES (14, 'Skitter', 'Taylor Hebert', 'Worm', 'true', 'controls bugs', 'Jack Slash');
INSERT INTO `superhero` (`id`, `hero_name`, `alter_ego`, `universe`, `has_cape`, `power`, `arch_nemesis`) VALUES (15, 'Tattle-Tale', 'Lisa Wilbourn', 'Worm', 'false', 'enhanced intuition', 'Accord');
INSERT INTO `superhero` (`id`, `hero_name`, `alter_ego`, `universe`, `has_cape`, `power`, `arch_nemesis`) VALUES (16, 'Grue', 'Brian Laborn', 'Worm', 'false', 'generates darkness', 'Kaiser');
INSERT INTO `superhero` (`id`, `hero_name`, `alter_ego`, `universe`, `has_cape`, `power`, `arch_nemesis`) VALUES (17, 'Bitch', 'Rachel Lindt', 'Worm', 'false', 'makes dogs into hellhounds', 'Siberian');
INSERT INTO `superhero` (`id`, `hero_name`, `alter_ego`, `universe`, `has_cape`, `power`, `arch_nemesis`) VALUES (18, 'Regent', 'Alec Vasil', 'Worm', 'false', 'body control', 'Heartbreaker');
INSERT INTO `superhero` (`id`, `hero_name`, `alter_ego`, `universe`, `has_cape`, `power`, `arch_nemesis`) VALUES (19, 'Imp', 'Aisha Laborn', 'Worm', 'false', 'undetectable', 'Hookwolf');
INSERT INTO `superhero` (`id`, `hero_name`, `alter_ego`, `universe`, `has_cape`, `power`, `arch_nemesis`) VALUES (20, 'Miss Militia', 'Hannah', 'Worm', 'false', 'creates weapons out of nothing', 'Endbringers');
INSERT INTO `superhero` (`id`, `hero_name`, `alter_ego`, `universe`, `has_cape`, `power`, `arch_nemesis`) VALUES (21, 'Eidolon', 'David', 'Worm', 'true', 'has any three powers at once', 'Endbringers');

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
