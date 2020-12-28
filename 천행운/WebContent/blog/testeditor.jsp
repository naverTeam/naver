<%@
page import="java.io.*"
contentType="text/html;charset=euc-kr"
%>

<%
FileWriter test = new FileWriter
("C:/Jsp/naver/WebContent/blog/test.txt");
test.write("나의소개");
test.write("이름: 김문정");
test.write("좋아하는과목 : JSP");
test.close();
%>