<%@
page import="java.io.*"
contentType="text/html;charset=euc-kr"
%>

<%
FileWriter test = new FileWriter
("C:/Jsp/naver/WebContent/blog/test.txt");
test.write("���ǼҰ�");
test.write("�̸�: �蹮��");
test.write("�����ϴ°��� : JSP");
test.close();
%>