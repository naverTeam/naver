<%@ page  contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
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
 position: absolute;
 top:800px;
 left:900px;
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
#submit:hover{
background-color: aliceblue;
}

#s1{float:left;width:33%;margin-left: 10px;margin-top: 20px;}
#s2{float:left;width:33%;margin-top: 20px;}
#s3{float:left;width:30%;margin-top: 20px;}
.filebox input[type="file"] {
 /* ���� �ʵ� ����� */ position: absolute;
  width: 1px; height: 1px; padding: 0;
   margin: -1px; overflow: hidden;
    clip:rect(0,0,0,0); border: 0; }
    
.filebox label {
 display: inline-block;
 padding: .5em .75em;
 color: #40c700; font-size: inherit;
 line-height: normal;
 vertical-align: middle;
 background-color: #fdfdfd;
 cursor: pointer;
 border: 2px solid #777;
 margin-bottom:120px;
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
 appearance: none; 
  margin-bottom:120px;}

</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	var fileTarget = $('.filebox .upload-hidden');
	
	fileTarget.on('change', function(){ // ���� ����Ǹ�
		if(window.FileReader){ // modern browser
			var filename = $(this)[0].files[0].name;
		} else { // old IE
			var filename = $(this).val().split('/').pop().split('\\').pop(); // ���ϸ� ����
			}
	// ������ ���ϸ� ����
	$(this).siblings('.upload-name').val(filename);
	});
	});
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
<form id="Frm" method="post" action="question" enctype="multipart/form-data">
<hr style="margin-top:0px;margin-bottom: 20px;">
<div id="title">
<div>
<img  src="img/question.png" style="width: 40px;height: 40px;margin-top: 70px;
margin-left:100px;border-radius: 10px;">
<a style="font-size: 23px;color:#40c700;font-weight: 900;">����</a>
<input type="text" name="title" id="titletext">
</div>
<div id="textarea">
<textarea id="ta" rows="25" cols="99"
 name="content" placeholder=" 
    
    �ñ��� ������ ������ �ּ���."></textarea><br>

<div class="filebox"> 
<input type="text" class="upload-name" value="���ϼ���" disabled="disabled">
<label for="ex_filename">���ε�</label> 
<input type="file" id="ex_filename" class="upload-hidden">
</div>

<div id="tag">
<a id="taglabel">�±�</a> <input type="text" id="tagtext">
<input type="button" value="�߰�" id="add">
</div>

<div id="directory">
<h2 style="margin-left: 30px;">ī�װ�</h2>
<hr style="width: 80%;height: 3px;">
<span id="s1">
<input type="radio" id="1" name="directory" value="����,�й�" name="directory">
<label for="1" id="l1"><span></span>����,�й�</label><br>
<input type="radio" id="2" name="directory" value="��ǻ�����" name="directory">
<label for="2"><span></span>��ǻ�����</label><br>
<input type="radio" id="3" name="directory" value="����" name="directory">
<label for="3"><span></span>����</label><br>
<input type="radio" id="4" name="directory" value="�������̸�Ʈ,����" name="directory">
<label for="4"><span></span>�������̸�Ʈ,����</label><br>
<input type="radio" id="5" name="directory" value="��Ȱ" name="directory">
<label for="5"><span></span>��Ȱ</label><br>
<input type="radio" id="6" name="directory" value="�ǰ�" name="directory">
<label for="6"><span></span>�ǰ�</label><br>
<input type="radio" id="7" name="directory" value="��ȸ,��ġ" name="directory">
<label for="7"><span></span>��ȸ,��ġ</label><br>
</span>
<span id="s2">
<input type="radio" id="8" name="directory" value="����" name="directory">
<label for="8"><span></span>����</label><br>
<input type="radio" id="9" name="directory" value="����" name="directory">
<label for="9"><span></span>����</label><br>
<input type="radio" id="10" name="directory" value="������,����" name="directory">
<label for="10"><span></span>������,����</label><br>
<input type="radio" id="11" name="directory" value="����" name="directory">
<label for="11"><span></span>����</label><br>
<input type="radio" id="12" name="directory" value="����,��ȥ" name="directory">
<label for="12"><span></span>����,��ȥ</label><br>
<input type="radio" id="13" name="directory" value="�ڵ���" name="directory">
<label for="13"><span></span>�ڵ���</label><br>
<input type="radio" id="14" name="directory" value="����,���" name="directory">
<label for="14"><span></span>����,���</label><br>
</span>
<span id="s3">
<input type="radio" id="15" name="directory" value="�ȵ���̵���" name="directory">
<label for="15"><span></span>�ȵ���̵���</label><br>
<input type="radio" id="16" name="directory" value="����� �׷�" name="directory">
<label for="16"><span></span>����� �׷�</label><br>
<input type="radio" id="17" name="directory" value="���� �Խ�,����" name="directory">
<label for="17"><span></span>���� �Խ�,����</label><br>
<input type="radio" id="18" name="directory" value="�ڵ�������" name="directory">
<label for="18"><span></span>�ڵ�������</label><br>
<input type="radio" id="19" name="directory" value="����ϰ���" name="directory">
<label for="19"><span></span>����ϰ���</label><br>
<input type="radio" id="20" name="directory" value="���� ����,����" name="directory">
<label for="20"><span></span>���� ����,����</label><br>
<input type="radio" id="21" name="directory" value="����Ʈ��" name="directory">
<label for="21"><span></span>����Ʈ��</label><br>
</span>
</div>

<div id="point">
<a id="pointlabel">�߰�����</a> <input type="text" id="pointtext" name="point" placeholder="���� �������� : 60">
<input type="button" value="�߰�" id="addpoint">
</div>

<input type="submit" id="submit" value="�����ϱ�">
</div><!-- title -->
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