CREATE TABLE `naverblog` (
	`num` INT(11) NOT NULL AUTO_INCREMENT,
	`btitle` CHAR(200) NULL COLLATE 'euckr_korean_ci',
	`bimg` CHAR(200) NULL COLLATE 'euckr_korean_ci',
	`bdesc` TEXT NULL COLLATE 'euckr_korean_ci',
	PRIMARY KEY (`num`) USING BTREE
)
COLLATE='euckr_korean_ci'
ENGINE=InnoDB
AUTO_INCREMENT=1
;