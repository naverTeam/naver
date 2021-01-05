<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="bean" class="member.MemberBean"/>
<jsp:useBean id="mgr" class="member.MemberMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String findPwd = mgr.findPwd(id, name, phone);
%>

<!doctype html>
<html>
<head>
	<title>ID �ߺ�üũ</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script> 
 
    <style>
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
	</style>
</head>
<body>
<!-- The Modal -->
    <div id="myModal" class="modal">

      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center; line-height: 1.5;"><br /></p>
                <%if(findPwd!=null&&!findPwd.equals("")){ %>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">��й�ȣ�� <font color="green"><%=findPwd%></font> �Դϴ�.</span></p>
                <%} else { %>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">��й�ȣ�� ã�� �� �����ϴ�</span></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">���̵�� �̸�, �޴���ȭ��ȣ�� Ȯ���ϼ���</span></p>
                <%} %>
                <p style="text-align: center; line-height: 1.5;"><br /></p>
                <p><br /></p>
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt;" >
                     �ݱ�
                </span>
            </div>
      </div>
 
    </div>
        <!--End Modal-->

</body>
    <script type="text/javascript">
      
        jQuery(document).ready(function() {
                $('#myModal').show();
        });
        //�˾� Close ���
        function close_pop(flag) {
             $('#myModal').hide();
             location.href="find_id.jsp";
        };
        
      </script>
</html>