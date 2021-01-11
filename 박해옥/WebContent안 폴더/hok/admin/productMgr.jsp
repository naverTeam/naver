<%@page import="hok.UtilMgr"%>
<%@page import="com.mysql.jdbc.Util"%>
<%@page import="hok.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pMgr" class="hok.ProductMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	
	int totalRecord = 0;//총게시물수
	int numPerPage = 20;//페이지당 레코드 개수
	int pagePerBlock = 15;//블럭당 페이지 개수
	int totalPage = 0;//총 페이지 개수
	int totalBlock =0;//총 블럭 개수
	int nowPage = 1;//현재 페이지
	int nowBlock = 1;//현재 블럭
	
	
	
	//검색에 필요한 변수
	String keyField = "", keyWord = "";
	if(request.getParameter("keyWord")!=null){
	keyWord = request.getParameter("keyWord");
	}
	
	//검색 후에 다시 처음 리스트 요청
	if(request.getParameter("reload")!=null&&
		request.getParameter("reload").equals("true")){
		keyField =""; keyWord = ""; 
	}
	
	totalRecord = pMgr.getTotalCount(keyWord);
	 
	
	if(request.getParameter("nowPage")!=null){
		nowPage = UtilMgr.parseInt(request, "nowPage");
	}
	
	//sql문에 들어가는 start, cnt 선언
	int start = (nowPage*numPerPage)-numPerPage;
	int cnt = numPerPage;
	
	//전체 페이지 개수
	totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
	//전체 블럭 개수
	totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
	//현재 블럭
	nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
%>
<html>
<head>
<title> NaverMall Admin</title>
<script src="script.js"></script>
<script type="text/javascript">
function check() {
	if(document.searchFrm.keyWord.value==""){
		alert("검색어를 입력하세요.");
		document.searchFrm.keyWord.focus();
		return;
	}
	document.searchFrm.submit();
}

function list() {
	document.listFrm.action = "productMgr.jsp";
	document.listFrm.submit();
}


function pageing(page) {
	document.readFrm.nowPage.value=page;
	document.readFrm.submit();
}

function read(num) {
	document.readFrm.num.value = num;
	document.readFrm.action = "read.jsp";
	document.readFrm.submit();
}

function block(block) {
	document.readFrm.nowPage.value=<%=pagePerBlock%>*(block-1)+1;
	document.readFrm.submit();
}

</script>
</head>
<body bgcolor="#ECF6CE" topmargin="50">
<%@ include file="top.jsp" %>
<table width ="75%" align="center" bgcolor="#FFFF99"  >
	<tr>
		<td align="center" bgcolor="#FFFFCC">
		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
			<tr align="center" bgcolor="#04B431" >
				<td><font color="#FFFFFF">번호</font></td>
				<td><font color="#FFFFFF">상품이름</font></td>
				<td><font color="#FFFFFF">가    격</font></td>
				<td><font color="#FFFFFF">날    짜</font></td>
				<td><font color="#FFFFFF">재    고</font></td>
				<td><font color="#FFFFFF">email</td>
				<td>&nbsp;</td>
			</tr>
			<%
				Vector<ProductBean> vResult = pMgr.getProductList(start, cnt);
				if(vResult.size() == 0){
			%>
			<tr>
				<td align="center" colspan="6">등록되 상품이 없습니다. </td>
			</tr>
			<%} else {
					for(int i=0; i<vResult.size(); i++){
						ProductBean product =vResult.get(i);
			%>
				<tr align="center">
					<td><%=totalRecord-start-i%></td>
					<td><%=product.getProName() %></td>
					<td><%=UtilMgr.intFormat(product.getPrice()) %></td>
					<td><%=product.getProDay() %></td>
					<td><%=UtilMgr.intFormat(product.getStock()) %></td>
					<td><%=product.getEmail() %></td>
					<td>
					<a href="javascript:productDetail('<%=product.getProNum() %>')">상세보기</a>
					</td>
				</tr>	
			
			<%	}//for
				}//else
			%>
			<tr>
				<td colspan="6" align="center">
					<a href="productInsert.jsp">상품등록</a>
				</td>
			</tr>
		</table>
		</td>
	</tr>	
</table>
<table width="75%" align="center">
	<tr>
	<td width="80%" align="center">
	<!-- 페이징 및 블럭 Start -->
		<!-- 이전블럭 -->
		<%if(nowBlock>1){%>
			<a href="javascript:block('<%=nowBlock-1%>')">prev...</a>
		<%}%>
		<!-- 페이징 -->
		<%
				int pageStart = (nowBlock-1)*pagePerBlock+1;
				int pageEnd = (pageStart+pagePerBlock/*15*/)<totalPage?
						pageStart+pagePerBlock:totalPage+1;
				for(;pageStart<pageEnd;pageStart++){
		%>
		<a href="javascript:pageing('<%=pageStart%>')">
			<%if(nowPage==pageStart){%><font color="blue"><%}%>
				[<%=pageStart%>]
			<%if(nowPage==pageStart){%></font><%}%>
		</a>
		<%}//--for%>
		<!-- 다음블럭 -->
		<%if(totalBlock>nowBlock){%>
			<a href="javascript:block('<%=nowBlock+1%>')">...next</a>
		<%}%>
		<!-- 페이징 및 블럭 End -->
		</td width="20%">
		<td  align="right">
			<a href="javascript:list()">[처음으로]</a>
		</td>
	</td>
	</tr>
</table>
<form name="listFrm" method="post">
	<input type="hidden" name="reload" value="true">
	<input type="hidden" name="nowPage" value="1">
</form>

<form name="readFrm">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<input type="hidden" name="num">
</form>
<%@ include file="bottom.jsp" %>
<form name="detail" method="post" action="productDetail.jsp">
	<input type="hidden" name="proNum">
</form>
</body>
</html>