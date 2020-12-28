<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("EUC-KR"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate">
<meta http-equiv="Cache-Control" content="post-check=0, pre-check=0">
<meta http-equiv="Pragma" content="No-Cache">

<title>회원탈퇴 안내 : 네이버 내정보</title>

<script type="text/javascript" src="/inc/common/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/out.css">
<link href="https://nid.naver.com/favicon_1024.png" rel="apple-touch-icon-precomposed" sizes="1024x1024" />
<script type="text/javascript" src="https://nid.naver.com/js/clickcr.js"></script>
<script type="text/javascript" src="/inc/common/js/lcs_nclicks.js"></script>
<script type="text/javascript" src="https://nid.naver.com/inc/common/js/ko/commonUtil.js?20170214"></script>
<script type="text/javascript" src="/inc/common/js/lua.js"></script>
<script type="text/javascript">
	var gnb_option = {
		gnb_service : "nid",
		gnb_template : "gnb_utf8",
		gnb_logout : encodeURIComponent("https://nid.naver.com/user2/help/myInfo.nhn?menu=home"),
		gnb_brightness : 1,
		gnb_one_naver : 1,
		gnb_item_hide_option : 0
	}

	lcs_do();

	function gnbClose(){
		$('#wrap').click(function(e){
			if( !$('#gnb').has(e.target).length ){
				gnbAllLayerClose();
			}
		});
	}
	//120919 win8 이슈 대응 : capslock 자동설정해제
	document.msCapsLockWarningOff = true;
	function setContainerHeight(height) {}
	function clearDocs(){}
</script>
<meta name="decorator" content="NEW_USER_MYINFO">
<script type="text/javascript">
var nsc = "my.info"+ "";
var ccsrv = "cc.naver.com";

</script>
</head>

<body onclick="clearDocs();gnbClose();" id="mainBody">
<div id="wrap">
	<!-- 스킵네비게이션 : 웹접근성대응-->
	<div id="u_skip">
<!-- [D] 주메뉴가 존재하는 페이지에 적용 -->
<a href="#lnb" onclick="document.getElementById('lnb_area').tabIndex=-1;document.getElementById('lnb_area').focus();return false;"><span>주메뉴로 바로가기</span></a>
<a href="#content" onclick="document.getElementById('content').tabIndex=-1;document.getElementById('content').focus();return false;"><span>본문으로 바로가기</span></a>
	</div>
	<!-- //스킵네비게이션 -->
	<div id="header">
		<div class="top">
			<h1>
				<a href="http://www.naver.com" target="_top" onclick="clickcr(this,'STA.naver','','',event);" class="link_logo"><span class="sptxt">NAVER</span><em></em></a>
				<a href="/user2/help/myInfo.nhn?lang=ko_KR" onclick="clickcr(this,'STA.my','','',event);" class="link_subtit "><span class="sptxt">내정보</span><em></em></a>
			</h1>
			<div class="gnb_area">
				<div id="gnb" class="gnb_one">
					<script type='text/javascript' charset='utf-8' src='https://static.nid.naver.com/template/gnb_utf8.nhn?2020. 12. 23'></script>
				</div>
			</div>
		</div>
		<div id="lnb_area">
			<div class="lnb">
	            <ul> 
					<li id="nid"><a href="/user2/help/myInfo.nhn?lang=ko_KR" onclick="clickcr(this,'LNB.myinfo','','',event);">회원정보<em></em></a></li>
					<li id="security"><a href="/user2/help/myInfo.nhn?m=viewSecurity&lang=ko_KR" onclick="clickcr(this,'LNB.protect','','',event);">보안설정<em></em></a></li>
				</ul>
			</div>
		</div>
<script type="text/javascript">
document.getElementById("nid").className = "selected";

var tagList = "nid security ";
var menu = "";
if(menu == "nid1_sub_m3" || menu.substring(0,4) == "nid2") { 
	menu = "security";
} else if( menu.substring(0,4) == "nid1" ) { 
	menu = "nid"; 
} else if( menu.substring(0,4) == "nid1" ) { 
	menu = "security"; 
} else if(menu == "" || menu == "null" || menu == null || tagList.indexOf(menu) == -1){
	menu = "nid";
} 

showMenu(menu);
function showMenu(subMenu) {
	document.getElementById(subMenu).className = "on";
	
	var otherMenu = tagList.replace(subMenu + " ", "").split(" ");
	for (var i = 0; i < otherMenu.length - 1; i++) {
		document.getElementById(otherMenu[i]).className = "";
	}
}
</script>	</div>

	<div id="container">
		<!-- CONTENTS -->
		<!-- CONTENTS -->
	<div id="content">
		<div class="c_header">
			<h2>탈퇴 안내</h2>
			<p class="contxt">회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
		</div>

		<!-- [D] input type="text"에 focus 되었을때 class에 on 추가 (ie6,ie7 대응) -->
		<div class="section_delete">
			<h3 class="h_dropout">
						     	  사용하고 계신 아이디(<em> </em>)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.
						     </h3>
			<p class="dropout_dsc">
						     	  <em>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가</em>하오니 신중하게 선택하시기 바랍니다.
						     </p>
			<h3 class="h_dropout">탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</h3>
			<p class="dropout_dsc">
						     	  회원정보 및 메일, 블로그, 주소록 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.<br>삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.
						     </p>
			<table cellspacing="0" border="1" summary="탈퇴 후 회원정보 및 개인형 서비스 이용기록 삭제 안내" class="tbl_type">
			<caption>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</caption>
			<colgroup>
			<col width="145"><col width="*">
			</colgroup>
			<tbody id="tblBullet1"> 
			<tr>
			<th scope="row">메일</th>
			<td>메일 계정 및 보관 중인 메일 삭제</td>
			</tr>
			<tr>
			<th scope="row">블로그</th>
			<td>블로그 계정 및 게시물 삭제</td>
			</tr>
            <tr>
                <th scope="row">포스트</th>
                <td>포스트 계정 및 게시물 삭제</td>
            </tr>
			<tr>
				<th scope="row">VIBE, 네이버뮤직</th>
				<td>
								이용약관 동의 철회, 플레이리스트, &#39;좋아요&#39;한 노래 등 삭제
							</td>
			</tr>

			<tr>
			<th scope="row">modoo!(모두)</th>
			<td>등록된 홈페이지 및 게시물 삭제</td>
			</tr>			
			<tr>
			<th scope="row">네이버 MYBOX</th>
			<td>저장된 파일 삭제 (탈퇴 전 관리페이지에서 다른 아이디로 이전 가능)</td>
			</tr>
			<tr>
			<th scope="row">포토캐스트</th>
			<td>저장된 앨범 및 사진 삭제</td>
			</tr>
			<tr>
			<th scope="row">주소록</th>
			<td>저장된 주소 삭제 및 주소 업데이트 중단</td>
			</tr>

			<tr>
			<th scope="row">가계부</th>
			<td>내 가계부 계정 및 비공개 게시글 가계내역 삭제</td>
			</tr>
			<tr>
			<th scope="row">애드포스트</th>
			<td>전환 신청 중이거나 지급 대기 중인 수입금을 포함한 잔여 수입 소멸</td>
			</tr>
			<tr>
			<th scope="row">해피빈</th>
			<td>정기결제 및 예약 신청한 펀딩 중단</td>
			</tr>
			<tr>
			<th scope="row">소셜게임</th>
			<td>블로그, 카페 설치 또는 참여한 정보 및 구매 아이템 삭제 (환불불가)</td>
			</tr>
			<tr>
			<th scope="row">온라인게임</th>
			<td>게임머니, 게임등급, 아이템, 캐릭터 등 게임플레이에 관한 모든 정보 삭제</td>
			</tr>
			<tr>
				<th scope="row">네이버 인증서</th>
				<td>인증서/이용이력 확인 불가</td>
			</tr>
			<tr>
				<th scope="row">네이버 전자문서</th>
				<td>네이버 전자문서(고지서, 안내문, 통지서 등) 수신 해지, 이용 또는 확인 불가</td>
			</tr>
			<tr>
			<th scope="row">네이버 페이</th>
			<td>이용내역, 보유 중인 할인 쿠폰 등 관련된 모든 정보 삭제, 포인트 소멸 및 약관 동의 철회</td>
			</tr>
			<tr>
				<th scope="row">네이버플러스 멤버십</th>
				<td>이용 내역 삭제 및 약관 동의 철회</td>
			</tr>
			<tr>
			<th scope="row">네이버 톡톡 파트너센터</th>
			<td>네이버 톡톡 대화목록, 대화상대를 포함한 모든 활동 정보 삭제</td>
			</tr>

			<tr>
				<th scope="row">선물함</th>
				<td>수락하지 않은 선물은 자동으로 취소되며 발신인에게 환불</td>
			</tr>
			<tr>
				<th scope="row">오디오클립</th>
				<td>구독 채널, 구매/대여한 오디오북, 최근 들은 클립, 북마크 내역 삭제</td>
			</tr>
			<tr>
			<th scope="row">이용권</th>
			<td>뮤직, 클라우드, 메시지, 북스토어, 오늘의신문, 뽀로로놀이교실 등 이용권 삭제</td>
			</tr>
            <tr>
                <th scope="row">인플루언서 검색</th>
                <td>인플루언서 홈 계정 및 게시물 삭제</td>
            </tr>
            <tr>
                <th scope="row">오픈캐스트</th>
                <td>운영 중인 캐스트 채널 및 구독 중인 캐스트 링크보관함 삭제</td>
            </tr>
            <tr>
                <th scope="row">그라폴리오</th>
                <td>게시판형 서비스의 댓글</td>
            </tr>
            <tr>
                <th scope="row">셀렉티브</th>
                <td>셀렉티브 계정 및 게시물 삭제</td>
            </tr>
			<tr>
				<th scope="row">시리즈</th>
				<td>구매내역(쿠키, 이용권 등) 삭제 및 구매 작품 열람 불가</td>
			</tr>
			<tr>
			<th scope="row">기타</th>
			<td>아이디에 연계된 개인적 영역의 정보 및 게시물 삭제</td>
			</tr>
			</tbody>
			</table>
			<div class="more_wrap"> 
               <a id="more_list1" class="btn_more">더보기</a> 
           </div> 
			<h3 class="h_dropout">탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</h3>
			<p class="dropout_dsc">뉴스, 카페, 지식iN 등에 올린 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.
			<br>
						     	  삭제를 원하는 게시글이 있다면 <em>반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.</em>
						     
			<br>
								탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다. <br>게시판형 서비스 중 "그라폴리오"의 댓글은 삭제됩니다.
							 
			</p>
			<table cellspacing="0" border="1" summary="탈퇴 후 게시판형 서비스에 등록한 게시물 유지 안내" class="tbl_type">
			<caption>탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</caption>
			<colgroup>
			<col width="145"><col width="*">
			</colgroup>
			<tbody id="tblBullet2"> 
			<tr>
			<th scope="row">지식iN</th>
			<td>질문, 답변, 의견, eXpert 리뷰, eXpert 평점 (단, 질문자/답변자 아이디가 비공개 처리됨)</td>
			</tr>
			<tr>
			<th scope="row">카페</th>
			<td>게시물 및 댓글</td>
			</tr>
			<tr>
			<th scope="row">뉴스</th>
			<td>댓글</td>
			</tr>
			<tr>
				<th scope="row">VIBE, 네이버뮤직</th>
				<td>
								게시물, 댓글, 게시글에 대한 &#39;좋아요&#39; 등
							</td>
			</tr>
			<tr>
			<th scope="row">가계부</th>
			<td>가계부 홈에 공개된 게시물 및 덧글</td>
			</tr>
			<tr>
			<th scope="row">해피빈</th>
			<td>콩저금통, 기부/저금/경매참여/나눔요청내역, 콩스토어 상품문의/후기 등</td>
			</tr>
			<tr>
			<th scope="row">웹툰, 웹소설</th>
			<td>게시물 및 댓글</td>
			</tr>
			<tr>
				<th scope="row">시리즈</th>
				<td>댓글</td>
			</tr>
            <tr>
                <th scope="row">셀렉티브</th>
                <td>댓글, 릴레이, 아이템/브랜드/장소/해시 태그</td>
            </tr>
			<tr>
				<th scope="row">오디오클립</th>
				<td>댓글 및 좋아요</td>
			</tr>
			<tr>
			<th scope="row">기타</th>
			<td>공적인 영역의 게시물, 댓글 및 의견</td>
			</tr>
			</tbody>
			</table>
           <div class="more_wrap"> 
               <a id="more_list2" class="btn_more">더보기</a> 
           </div> 
           
			<h3 class="h_dropout">네이버 아이디를 사용해 다른 서비스에 로그인 할 수 없게 됩니다.</h3>
			<p class="dropout_dsc">
				네이버 아이디로 로그인하여 사용 중이던 외부 사이트를 방문하여<br>
				<em>다른 로그인 수단을 준비하거나, 데이터를 백업한 후 네이버 회원을 탈퇴해야 합니다.</em>
			</p>
			<a id="lnk_external" class="btn_text_link">네이버 아이디로 로그인을 통해 연동된 사이트 확인</a>
           
			<form name="fm" id ="fm" method="post" action="/user2/help/leaveId.nhn?m=viewInputUserInfo">
				<input type="hidden" name="token_help" value="JxrHbKedEPcRqSl2" />
				<input type="hidden" name="lang" value="ko_KR" />
				<div class="dropout_agree_area">
					<p class="contxt">
						<strong>
						     	  탈퇴 후에는 아이디 <em> </em> 로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.
						     <br>
								 게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.<br>또한, 네이버 아이디를 사용해 다른 서비스에 로그인 할 수 없게 됩니다. 
							</strong>
					</p>
					<input type="checkbox" id="dropoutAgree" name="dropoutAgree" onclick="clickcr(this,'otn.guideagree','','',event);" >
					<label for="dropoutAgree"><strong>안내 사항을 모두 확인하였으며, 이에 동의합니다.</strong></label>
				</div>
				<div class="btn_area_w">
					<p class="btn_area">
						<a href="#99" id="btnNext" class="btn_model"><b class="btn3">확인</b></a>
					</p>
				</div>				
			</form>
		</div>
	</div>
	<hr />
<script type="text/javascript">
$(document).ready(function() {

    var rowCount1 = $('#tblBullet1').children('tr').length;
    var rowCount2 = $('#tblBullet2').children('tr').length;
    
	$("#tblBullet1 tr").hide();
	$("#tblBullet2 tr").hide();
	    
	if(rowCount1 > 5){
		$('#more_list1').show();
		$("#more_list1").parent().show();
	    $("#tblBullet1 tr:hidden").slice(0, 5).show();          
	}
	
	if(rowCount2 > 5){
		$('#more_list2').show();
		$("#more_list2").parent().show();
	    $("#tblBullet2 tr:hidden").slice(0, 5).show();
	}
	
	setContainerHeight(document.getElementById('content').clientHeight);
	
	$('#more_list1').css('cursor','pointer');
	$(document).on("click", "#more_list1", function(event){
		var currentLength = $("#tblBullet1 tr:visible").length;
		var rowCount1 = $('#tblBullet1').children('tr').length;
		if(rowCount1 > (currentLength + 5)){
			$("#tblBullet1 tr").slice(0, currentLength + 5).show();
		}else{
			$("#tblBullet1 tr").slice(0, rowCount1).show();
			$('#more_list1').hide();
			$("#more_list1").parent().hide();
		}
		
		setContainerHeight(document.getElementById('content').clientHeight);
	});	
	
	$('#more_list2').css('cursor','pointer');
	$(document).on("click", "#more_list2", function(event){
		var currentLength = $("#tblBullet2 tr:visible").length;
		var rowCount2 = $('#tblBullet2').children('tr').length;
		if(rowCount2 > (currentLength + 5)){
			$("#tblBullet2 tr").slice(0, currentLength + 5).show();
		}else{
			$("#tblBullet2 tr").slice(0, rowCount2).show();
			$('#more_list2').hide();
			$("#more_list2").parent().hide();
		}
		
		setContainerHeight(document.getElementById('content').clientHeight);
	});		
	
	$('#btnNext').css('cursor','pointer');
	$(document).on("click", "#btnNext", function(event){
		clickcr(this,'otn.guideconfirm','','',window.event);
		if( $("#dropoutAgree").is(":checked")){
			$("#fm").submit();
		}else{
			alert("탈퇴 안내를 확인하고 동의해 주세요.");
			$("#dropoutAgree").focus();
		}
	});	
	
	$('#lnk_external').css('cursor','pointer');
	$(document).on("click", "#lnk_external", function(event){
		rurl ="/user2/help/externalAuth.nhn?menu=security&lang=ko_KR";
		$("#lnk_external").attr("target","_blank");
		window.open(rurl);
	});	
	
});		
</script>
	</div>

	<div id="footer">
<ul class="policy_lst">


</ul>
<address>
	<a href="http://www.navercorp.com/" target="_blank"  onclick="clickcr(this,'fot.nhncorp','','',event);" class="logo">NAVER</a>

</address>

<script type="text/javascript" src="/inc/common/js/jquery.resize.js"></script>
<script type="text/javascript">
var ua = window.navigator.userAgent.toLowerCase();
var cur_container_height = Number(document.getElementById("content").clientHeight);
var min_container_height = 647;
var header_height = 140;
var footer_height = 85;

window.onload = changeContentSize; // Window 창 로드시
window.onresize = changeContentSize; // Window 창 크기를 조정할때마다
$("#content").resize(changeContentSize);

function changeContentSize() {
	cur_container_height = Number(document.getElementById("content").clientHeight);

	var container_height = min_container_height;
	var window_height = Number(document.documentElement.clientHeight) - header_height - footer_height;
	if (window_height > cur_container_height) {
		if (window_height > min_container_height) {
			container_height = window_height;
		}
	} else {
		if (cur_container_height > min_container_height) {
			container_height = cur_container_height;
		}
	}
	
    if (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) { // ie11 추가
        document.getElementById("container").style.height = container_height + "px";
    }else if (window.navigator.userAgent.indexOf("MSIE") == -1 || (document.all && window.XMLHttpRequest)) { // ie6 제외
        document.getElementById("container").style.height = container_height + "px";
    } else {
        document.getElementById("container").style.height ="100%";
    }
}

function setContainerHeight(height) {
	if (height >= 0) {
		cur_container_height = height;
	} else {
		cur_container_height = Number(document.getElementById("container").clientHeight);
	}
	
	if(height == -9 || height == 0 || height == "undefined"){ //공지사항 예외처리 //ie7대응
		document.getElementById("container").style.height ="100%";
	}else{
		changeContentSize();
	}
}
</script>	</div>
</div>

<script type="text/javascript">
getGNB();

window.onresize = function() {
	setContainerHeight(document.getElementById('content').clientHeight);
}
</script>
</body>
</html>
