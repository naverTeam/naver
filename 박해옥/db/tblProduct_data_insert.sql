﻿INSERT INTO tblproduct (id, name, email, proAddress, zipcode, proPhone, proName, proImg 
, price, proAm, salAm, stock, bankNa, accNo, accHo, proDay, filename, filesize)
VALUES ('aaa', 'a상사', 'aaa@naver.com', '부산', '1111', '010-1111-1111', '장미1', 'rose1.PNG'
, 10000, 100, 0, 100, '부산은행', '1111', '장미1', '2020/12/25', 'a.txt', 497);
INSERT INTO tblproduct (id, name, email, proAddress, zipcode, proPhone, proName, proImg 
, price, proAm, salAm, stock, bankNa, accNo, accHo, proDay, filename, filesize)
VALUES ('bbb', 'b상사', 'bbb@naver.com', '부산2', '2222', '010-2222-2222', '장미2', 'rose2.PNG'
, 20000, 200, 0, 200, '하나은행', '2222', '장미2', '2020/12/25', 'b.txt', 497);
INSERT INTO tblproduct (id, name, email, proAddress, zipcode, proPhone, proName, proImg 
, price, proAm, salAm, stock, bankNa, accNo, accHo, proDay, filename, filesize)
VALUES ('ccc', 'c상사', 'ccc@naver.com', '부산3', '3333', '010-333-3333', '장미3', 'rose3.PNG'
, 30000, 300, 0, 300, '농협', '3333', '장미3', '2020/12/25', 'c.txt', 497);

UPDATE tblproduct 
SET proDetail ='다년간 경력을 가진 프로리스타가<br>
 직접 신선한 재로료 최상의 상품을 제작합니다. <br>
<img src="data/rose1.PNG" > '
WHERE proNum = 1 ;
  
UPDATE tblproduct 
SET proDetail ='다년간 경력을 가진 프로리스타가<br>
 직접 신선한 재로료 최상의 상품을 제작합니다. <br>
<img src="data/rose2.PNG" > '
WHERE proNum = 2 ;

UPDATE tblproduct 
SET proDetail ='다년간 경력을 가진 프로리스타가<br>
 직접 신선한 재로료 최상의 상품을 제작합니다. <br>
<img src="data/rose3.PNG" > '
WHERE proNum = 3 ;