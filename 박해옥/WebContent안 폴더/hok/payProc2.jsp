<%@ page  contentType="text/html; charset=EUC-KR"%>

<%
	request.setCharacterEncoding("EUC-KR");
	
	String stotalPrice = request.getParameter("totalPrice");//����ݾ�
	int totalPrice = Integer.parseInt(stotalPrice);//����ݾ� ���ڷ� ��ȯ
	String ordPhone = request.getParameter("ordPhone");
	String payMe = request.getParameter("payMe");
	String payName = request.getParameter("payName");
	String zipcode = request.getParameter("czipcode");
	String devAddress = request.getParameter("cdevAd1");
	String devAd2 = request.getParameter("cdevAd2");
	devAddress += "  "; devAddress += devAd2; 
	String devAd3 = request.getParameter("cdevAd3");
	devAddress += "  "; devAddress += devAd3; 
	String devNa = request.getParameter("devNa");
	String devPhone = request.getParameter("devPhone");
	String email = "phok75@naver.com";
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>�����ý���</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
    <script>
    
    var payMe = "<%=payMe%>";
    var paid_amount =0;
    var apply_num=0;

    if(payMe  == "�������Ա�"){
        alert(" [ ���� 00000-00000-0000 ���̹��� ]�� [ <%=totalPrice%>�� ]�� �Ա��Ͽ��ּ���");
        
        <%--int paid_amount =0;--%>
       
       location.href = "orderProc2.jsp?apply_num=0&paid_amount=<%=totalPrice%>&ordPhone=<%=ordPhone%>&payMe=<%=payMe%>&payName=<%=payName%>&zipcode=<%=zipcode%>&devAddress=<%=devAddress%>&devName=<%=devNa%>&devPhone=<%=devPhone%>";
        	}else{
    $(function(){
    	alert("<%=payMe%>");
        var IMP = window.IMP; // ��������
        IMP.init('iamport'); // 'iamport' ��� �ο����� "������ �ĺ��ڵ�"�� ���
        var msg;
        
        
        IMP.request_pay({
            pg : 'inicis',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '�ֹ���:�����׽�Ʈ',
            amount : <%=totalPrice%>,
       		buyer_email : '<%=email%>', 
            buyer_name : '<%=payName%>',
            buyer_tel : '<%=ordPhone%>',
            buyer_addr : '<%=devAddress%>',
            buyer_postcode : '123-456',
            m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if (rsp.success ) {
                //[1] �����ܿ��� �������� ��ȸ�� ���� jQuery ajax�� imp_uid �����ϱ�
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error�� �߻����� �ʵ��� �������ּ���
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //��Ÿ �ʿ��� �����Ͱ� ������ �߰� ����
                    }
                }).done(function(data) {
                    //[2] �������� REST API�� ��������Ȯ�� �� ���񽺷�ƾ�� �������� ���
                    if ( everythings_fine ) {
                        msg = '������ �Ϸ�Ǿ����ϴ�.';
                        msg += '\n����ID : ' + rsp.imp_uid;
                        msg += '\n���� �ŷ�ID : ' + rsp.merchant_uid;
                        msg += '\���� �ݾ� : ' + rsp.paid_amount;
                        msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num;
                        alert(msg);
                    } else {
                        //[3] ���� ����� ������ ���� �ʾҽ��ϴ�.
                        //[4] ������ �ݾ��� ��û�� �ݾװ� �޶� ������ �ڵ����ó���Ͽ����ϴ�.
                    }
                });
                //������ �̵��� ������
                //alert(rsp.apply_num);
                location.href='<%=request.getContextPath()%>/hok/orderProc2.jsp?apply_num='+rsp.apply_num+'&paid_amount='+rsp.paid_amount+'&ordPhone=<%=ordPhone%>&payMe=<%=payMe%>&payName=<%=payName%>&zipcode=<%=zipcode%>&devAddress=<%=devAddress%>&devName=<%=devNa%>&devPhone=<%=devPhone%>';  
            } else {
                msg = '������ �����Ͽ����ϴ�.';
                msg += '�������� : ' + rsp.error_msg;
                alert(msg);
                //���н� �̵��� ������
                location.href="<%=request.getContextPath()%>/hok/sallList.jsp";
            }
        });
    });
    } 
    </script> 
</body>
</html>