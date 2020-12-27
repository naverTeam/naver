
CREATE TABLE tblProduct (
	proNum int(5) NOT NULL auto_increment  ,
	id char(20)  NULL,
   pwd char(20)  NULL,
   name varchar(20) NULL,
   email char(30) NULL,
   proAddress char(50) NULL,
   zipcode char(5) NULL,
   proPhone CHAR(40) NULL,
   proName varchar(20) NULL,
   proImg varchar(20) NULL,
   price INT NULL,
   proAm INT NULL,
   salAm INT NULL,
   stock INT NULL,
   bankNa varchar(20) NULL,
   accNo varchar(50) NULL,
   accHo varchar(20) NULL,
   proDetail TEXT NULL,
   proDay varchar(20) NULL,
   filename varchar(30) ,
	filesize int(11) ,
	PRIMARY KEY ( proNum )
)COLLATE='euckr_korean_ci';

CREATE TABLE tblOrder (
	ordNum int NOT NULL auto_increment,
	proNum int NULL  ,
	id char(20)  NULL,
   pwd char(20)  NULL,
   email char(30) NULL,
   ordPhone CHAR(50) NULL,
   ordAm INT NULL,
   payMe varchar(20) NULL,
   state varchar(10) NULL,
   payName varchar(20) NULL,
   devAddress char(50) NULL,
   zipcode char(5) NULL,
   devName varchar(20) NULL,
   devPhone CHAR(40) NULL,
   ordDay varchar(20) NULL,
   payDay varchar(20) NULL,
   PRIMARY KEY   ( ordNum )
)COLLATE='euckr_korean_ci';

CREATE TABLE tblMallAdmin (
	admin_id  varchar(20) NOT NULL  ,
	admin_pwd  varchar(20) NOT NULL ,
	bankNa varchar(20) NULL,
   accNo varchar(50) NULL,
   accHo varchar(20) NULL,	
	PRIMARY KEY       ( admin_id )
)COLLATE='euckr_korean_ci';

CREATE TABLE tblChk (
   num int(11) NOT NULL  auto_increment  ,
	proNum int NULL  ,                    
	ordNum int NULL  ,                
	ord_id varchar(20) NULL ,
	proName varchar(20) NULL , 
	subject varchar(50)  NULL ,
	content TEXT NULL ,    
	grade INT NULL ,
	pos smallint(7) unsigned,
	ref smallint(7) ,
	depth smallint(7) unsigned,
	regdate date,
	pass varchar(15) ,
	ip varchar(15),
	count smallint(7) unsigned ,
	filename varchar(30) ,
	filesize int(11) ,
	PRIMARY KEY ( num )
   
)COLLATE='euckr_korean_ci';

CREATE TABLE tblAsk (
   num int(11) NOT NULL  auto_increment  ,
	proNum int NULL  ,                    
	pro_id char(20) NULL  ,                
	proPwd varchar(20)  NULL,
	id char(20) NULL , 
	pwd varchar(50)  NULL ,
	subject varchar(50)  NULL ,
	content TEXT NULL ,    
	pos smallint(7) unsigned,
	ref smallint(7) ,
	depth smallint(7) unsigned,
	regdate date,
	pass varchar(15) ,
	ip varchar(15),
	count smallint(7) unsigned ,
	filename varchar(30) ,
	filesize int(11) ,
	PRIMARY KEY ( num )
)COLLATE='euckr_korean_ci';

CREATE TABLE `tblBcomment` (
	`cnum` INT(11) NOT NULL AUTO_INCREMENT,
	`num` INT(11) NULL DEFAULT NULL,
	`name` VARCHAR(20) NULL DEFAULT NULL,
	`comment` VARCHAR(200) NULL DEFAULT NULL,
	`regdate` DATE NULL DEFAULT NULL,
	PRIMARY KEY (`cnum`)
)COLLATE='euckr_korean_ci';

CREATE TABLE tblZipcode (
 zipcode             char(7)              NOT NULL  ,
 area1               char(10)             NULL      ,
 area2               char(20)             NULL      ,
 area3               char(40)             NULL      ,
 area4               char(20)             NULL      
)COLLATE='euckr_korean_ci';tblorder

CREATE TABLE tblAccount (
 num int   AUTO_INCREMENT  ,
 proNum int NULL  ,  
 ordNum int NULL  ,                  
 pay INT NULL,                
 charge INT  NULL,
 remittance INT NULL,
 remDay varchar(20) NULL,navernavernavernaver
 proPhone CHAR(50) NULL,
 PRIMARY KEY (num)
)COLLATE='euckr_korean_ci';


