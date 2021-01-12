<%@page import="blog.BlogPostBean"%>
<%@page import="blog.CateBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="blogBean" class="blog.BlogBean"/>
<jsp:useBean id="blogMgr" class="blog.BlogMgr"/>
<jsp:useBean id="cateBean" class="blog.CateBean"/>
<jsp:useBean id="cateMgr" class="blog.CateMgr"/>
<jsp:useBean id="postMgr" class="blog.BlogPostMgr"/>
<jsp:useBean id="blogSetMgr" class="blog.BlogSettingMgr"/>
<%
		String id = "cjsgoddns";
		String sid = (String) session.getAttribute("id");
		blogBean = blogMgr.getBlogPage(id);
		String blogBanner = blogBean.getBannerImg();
		String blogProfileDesc = blogBean.getProfileDesc();
		String blogProfileImg = blogBean.getProfileImage();
		//���� �α����� ���� ���̵�� ��α׼����� ���̵� �������� ������
		//�� ��α��� ���� �������� �ѱ� (�������� ����)
		if(id!=sid&&!id.equals(sid))
			response.sendRedirect("blog_"+id+".jsp");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>blog</title>
	<link rel="stylesheet" href="./resources/css/blog_style.css">
	<script type="text/javascript" charset="EUC-KR" src="./resources/js/script.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
		function setBanner(event) {
			 
			var reader = new FileReader();
			reader.onload = function(event) {
				
				var bannerImg = document.getElementById("banner");
				bannerImg.setAttribute("style", "background-image: url("+event.target.result+"); background-size: 100% 100%;");
				//document.querySelector("div#image_container").appendChild(img);
			};
			reader.readAsDataURL(event.target.files[0]);
		}
		
		function setProfile(event) {
			
			var reader = new FileReader();
			reader.onload = function(event) {
				
				var profileImg = document.getElementById("profile");
				profileImg.setAttribute("style", "background-image: url("+event.target.result+"); background-size: 100% 100%;");
					//document.querySelector("div#image_container2").appendChild(img);
			};
			reader.readAsDataURL(event.target.files[0]);
		}
		 
		$(document).ready(function(){
			var fileTarget = $('.bannerChange');
			var fileTarget2 = $('.profileImgChange');
			
			fileTarget.on('change', function(){ // ���� ����Ǹ�
				if(window.FileReader){ // modern browser
					var filename = $(this)[0].files[0].name;
				} else { // old IE
					var filename = $(this).val().split('/').pop().split('\\').pop(); // ���ϸ� ����
					}
			
			var fileType=filename.substring(filename.length-3,filename.length); //����Ȯ���� ����
			var ktype2="";
			if(document.getElementById('disnone2').value!=null){
				var k2 = document.getElementById('disnone2').value;
				ktype2=k2.substring(k2.length-3,k2.length);
			}
			
			if(fileType=='jpg'||fileType=='png'){   //����Ȯ���� �˻��Ͽ� �̸����� ���� �ѱ�
				setBanner(event);
			}else{
				alert("�̹����� �����ϼ���!");
			}
			
			// ������ ���ϸ� ����
			$(this).siblings('.upload-name').val(filename);
			});
			
			fileTarget2.on('change', function(){ // ���� ����Ǹ�
				if(window.FileReader){ // modern browser
					var filename2 = $(this)[0].files[0].name;
				} else { // old IE
					var filename2 = $(this).val().split('/').pop().split('\\').pop(); // ���ϸ� ����
					}
				var fileType2=filename2.substring(filename2.length-3,filename2.length); //����Ȯ���� ����
				var  k = document.getElementById('disnone').value;
				var ktype=k.substring(k.length-3,k.length);
				
				if(fileType2=='jpg'||fileType2=='png'){   //����Ȯ���� �˻��Ͽ� �̸����� ���� �ѱ�
					setProfile(event);
				}else{
					alert("�̹����� �����ϼ���!");
				}
			
			// ������ ���ϸ� ����
			$(this).siblings('.upload-name2').val(filename2);
			});
			
			});
 </script>
</head>
<body>

	<div id="root">
		<div id="overlay" style="background-image: url('./resources/img/tutorImg.png');">
			<button class="overlayButton" onclick="overlaySleep()">�˰ڴ�</button>
		</div>
		<div id="blog-navBarWrap">
			<div class="blog-navbar">
				<div class="blog-navbar-left">
					<a href="../chu/index.jsp" style="width: 81px; height: 26px; margin-left: 18%;">
						<img src="./resources/img/logo-md.png" alt="img">
					</a> 
				</div>
				<div class="blog-navbar-right">
					<select>
						<option>�̿���α�
					</select>
					<div><a href="../member/logout.jsp">�α׾ƿ�</a></div> 
				</div>
			</div>
		</div>
		
		<form name="updateFrm" action="blog_settingProc.jsp" method="post" enctype="multipart/form-data" accept-charset="euc-kr">
		
		<div id="mainImgWrap" style="border: 5px solid yellow;">
			<div style="height: 100%;">
				<input type="file" name="bannerImg" id="banner" class="bannerChange" style="background-image: url('./data/<%=blogBanner %>'); background-size: 100% 100%;">
				<input type="hidden" class="upload-name" id="disnone">
			</div>
		</div>
		
		<div id="container">
		
			<div class="blog-conLeft">
				
				<div class="blog-profileWrap">
					<div class="blog-profileImg" style="border: 5px solid yellow;">
						<div style="width: 100%; height: 100%;">
							<input type="file" name="profileImg" id="profile" class="profileImgChange" style="background-image: url('./data/<%=blogProfileImg %>'); background-size: 100% 100%;">
							<input type="hidden" class="upload-name2" id="disnone2">
						</div>
					</div>
					<div class="blog-profileId">					
						<div>
							<span style="opacity: 0.5"><%=id %>���� ��α�</span>
						</div>
					</div>
					<div class="blog-profileDesc"  style="border: 5px solid yellow;">
						<div style="width: 100%; height: 100%;">
							<textarea name="profileDesc" class="descChange" placeholder="<%=blogProfileDesc %>"></textarea>
						</div>
					</div>
				</div>
				<%if(id!=null&&!id.equals("")){ %>
				<div style="margin-top: 5px;">
					<span style="opacity: 0.5">�۾���<small style="padding: 5px;"> / </small></span>
					<span style="opacity: 0.5">����</span>
				</div>
				<%} %>
				<div class="blog-postCategorys"  style="border: 5px solid yellow;">					
					
						<div id="categorys" style="padding-inline-start: 0px;">
							<div class="pCategory">
								<strong>ī�װ�</strong>
								
							</div>
							<%
									int count = blogSetMgr.getMaxCateNum(id);
									Vector<CateBean> cateVlist = new Vector<CateBean>();
									cateVlist = cateMgr.getBlogCategory(id);
									for(int i=0; i<cateVlist.size(); i++){
										cateBean = cateVlist.get(i);
										String cateName = cateBean.getBlogCateName();
										int cateNum = cateBean.getBlogCateNum();
							%>
							
							<div id="pCategory<%=cateNum%>">
								<input type="text" class="cateChange" name="category" value="<%=cateName%>">
								<input type="hidden" id="hideCNum" name="hideCNum" value="<%=cateNum%>">
								<input type="button" id="delButton<%=cateNum %>" value="����" onclick="delCategory('<%=cateNum%>')">
							</div>
							<%	} %>
							
							<input type="button" id="addButton<%=count %>" value="�߰�" onclick="addCategory('<%=count%>')" style="margin-left: 40%; margin-top: 5px;">
							<div id="delFrm"></div>
						</div>
					
				</div>
				
			</div>
			
			<div class="blog-conRight">
				<input type="submit" value="�����Ϸ�">
				<input type="button" value="�������" onclick="javascript:location.href='blog_<%=id%>.jsp'">
			</div>		
				
		</div>
		</form>
	</div>
	
</body>
<script type="text/javascript">
function addCategory(count) {
	
	addFrm = document.getElementById("categorys");
	addBtn = document.getElementById("addButton"+count);
	addFrm.removeChild(addBtn);
	
	count++;
	
	addedDiv = document.createElement("div");
	addedDiv.setAttribute("id","pCategory"+count);
	
	addedInput = document.createElement("input");
	addedInput.setAttribute("class","cateChange");
	addedInput.setAttribute("name","category");
	addedInput.setAttribute("placeholder","�� ī�װ�");
	
	addedHide = document.createElement("input");
	addedHide.setAttribute("type","hidden");
	addedHide.setAttribute("id","hideCNum");
	addedHide.setAttribute("name","hideCNum");
	addedHide.setAttribute("value", count);
	
	addedBtn = document.createElement("input");
	addedBtn.type = "button";
	addedBtn.setAttribute("onclick","delCategory("+count+")");
	addedBtn.setAttribute("value","����");
	
	addedAddBtn = document.createElement("input");
	addedAddBtn.type="button";
	addedAddBtn.setAttribute("onclick", "addCategory("+count+")");
	addedAddBtn.setAttribute("id", "addButton"+count);
	addedAddBtn.setAttribute("style", "margin-left: 40%; margin-top: 5px;")
	addedAddBtn.setAttribute("value", "�߰�");
	
	addFrm.appendChild(addedDiv);
	addedDiv.appendChild(addedInput);
	addedDiv.appendChild(addedHide);
	addedDiv.appendChild(addedBtn);
	
	addFrm.appendChild(addedAddBtn);
	
}

function delCategory(count) {
	//delFrm = document.getElementById("categorys");
	alert("ī�װ� ���� �� �ش� ī�װ��� ������ ����Ʈ�� ��� �����˴ϴ�");
	delCate = document.getElementById("pCategory"+count);
	document.getElementById("categorys").removeChild(delCate);
	
	addFrm = document.getElementById("delFrm");
	
	addedHide1 = document.createElement("input");
	addedHide1.setAttribute("id","hideDelCNum");
	addedHide1.setAttribute("type","hidden");
	addedHide1.setAttribute("name","hideDelCNum");
	addedHide1.setAttribute("value", count);
	
	addFrm.appendChild(addedHide1);
	document.getElementById("categorys").appendChild(addFrm);
	//delFrm.removeChild(delCate);
}
</script>
</html>