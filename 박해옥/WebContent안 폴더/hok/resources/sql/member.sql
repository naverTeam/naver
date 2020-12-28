
CREATE TABLE IF NOT EXISTS `navermember` (
  `id` char(20) NOT NULL,
  `pswd1` char(20) NOT NULL,
  `pswd2` char(20) NOT NULL,
  `name` char(20) NOT NULL,
  `birth_yy` char(4) NOT NULL,
  `birth_mm` char(2) NOT NULL,
  `birth_dd` char(2) NOT NULL,
  `gender` char(6) NOT NULL DEFAULT '0',
  `mobile` char(50) NOT NULL DEFAULT '0';

