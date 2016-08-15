DELIMITER $$

DROP FUNCTION IF EXISTS `fn_get_user_text`$$

CREATE FUNCTION `fn_get_user_text`(parUserTextID INT) RETURNS VARCHAR(2000) CHARSET utf8
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
END$$

DELIMITER ;