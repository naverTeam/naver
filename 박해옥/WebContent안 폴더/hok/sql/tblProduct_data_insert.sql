INSERT INTO tblproduct (id, name, email, proAddress, zipcode, proPhone, proName, proImg 
, price, proAm, salAm, stock, bankNa, accNo, accHo, proDay, filename, filesize)
VALUES ('aaa', 'a���', 'aaa@naver.com', '�λ�', '1111', '010-1111-1111', '���1', 'rose1.PNG'
, 10000, 100, 0, 100, '�λ�����', '1111', '���1', '2020/12/25', 'a.txt', 497);
INSERT INTO tblproduct (id, name, email, proAddress, zipcode, proPhone, proName, proImg 
, price, proAm, salAm, stock, bankNa, accNo, accHo, proDay, filename, filesize)
VALUES ('bbb', 'b���', 'bbb@naver.com', '�λ�2', '2222', '010-2222-2222', '���2', 'rose2.PNG'
, 20000, 200, 0, 200, '�ϳ�����', '2222', '���2', '2020/12/25', 'b.txt', 497);
INSERT INTO tblproduct (id, name, email, proAddress, zipcode, proPhone, proName, proImg 
, price, proAm, salAm, stock, bankNa, accNo, accHo, proDay, filename, filesize)
VALUES ('ccc', 'c���', 'ccc@naver.com', '�λ�3', '3333', '010-333-3333', '���3', 'rose3.PNG'
, 30000, 300, 0, 300, '����', '3333', '���3', '2020/12/25', 'c.txt', 497);

UPDATE tblproduct 
SET proDetail ='�ٳⰣ ����� ���� ���θ���Ÿ��<br>
 ���� �ż��� ��η� �ֻ��� ��ǰ�� �����մϴ�. <br>
<img src="data/rose1.PNG" > '
WHERE proNum = 1 ;
  
UPDATE tblproduct 
SET proDetail ='�ٳⰣ ����� ���� ���θ���Ÿ��<br>
 ���� �ż��� ��η� �ֻ��� ��ǰ�� �����մϴ�. <br>
<img src="data/rose2.PNG" > '
WHERE proNum = 2 ;

UPDATE tblproduct 
SET proDetail ='�ٳⰣ ����� ���� ���θ���Ÿ��<br>
 ���� �ż��� ��η� �ֻ��� ��ǰ�� �����մϴ�. <br>
<img src="data/rose3.PNG" > '
WHERE proNum = 3 ;