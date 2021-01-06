<%@page import="in.QuestionBean"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		int qnum=0;
		if(request.getParameter("qnum")!=null){
		qnum = Integer.parseInt(request.getParameter("qnum"));
		}
		String id = (String)session.getAttribute("id");
	  QuestionBean bean = (QuestionBean)session.getAttribute("bean");
	 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����ϱ�</title>
<link href="header.css" rel="stylesheet" type="text/css">
<style>



input[type="radio"] {
    display:none;
}
input[type="radio"]:hover +  label span{
 border:2px solid #40c700;
}
input[type="radio"] + label span {
    display:inline-block;
    width:19px;
    height:19px;
    margin:-2px 10px 0 0;
    vertical-align:middle;
    border:2px solid gray;
    cursor:pointer;
}
input[type="radio"]:checked + label span {
 border:2px solid #40c700;
    background:url(img/check.jpg) top no-repeat;
    background-size: cover;
}
input[type="radio"]:checked + label{
color:#40c700;
font-weight: bold;
}

#body{
background-color: #eee;
}
#title{
margin-left: 100px;
position: relative;
width: 900px;
height: 100%;
background-color:white;
margin: 30px auto;
border: 1px solid #aaa;
}
#titletext{
width: 590px;
height: 40px;
 position: absolute;
    top: 70px;
    left: 220px;
    border: 2px solid #888;
    
}
#titletext:focus {
	border: 2px solid #40c700;
	outline: none;
}
#textarea{
margin-left: 100px;
margin-top: 30px;
}
#ta{
background-color: aliceblue;
border: 2px solid #888;

}
#ta:focus{
border: 2px solid #40c700;
outline: none;
}
#next{
color:#40c700;
width: 100px;
height: 50px;
background-color:white;
border: 2px solid #777;
 border-radius: 7px;
 margin-bottom:50px;
 margin-left:300px;
 cursor: pointer;
}
#next:hover{
background-color: aliceblue;
}
#tag{
border: 1px solid #888;
width: 720px;
height: 100px;
display:none;
}
#tag:hover{
border: 2px solid #40c700;
}
#taglabel{
margin-left:20px;
font-weight: bold;
font-size: 20px;
}
#tagtext{
margin-top:30px;
width: 400px;
height: 30px;
}
#add{
background-color: white;
border: 1px solid #ccc;
width:80px;
height: 40px;
outline: none;
cursor: pointer;
}
#point{
border: 1px solid #888;
width: 720px;
height: 100px;
margin-top: 50px;
display:none;
}
#point:hover{
border: 2px solid #40c700;
}
#pointlabel{
margin-left:20px;
font-weight: bold;
font-size: 20px;
}
#pointtext{
margin-top:30px;
width: 400px;
height: 30px;
}
#addpoint{
background-color: white;
border: 1px solid #ccc;
width:80px;
height: 40px;
outline: none;
cursor: pointer;
}
#directory{
border: 1px solid #888;
width: 720px;
height: 310px;
margin-top: 50px;
display:none;
}
#directory:hover{
border:2px solid #40c700;
}
#directory label{
font-size: 20px;
}
#directory label:hover{
color:#40c700;
font-weight:bold;
}
#directory label:focus{
color:red;
}
radio:hover{
background-color: red;
}
#submit{
color:#40c700;
width: 100px;
height: 50px;
background-color:white;
border: 2px solid #777;
 border-radius: 7px;
 display:block;
 cursor: pointer;
 margin-left: 300px;
 margin-top: 50px;
 margin-bottom: 50px;
 display:none;
}
.fileimg{
width: 200px;
height: 200px;
border:3px solid white;
}
#debtn{
 width: 80px;
 height: 30px;
margin-left: 10px;
margin-bottom: 200px;
background-color: brown;
color:white;
border: 2px solid #888;
border-radius: 5px;
}
#debtn:hover{
background-color: orange;
cursor: pointer;
}
#debtn2{
 width: 80px;
 height: 30px;
margin-left: 10px;
margin-bottom: 200px;
background-color: brown;
color:white;
border: 2px solid #888;
border-radius: 5px;
}
#debtn2:hover{
background-color: orange;
cursor: pointer;
}
#filedata7{
	border:3px solid #40c700;
	width: 275px;
	height: 30px;
	}
	#filedata8{
	border:3px solid #40c700;
	width: 275px;
	height: 30px;
	}
#submit:hover{background-color: aliceblue;}
#image_container{display: none;}
#image_container2{display:none;}
#s1{float:left;width:33%;margin-left: 10px;margin-top: 20px;}
#s2{float:left;width:33%;margin-top: 20px;}
#s3{float:left;width:30%;margin-top: 20px;}

.filebox input[type="file"] {
 /* ���� �ʵ� ����� */ position: absolute;
  width: 1px; height: 1px; padding: 0;
   margin: -1px; overflow: hidden;
    clip:rect(0,0,0,0); border: 0; }
    
.filebox label {
 width:50px;
 display: inline-block;
 padding: .5em .75em;
 color: #40c700; font-size: inherit;
 line-height: normal;
 vertical-align: middle;
 background-color: #fdfdfd;
 cursor: pointer;
 border: 2px solid #777;
 border-radius: .25em; }
 
 .filebox label:hover{
 background-color: aliceblue;
 }
.filebox .upload-name {
 display: inline-block;
 padding: .5em .75em;
 /* label�� �е����� ��ġ */ font-size: inherit;
 font-family: inherit;
 line-height: normal;
 vertical-align: middle;
 background-color: #f5f5f5;
 border: 1px solid #ebebeb;
 border-bottom-color: #e2e2e2;
 border-radius: .25em;
 -webkit-appearance: none;
 /* ����Ƽ�� ���� ���߱� */ -moz-appearance: none;
 appearance: none; }
  
.filebox .upload-name2 {
 display: inline-block;
 padding: .5em .75em;
 /* label�� �е����� ��ġ */ font-size: inherit;
 font-family: inherit;
 line-height: normal;
 vertical-align: middle;
 background-color: #f5f5f5;
 border: 1px solid #ebebeb;
 border-bottom-color: #e2e2e2;
 border-radius: .25em;
 -webkit-appearance: none;
 /* ����Ƽ�� ���� ���߱� */ -moz-appearance: none;
 appearance: none; 	}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
function deleteT() {
	$(".td1").remove();
}
function deleteT2() {
	$(".td2").remove();
}
function setThumbnail(event) {
	 
	var reader = new FileReader();
	reader.onload = function(event) {
		
		var md = document.getElementById("mfile");
		md.style.height="400px";
		var view = document.getElementById("image_container");
		view.style.display="block";
		var view = document.getElementById("fileup2");
		view.style.display="block";
		
			var img = document.getElementById("imgtest");
			img.setAttribute("src", event.target.result);
			//document.querySelector("div#image_container").appendChild(img);
		 
		};
		reader.readAsDataURL(event.target.files[0]);
		}
 function setT() {
	 var md = document.getElementById("mfile");
		md.style.height="100px";
		var view = document.getElementById("image_container");
		view.style.display="none";
		var view = document.getElementById("fileup2");
		view.style.display="block";
}
 function setThumbnail2(event) {
		var reader = new FileReader();
		reader.onload = function(event) {
			var view = document.getElementById("image_container2");
			view.style.display="block";
			var md = document.getElementById("mfile");
			md.style.height="400px";
				var tt = document.getElementById("imgtest2");
				tt.setAttribute("src", event.target.result);
				//document.querySelector("div#image_container2").appendChild(img);
			 
			};
			reader.readAsDataURL(event.target.files[0]);
			}
 
 
 function setT2() {
	 var md = document.getElementById("mfile");
		md.style.height="100px";
		var view = document.getElementById("image_container2");
		view.style.display="none";
}
 
 
$(document).ready(function(){
	var fileTarget = $('.filebox .upload-hidden');
	var fileTarget2 = $('.filebox .upload-hidden2');
	$("input:radio[name='directory']:radio[value='<%=bean.getDirectory()%>']").prop('checked', true); // ī�װ� �����ϱ�
	
	fileTarget.on('change', function(){ // ���� ����Ǹ�
		if(window.FileReader){ // modern browser
			var filename = $(this)[0].files[0].name;
		} else { // old IE
			var filename = $(this).val().split('/').pop().split('\\').pop(); // ���ϸ� ����
			}
		$(".td1").remove();
		if(document.getElementById("filedata7")==null){
		var input1 = document.createElement('input');
		input1.setAttribute("type","text");
		input1.setAttribute("name","filedata");
		input1.setAttribute("id","filedata7");
		input1.setAttribute("placeholder","�̹��� �����Է�");
		var div1 = document.getElementById("image_container");
		div1.appendChild(input1);
		}
	var fileType=filename.substring(filename.length-3,filename.length); //����Ȯ���� ����
	var ktype2="";
	if(document.getElementById('disnone2').value!=null){
	var  k2 = document.getElementById('disnone2').value;
	 ktype2=k2.substring(k2.length-3,k2.length);
	}
	
	if(fileType=='jpg'||fileType=='png'){   //����Ȯ���� �˻��Ͽ� �̸����� ���� �ѱ�
		setThumbnail(event);
	}else{
		if(ktype2=='jpg'||ktype2=='png'){
			var view2 = document.getElementById("image_container");
			view2.style.display="none";
		}else{
		setT();
		}
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
		$(".td2").remove();
		if(document.getElementById("filedata8")==null){
			var input2 = document.createElement('input');
			input2.setAttribute("type","text");
			input2.setAttribute("name","filedata2");
			input2.setAttribute("id","filedata8");
			input2.setAttribute("placeholder","�̹��� �����Է�");
			var div2 = document.getElementById("image_container2");
			div2.appendChild(input2);
			}
		var fileType2=filename2.substring(filename2.length-3,filename2.length); //����Ȯ���� ����
		var  k = document.getElementById('disnone').value;
		var ktype=k.substring(k.length-3,k.length);
		
	
		
		if(fileType2=='jpg'||fileType2=='png'){   //����Ȯ���� �˻��Ͽ� �̸����� ���� �ѱ�
			setThumbnail2(event);
		}else{
			if(ktype=='jpg'||ktype=='png'){
					var view = document.getElementById("image_container2");
					view.style.display="none";
			}else{
			setT2();
			}
		}
	
	// ������ ���ϸ� ����
	$(this).siblings('.upload-name2').val(filename2);
	});
	
	});
	
window.onload = function () {  //�����ÿ��� next�Լ� �ٷ� ����
	next();
}
function next() {
	var e = document.getElementById("next");
	e.style.display = 'none';
	var e = document.getElementById("tag");
	e.style.display = 'block';
	var e = document.getElementById("directory");
	e.style.display = 'block';
	var e = document.getElementById("point");
	e.style.display = 'block';
	var e = document.getElementById("submit");
	e.style.display = 'block';
}
function dir(id) {
	var e = document.getElementById(id);
	e.style.color = '#40c700';
}
</script>
</head> 
<body>
<%@ include file="header.jsp" %>
<div id="body">  
<form id="Frm" method="post" action="question_up" enctype="multipart/form-data">
<input type="hidden" value="<%=id%>" name="id">
<hr style="margin-top:0px;margin-bottom: 20px;">
<div id="title">
<div>
<img  src="img/question.png" style="width: 40px;height: 40px;margin-top: 70px;
margin-left:100px;border-radius: 10px;">
<a style="font-size: 23px;color:#40c700;font-weight: 900;">����</a>
<input type="text" name="title" id="titletext" value="<%=bean.getTitle()%>">
</div>
<div id="textarea">
<textarea id="ta" rows="25" cols="99"
 name="content"><%=bean.getContent()%></textarea><br>
 
 <table>
<%if(bean.getFilename()!=null){%>
	<tr><td width="210px" style="padding-top: 50px;">
	
	<span class="td1">
	���� ���ϸ� : <%=bean.getFilename()%><br>
	<img class="fileimg" src="fileupload/<%=bean.getFilename()%>"
	 onclick="doImgPop('fileupload/<%=bean.getFilename()%>')"><br>
	 <%if(bean.getFiledata()!=null&&!bean.getFiledata().equals("")){ %>
	<%} %>
	</span>
	</td>
	<td width="200px" style="margin-top: -100px;"><button type="button" id="debtn" onclick="deleteT()" class="td1">Delete</button></td>
	<%} %>
	
	<%if(bean.getFilename2()!=null){%>
	<td style="padding-top: 50px;"  class="td2">
	
	<span  class="td2">
	���� ���ϸ� : <%=bean.getFilename2()%><br>
	<img  class="fileimg" src="fileupload/<%=bean.getFilename2()%>" 
	onclick="doImgPop('fileupload/<%=bean.getFilename2()%>')"><br>
	<%if(bean.getFiledata2()!=null&&!bean.getFiledata2().equals("")){ %>
	<%} %>
	</span>
	</td>
	<td  width="100px" style="margin-top: -100px;"><button type="button" id="debtn2" onclick="deleteT2()"  class="td2">Delete</button></td>
	<% }%>
	</tr></table>
	
	
<h2 style="margin-top: 50px;">���� �����ϱ�</h2>
<div id="mfile" style="width: 720px;height:100px;margin-bottom:50px;">

<div class="filebox" style="float: left;" > 
<input type="text" class="upload-name" value="���ϸ�" disabled="disabled" id="disnone">
<label for="ex_filename">���ε�</label> 
<input type="file" id="ex_filename" class="upload-hidden" name="filename1">
 <div id="image_container" style="width: 285px;height: 300px;">
 <img src="img/question.png" style="width: 285px;height: 300px;" id="imgtest">
<input type="text" name="filedata"  style="width: 275px;height:30px;border:3px solid #40c700;" placeholder="�̹��� �����Է�">
 
 </div>
 </div>
 
 <div class="filebox" style="float:right;" id="fileup2">
<input type="text" class="upload-name2" value="���ϸ�" disabled="disabled" id="disnone2">
<label for="ex_filename2">���ε�</label> 
<input type="file" id="ex_filename2" class="upload-hidden2" name="filename2">
 <div id="image_container2" style="width: 285px;height: 300px;">
 <img style="width: 285px;height: 300px;" id="imgtest2">
 <input type="text" name="filedata2"  style="width: 275px;height:30px;border:3px solid #40c700;" placeholder="�̹��� �����Է�">
 
</div>
</div>

</div>

<div id="tag">
<a id="taglabel">�±�</a> <input type="text" id="tagtext">
<input type="button" value="�߰�" id="add">
</div>

<div id="directory">
<h2 style="margin-left: 30px;">ī�װ�</h2>
<hr style="width: 80%;height: 3px;">
<span id="s1">
<input type="radio" id="1" name="directory" value="����,�й�">
<label for="1" id="l1"><span></span>����,�й�</label><br>
<input type="radio" id="2" name="directory" value="��ǻ�����">
<label for="2"><span></span>��ǻ�����</label><br>
<input type="radio" id="3" name="directory" value="����">
<label for="3"><span></span>����</label><br>
<input type="radio" id="4" name="directory" value="�������̸�Ʈ,����" >
<label for="4"><span></span>�������̸�Ʈ,����</label><br>
<input type="radio" id="5" name="directory" value="��Ȱ" >
<label for="5"><span></span>��Ȱ</label><br>
<input type="radio" id="6" name="directory" value="�ǰ�">
<label for="6"><span></span>�ǰ�</label><br>
<input type="radio" id="7" name="directory" value="��ȸ,��ġ" >
<label for="7"><span></span>��ȸ,��ġ</label><br>
</span>
<span id="s2">
<input type="radio" id="8" name="directory" value="����">
<label for="8"><span></span>����</label><br>
<input type="radio" id="9" name="directory" value="����">
<label for="9"><span></span>����</label><br>
<input type="radio" id="10" name="directory" value="������,����">
<label for="10"><span></span>������,����</label><br>
<input type="radio" id="11" name="directory" value="����" >
<label for="11"><span></span>����</label><br>
<input type="radio" id="12" name="directory" value="����,��ȥ" >
<label for="12"><span></span>����,��ȥ</label><br>
<input type="radio" id="13" name="directory" value="�ڵ���">
<label for="13"><span></span>�ڵ���</label><br>
<input type="radio" id="14" name="directory" value="����,���" >
<label for="14"><span></span>����,���</label><br>
</span>
<span id="s3">
<input type="radio" id="15" name="directory" value="�ȵ���̵���">
<label for="15"><span></span>�ȵ���̵���</label><br>
<input type="radio" id="16" name="directory" value="����� �׷�" >
<label for="16"><span></span>����� �׷�</label><br>
<input type="radio" id="17" name="directory" value="���� �Խ�,����">
<label for="17"><span></span>���� �Խ�,����</label><br>
<input type="radio" id="18" name="directory" value="�ڵ�������" >
<label for="18"><span></span>�ڵ�������</label><br>
<input type="radio" id="19" name="directory" value="����ϰ���" >
<label for="19"><span></span>����ϰ���</label><br>
<input type="radio" id="20" name="directory" value="���� ����,����">
<label for="20"><span></span>���� ����,����</label><br>
<input type="radio" id="21" name="directory" value="����Ʈ��">
<label for="21"><span></span>����Ʈ��</label><br>
</span>
</div>

<div id="point">
<a id="pointlabel">�߰�����</a> <input type="text" id="pointtext" name="point"  value="<%=bean.getPoint()%> (������ �����Ҽ� �����ϴ�.)" disabled>
<input type="button" value="�߰�" id="addpoint">
</div>

<input type="submit" id="submit" value="�����ϱ�">
</div><!-- title -->
 <input type='hidden' name="qnum" value="<%=qnum%>">
</form>
</div><!-- body -->
<button id="next" onclick="next()">����</button>









<!-- my menu -->
<span id="menutable" style="display:none" >
	<table>
	<tr>
	<th colspan="4" align="left" height="10px" width="280px">
	My Menu</th>
	</tr>
		<tr>
			<td>ī��</td>
			<td>��α�</td>
			<td>����</td>
			<td>����</td>
		</tr>
		<tr>
			<td>����</td>
			<td>����</td>
			<td>����Ʈ</td>
			<td>����</td>
		</tr>
		<tr>
			<td>����</td>
			<td>��ȭ</td>
			<td>����</td>
			<td>�ε���</td>
		</tr>
		<tr>
			<td>����</td>
			<td>����</td>
			<td>å</td>
			<td>������</td>
		</tr>
	</table>
</span>
<%@ include file="footer.jsp" %>
</body>
</html>