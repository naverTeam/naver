CREATE TABLE `in_question` (
	`qnum` INT(50) NOT NULL AUTO_INCREMENT,
	`id` VARCHAR(50) NOT NULL COLLATE 'euckr_korean_ci',
	`title` VARCHAR(50) NOT NULL COLLATE 'euckr_korean_ci',
	`content` VARCHAR(1000) NOT NULL COLLATE 'euckr_korean_ci',
	`directory` VARCHAR(50) NOT NULL COLLATE 'euckr_korean_ci',
	`point` INT(11) NULL,
	`answer_count` INT(50) NULL DEFAULT '0',
	`hits` INT(11) NULL DEFAULT '0',
	`date` DATETIME NOT NULL,
	`filename` VARCHAR(50) NULL COLLATE 'euckr_korean_ci',
	`filedata` VARCHAR(50) NULL COLLATE 'euckr_korean_ci',
	`filesize` INT(11) NULL,
	`filename2` VARCHAR(50) NULL COLLATE 'euckr_korean_ci',
	`filedata2` VARCHAR(50) NULL COLLATE 'euckr_korean_ci',
	`filesize2` INT(11) NULL,
	`tag` VARCHAR(500) NULL COLLATE 'euckr_korean_ci',
	`choice` INT(11) NULL,
	PRIMARY KEY (`qnum`) USING BTREE
)
COLLATE='euckr_korean_ci'
ENGINE=InnoDB
AUTO_INCREMENT=893
;

CREATE TABLE `in_answer` (
	`anum` INT(11) NOT NULL AUTO_INCREMENT,
	`qnum` INT(11) NOT NULL,
	`id` VARCHAR(50) NOT NULL COLLATE 'euckr_korean_ci',
	`grade` VARCHAR(50) NULL DEFAULT '일반' COLLATE 'euckr_korean_ci',
	`content` VARCHAR(1000) NOT NULL COLLATE 'euckr_korean_ci',
	`date` DATETIME NOT NULL,
	`choice` INT(11) NULL,
	PRIMARY KEY (`anum`) USING BTREE,
	INDEX `qnum` (`qnum`) USING BTREE,
	CONSTRAINT `qnum` FOREIGN KEY (`qnum`) REFERENCES `naver`.`in_question` (`qnum`) ON UPDATE RESTRICT ON DELETE CASCADE
)
COLLATE='euckr_korean_ci'
ENGINE=InnoDB
AUTO_INCREMENT=74
;