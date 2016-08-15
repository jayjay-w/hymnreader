DROP PROCEDURE IF EXISTS sp_create_hymn;
DELIMITER $$

CREATE PROCEDURE `sp_create_hymn`(
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
    END$$

DELIMITER ;