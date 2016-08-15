#Create languages table
CREATE TABLE IF NOT EXISTS `tbl_languages`( `language_id` INT NOT NULL AUTO_INCREMENT, `language_name` VARCHAR(100) NOT NULL, PRIMARY KEY (`language_id`) ); 

#Insert Languages
TRUNCATE TABLE `tbl_languages`;
INSERT IGNORE INTO `tbl_languages`
(`language_id`, `language_name`) VALUES 
('1', 'English'), ('2', 'Kamba'), ('3', 'Swahili'), ('4', 'Spanish'), ('5', 'French'), ('6', 'German');

/*Table structure for table `tbl_hymn_description` */

CREATE TABLE  IF NOT EXISTS `tbl_hymn_description` (
  `description_id` int(11) NOT NULL AUTO_INCREMENT,
  `hymn_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `hymn_name` int(11) NOT NULL,
  `hymn_desc` int(11) NOT NULL,
  PRIMARY KEY (`description_id`,`hymn_id`,`language_id`,`hymn_name`,`hymn_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_hymn_lyrics` */

CREATE TABLE  IF NOT EXISTS `tbl_hymn_lyrics` (
  `lyrics_id` int(11) NOT NULL AUTO_INCREMENT,
  `hymn_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `lyrics` int(11) NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`lyrics_id`,`hymn_id`,`language_id`,`lyrics`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_hymns` */
CREATE TABLE  IF NOT EXISTS `tbl_hymns` (
  `hymn_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_added` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `views` int(11) DEFAULT '0',
  PRIMARY KEY (`hymn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_languages` */
CREATE TABLE  IF NOT EXISTS `tbl_languages` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_name` varchar(100) NOT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_user_text` */
CREATE TABLE  IF NOT EXISTS `tbl_user_text` (
  `text_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) DEFAULT NULL,
  `text_value` longtext,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`text_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
