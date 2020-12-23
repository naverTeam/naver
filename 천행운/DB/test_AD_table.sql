CREATE TABLE `naverad` (
	`adimg` CHAR(100) NULL COLLATE 'euckr_korean_ci',
	`adurl` CHAR(100) NULL COLLATE 'euckr_korean_ci',
	`adtype` CHAR(100) NULL COLLATE 'euckr_korean_ci',
	`addesc` CHAR(200) NULL COLLATE 'euckr_korean_ci'
)
COLLATE='euckr_korean_ci'
ENGINE=InnoDB
ROW_FORMAT=COMPACT
;