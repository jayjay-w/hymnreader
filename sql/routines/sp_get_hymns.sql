DROP PROCEDURE IF EXISTS sp_get_hymns;
DELIMITER $$

CREATE
    PROCEDURE `hymns`.`sp_get_hymns`()
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
    END$$

DELIMITER ;