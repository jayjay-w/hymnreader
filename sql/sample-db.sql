/*
SQLyog Community v12.09 (64 bit)
MySQL - 5.7.13-0ubuntu0.16.04.2 : Database - hymns
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hymns` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `hymns`;

/*Table structure for table `tbl_hymn_description` */

DROP TABLE IF EXISTS `tbl_hymn_description`;

CREATE TABLE `tbl_hymn_description` (
  `description_id` int(11) NOT NULL AUTO_INCREMENT,
  `hymn_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `hymn_name` int(11) NOT NULL,
  `hymn_desc` int(11) NOT NULL,
  PRIMARY KEY (`description_id`,`hymn_id`,`language_id`,`hymn_name`,`hymn_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_hymn_description` */

insert  into `tbl_hymn_description`(`description_id`,`hymn_id`,`language_id`,`hymn_name`,`hymn_desc`) values (1,6,1,1,2),(2,7,1,4,5);

/*Table structure for table `tbl_hymn_lyrics` */

DROP TABLE IF EXISTS `tbl_hymn_lyrics`;

CREATE TABLE `tbl_hymn_lyrics` (
  `lyrics_id` int(11) NOT NULL AUTO_INCREMENT,
  `hymn_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `lyrics` int(11) NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`lyrics_id`,`hymn_id`,`language_id`,`lyrics`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_hymn_lyrics` */

insert  into `tbl_hymn_lyrics`(`lyrics_id`,`hymn_id`,`language_id`,`lyrics`,`last_modified`) values (1,6,1,3,'2016-08-15 07:00:53'),(2,7,1,6,'2016-08-15 07:55:29');

/*Table structure for table `tbl_hymns` */

DROP TABLE IF EXISTS `tbl_hymns`;

CREATE TABLE `tbl_hymns` (
  `hymn_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_added` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `views` int(11) DEFAULT '0',
  PRIMARY KEY (`hymn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_hymns` */

insert  into `tbl_hymns`(`hymn_id`,`date_added`,`deleted`,`views`) values (6,'2016-08-15 07:00:53',0,0),(7,'2016-08-15 07:55:29',0,0);

/*Table structure for table `tbl_languages` */

DROP TABLE IF EXISTS `tbl_languages`;

CREATE TABLE `tbl_languages` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_name` varchar(100) NOT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_languages` */

insert  into `tbl_languages`(`language_id`,`language_name`) values (1,'English'),(2,'Kamba'),(3,'Swahili'),(4,'Spanish'),(5,'French'),(6,'German');

/*Table structure for table `tbl_user_text` */

DROP TABLE IF EXISTS `tbl_user_text`;

CREATE TABLE `tbl_user_text` (
  `text_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) DEFAULT NULL,
  `text_value` longtext,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`text_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_user_text` */

insert  into `tbl_user_text`(`text_id`,`language_id`,`text_value`,`last_modified`) values (1,1,'Joy To The World','2016-08-15 07:00:53'),(2,1,'A Christmas Carol','2016-08-15 07:00:53'),(3,1,'\nJoy to the World , the Lord is come!\nLet earth receive her King;\nLet every heart prepare Him room,\nAnd Heaven and nature sing,\nAnd Heaven and nature sing,\nAnd Heaven, and Heaven, and nature sing.\nJoy to the World, the Savior reigns!\nLet men their songs employ;\nWhile fields and floods, rocks, hills and plains\nRepeat the sounding joy,\nRepeat the sounding joy,\nRepeat, repeat, the sounding joy.\nNo more let sins and sorrows grow,\nNor thorns infest the ground;\nHe comes to make His blessings flow\nFar as the curse is found,\nFar as the curse is found,\nFar as, far as, the curse is found.\nHe rules the world with truth and grace,\nAnd makes the nations prove\nThe glories of His righteousness,\nAnd wonders of His love,\nAnd wonders of His love,\nAnd wonders, wonders, of His love.\n','2016-08-15 07:00:53'),(4,1,'Auld Lang Syne','2016-08-15 07:55:29'),(5,1,'A Friendhip Song','2016-08-15 07:55:29'),(6,1,'Should auld acquaintance be forgot,\r\nand never brought to mind?\r\nShould auld acquaintance be forgot,\r\nand auld lang syne?\r\nCHORUS:\r\nFor auld lang syne, my jo,\r\nfor auld lang syne,\r\nwelltak a cup o kindness yet,\r\nfor auld lang syne.\r\nAnd surely yell be your pint-stoup!\r\nand surely Ill be mine!\r\nAnd well tak a cup o kindness yet,\r\nfor auld lang syne.\r\nCHORUS\r\nWe twa hae run about the braes,\r\nand poud the gowans fine;\r\nBut weve wanderd mony a weary fit,\r\nsin auld lang syne.\r\nCHORUS\r\nWe twa hae paidld in the burn,\r\nfrae morning sun till dine;\r\nBut seas between us braid hae roard\r\nsin auld lang syne.\r\nCHORUS\r\nAnd theres a hand, my trusty fiere!\r\nand gies a hand o thine!\r\nAnd well tak a right gude-willie waught,\r\nfor auld lang syne.\r\nCHORUS\r\n','2016-08-15 07:55:29');

/* Function  structure for function  `fn_get_user_text` */

/*!50003 DROP FUNCTION IF EXISTS `fn_get_user_text` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `fn_get_user_text`(parUserTextID INT) RETURNS varchar(2000) CHARSET utf8
    DETERMINISTIC
BEGIN
    DECLARE utv VARCHAR(2000) CHARSET utf8;
    
    IF parUserTextID IS NULL THEN
        RETURN '';
    END IF;
    
    SELECT text_value INTO utv FROM tbl_user_text WHERE text_id = parUserTextID;
    IF utv IS NULL   THEN
      SELECT CONCAT('{',text_value,'}') INTO utv FROM tbl_user_text WHERE text_id = parUserTextID;
    END IF;
    IF utv IS NULL THEN
      SELECT '[Invalid code]' INTO utv;
    END IF;
    RETURN utv;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_create_hymn` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_create_hymn` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_create_hymn`(
	IN par_language_id INT,
	IN par_hymn_name VARCHAR(100),
	IN par_hymn_description LONGTEXT,
	IN par_hymn_lyrics LONGTEXT
    )
BEGIN
    DECLARE var_hymn_id, var_name_id, var_desc_id, var_lyrics_id INT;
    
    -- create the hymn
    INSERT INTO `tbl_hymns` (`date_added`) VALUES(NOW());
    SET var_hymn_id = LAST_INSERT_ID();
  
    -- Insert lyric name to text table
    INSERT INTO `tbl_user_text`(`language_id`, `text_value`, `last_modified`) 
    VALUES (par_language_id, par_hymn_name, NOW());
    SET var_name_id = LAST_INSERT_ID();
    
    -- Insert lyric desc to text table
    INSERT INTO `tbl_user_text`(`language_id`, `text_value`, `last_modified`) 
    VALUES (par_language_id, par_hymn_description, NOW());
    SET var_desc_id = LAST_INSERT_ID();
    
    -- Insert the descriptions
    INSERT INTO `tbl_hymn_description` (`hymn_id`, `language_id`, `hymn_name`, `hymn_desc`)
    VALUES (var_hymn_id, par_language_id, var_name_id, var_desc_id);
    
    -- Insert lyrics to text table
    INSERT INTO `tbl_user_text`(`language_id`, `text_value`, `last_modified`) 
    VALUES (par_language_id, par_hymn_lyrics, NOW());
    SET var_lyrics_id = LAST_INSERT_ID();
    
    -- insert lyrics
    INSERT INTO `tbl_hymn_lyrics` (`hymn_id`, `language_id`, `lyrics`, `last_modified`)
    VALUES (var_hymn_id, par_language_id, var_lyrics_id, NOW());
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_get_hymns` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_get_hymns` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_get_hymns`()
BEGIN
	SELECT 
tH.hymn_id,
fn_get_user_text(tHD.hymn_name) AS 'Name',
fn_get_user_text(tHD.hymn_desc) AS 'Description',
fn_get_user_text(tHL.lyrics) AS 'Lyrics'
FROM 
tbl_hymns tH, tbl_hymn_description tHD, tbl_hymn_lyrics tHL
WHERE tH.hymn_id = tHL.hymn_id
AND tH.hymn_id = tHD.hymn_id;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
