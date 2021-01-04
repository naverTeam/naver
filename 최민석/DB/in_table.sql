CREATE TABLE `in_question` (
	`qnum` INT(50) NOT NULL AUTO_INCREMENT,
	`id` VARCHAR(50) NOT NULL COLLATE 'euckr_korean_ci',
	`title` VARCHAR(50) NOT NULL COLLATE 'euckr_korean_ci',
	`content` VARCHAR(1000) NOT NULL COLLATE 'euckr_korean_ci',
	`directory` VARCHAR(50) NOT NULL COLLATE 'euckr_korean_ci',
	`point` INT(11) NOT NULL DEFAULT '0',
	`answer_count` INT(50) NULL DEFAULT '0',
	`hits` INT(11) NULL DEFAULT '0',
	`date` DATETIME NOT NULL,
	`filename` VARCHAR(50) NULL COLLATE 'euckr_korean_ci',
	`filesize` INT(11) NULL,
	PRIMARY KEY (`qnum`) USING BTREE
)
COLLATE='euckr_korean_ci'
ENGINE=InnoDB
AUTO_INCREMENT=835
;





CREATE TABLE `in_answer` (
	`anum` INT(11) NOT NULL AUTO_INCREMENT,
	`qnum` INT(11) NOT NULL,
	`id` VARCHAR(50) NOT NULL COLLATE 'euckr_korean_ci',
	`grade` VARCHAR(50) NULL DEFAULT '일반' COLLATE 'euckr_korean_ci',
	`content` VARCHAR(1000) NOT NULL COLLATE 'euckr_korean_ci',
	`date` DATETIME NOT NULL,
	PRIMARY KEY (`anum`) USING BTREE,
	INDEX `qnum` (`qnum`) USING BTREE,
	CONSTRAINT `qnum` FOREIGN KEY (`qnum`) REFERENCES `naver`.`in_question` (`qnum`) ON UPDATE RESTRICT ON DELETE CASCADE
)
COLLATE='euckr_korean_ci'
ENGINE=InnoDB
AUTO_INCREMENT=44
;



CREATE TABLE `in_comment` (
	`cnum` INT(11) NOT NULL AUTO_INCREMENT,
	`anum` INT(11) NOT NULL,
	`id` VARCHAR(50) NOT NULL COLLATE 'euckr_korean_ci',
	`content` VARCHAR(1000) NOT NULL COLLATE 'euckr_korean_ci',
	`date` DATETIME NULL,
	PRIMARY KEY (`cnum`) USING BTREE,
	INDEX `anum` (`anum`) USING BTREE,
	CONSTRAINT `anum` FOREIGN KEY (`anum`) REFERENCES `naver`.`in_answer` (`anum`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='euckr_korean_ci'
ENGINE=InnoDB
;


