#Create languages table
CREATE TABLE IF NOT EXISTS `tbl_languages`( `language_id` INT NOT NULL AUTO_INCREMENT, `language_name` VARCHAR(100) NOT NULL, PRIMARY KEY (`language_id`) ); 

#Insert Languages
TRUNCATE TABLE `tbl_languages`;
INSERT IGNORE INTO `tbl_languages`
(`language_id`, `language_name`) VALUES 
('1', 'English'), ('2', 'Kamba'), ('3', 'Swahili'), ('4', 'Spanish'), ('5', 'French'), ('6', 'German');