SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `forum` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;

-- -----------------------------------------------------
-- Table `forum`.`forums`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `forum`.`forums` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '	' ,
  `forumName` VARCHAR(100) NULL ,
  `forumDescription` VARCHAR(255) NULL ,
  `startUser` VARCHAR(100) NULL COMMENT '	' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forum`.`users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `forum`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `userName` VARCHAR(50) NULL ,
  `password` VARCHAR(50) NULL ,
  `createdat` DATETIME NULL ,
  `numPosts` INT NULL COMMENT '	' ,
  `role` INT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forum`.`threads`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `forum`.`threads` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `threadTitle` VARCHAR(100) NULL ,
  `userID` INT NULL COMMENT '	' ,
  `forumID` INT NULL COMMENT '	' ,
  `isSticky` BIT NOT NULL DEFAULT 0 ,
  `views` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `userID` (`userID` ASC) ,
  INDEX `fk_threads_forums1` (`forumID` ASC) ,
  CONSTRAINT `userID`
    FOREIGN KEY (`userID` )
    REFERENCES `forum`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_threads_forums1`
    FOREIGN KEY (`forumID` )
    REFERENCES `forum`.`forums` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forum`.`posts`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `forum`.`posts` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `postBody` TEXT NULL ,
  `threadID` INT NULL COMMENT '	' ,
  `userID` INT NULL COMMENT '	' ,
  `createdat` DATETIME NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_posts_threads1` (`threadID` ASC) ,
  INDEX `fk_posts_users1` (`userID` ASC) ,
  CONSTRAINT `fk_posts_threads1`
    FOREIGN KEY (`threadID` )
    REFERENCES `forum`.`threads` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posts_users1`
    FOREIGN KEY (`userID` )
    REFERENCES `forum`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
