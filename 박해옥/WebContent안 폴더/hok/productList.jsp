
<!-- productList.jsp -->
<%@page import="hok.UtilMgr"%>
<%@page import="hok.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pMgr" class="hok.ProductMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	
	int totalRecord = 0;//총게시물수
	int numPerPage = 3;//페이지당 레코드 개수
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
<title>NaverMall List</title>
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
	document.listFrm.action = "productList.jsp";
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
<body bgcolor="#ECF6CE" topmargin="100">
<%@include file="mainTop.jsp" %>

<%
Vector<ProductBean> pvlist=pMgr.getProductList1(keyWord, start, cnt);
int listSize = pvlist.size();
if(pvlist.isEmpty()){
	out.println("등록된 게시물이 없습니다.");
}else{
	%>
<table width="75%" align="center" bgcolor="#FFFF99">
  <tr bgcolor="#01DF3A"> 
  	<th><a href="../chu/index.jsp">naver홈</a></th>
    <th><%=log%></th>
    <th><%=reg%></th>
    <form name = "searchFrm">
    <th align="center" valign="bottom">
   		<input size="16" name="keyWord">
   		<input type="button" style="background-color:#E0F2F7" value="검색" onClick="javascript:check()">
   		<input type="hidden" name="nowPage" value="1">
  	</th>
  	</form>
    <th><a href="productList.jsp">상품목록</a></th>
    <th><a href="cartList.jsp">장바구니</a></th>
    <th><a href="orderList.jsp">구매목록</a></th>
  </tr>
</table>
	<%
	for(int i=0;i<numPerPage/*10*/;i++){
		if(i==listSize) break;
		ProductBean pbean = pvlist.get(i);
		int count = pbean.getCount();//조회수
%>
<table width="75%" align="center" bgcolor="#FFFF99" border="1">
<tr align="center">
<td width="20%" >
<%=totalRecord-start-i%>&nbsp;
<img src="data/<%=pbean.getProImg() %>" height="100" width="150">
</td>
<td width="50%" valign="top" >
<table>
<tr>
<td><b>상품이름 :<%=pbean.getProName()%> </b></td>
</tr> 
<tr>
<td><b>가 격: <%=UtilMgr.monFormat(pbean.getPrice()) %></b>원</td>
</tr>
<tr>
<td><b>재고수량:<%=UtilMgr.monFormat(pbean.getStock()) %> </b></td>
</tr>
<tr>
<td><input type="button" value="상세보기" style="background-color:#E0F2F7" 
onclick="productDetail('<%=pbean.getProNum()%>')">
</td>
</td>
</tr>
</table>
</td>
<td width="30%" valign="top" align="left">
<b> 평점 : </b><br/>
<b>등록일 :<%=pbean.getProDay()%> </b><br/>
<b>조회수:<%=count%> </b>
</td>
	<%}//for
	}//else%>
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
<form name="detail" method="post" action="productDetail.jsp">
<input type="hidden" name="proNum">
</form>
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
</body>
</html>