<%@ page  contentType="text/html; charset=EUC-KR"%>

<%
	request.setCharacterEncoding("EUC-KR");
	
	String stotalPrice = request.getParameter("totalPrice");//결재금액
	int totalPrice = Integer.parseInt(stotalPrice);//결재금액 숫자로 전환
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
<title>결제시스템</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
    <script>
    
    var payMe = "<%=payMe%>";
    var paid_amount =0;
    var apply_num=0;

    if(payMe  == "무통장입금"){
        alert(" [ 농협 00000-00000-0000 네이버몰 ]로 [ <%=totalPrice%>원 ]을 입금하여주세요");
        
        <%--int paid_amount =0;--%>
       
       location.href = "orderProc2.jsp?apply_num=0&paid_amount=<%=totalPrice%>&ordPhone=<%=ordPhone%>&payMe=<%=payMe%>&payName=<%=payName%>&zipcode=<%=zipcode%>&devAddress=<%=devAddress%>&devName=<%=devNa%>&devPhone=<%=devPhone%>";
        	}else{
    $(function(){
    	alert("<%=payMe%>");
        var IMP = window.IMP; // 생략가능
        IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        
        IMP.request_pay({
            pg : 'inicis',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '주문명:결제테스트',
            amount : <%=totalPrice%>,
       		buyer_email : '<%=email%>', 
            buyer_name : '<%=payName%>',
            buyer_tel : '<%=ordPhone%>',
            buyer_addr : '<%=devAddress%>',
            buyer_postcode : '123-456',
            m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if (rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                //alert(rsp.apply_num);
                location.href='<%=request.getContextPath()%>/hok/orderProc2.jsp?apply_num='+rsp.apply_num+'&paid_amount='+rsp.paid_amount+'&ordPhone=<%=ordPhone%>&payMe=<%=payMe%>&payName=<%=payName%>&zipcode=<%=zipcode%>&devAddress=<%=devAddress%>&devName=<%=devNa%>&devPhone=<%=devPhone%>';  
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                alert(msg);
                //실패시 이동할 페이지
                location.href="<%=request.getContextPath()%>/hok/sallList.jsp";
            }
        });
    });
    } 
    </script> 
</body>
</html>