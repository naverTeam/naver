<%@page import="java.util.ArrayList"%>
<%@page import="in.TagBean"%>
<%@page import="java.util.Vector"%>
<%@page import="member.MemberBean"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="in.QuestionMgr" />
<jsp:useBean id="bean" class="in.QuestionBean" />
<jsp:useBean id="tmgr" class="in.TagMgr" />
<%request.setCharacterEncoding("EUC-KR");

if(session.getAttribute("id")==null){
	
 response.sendRedirect("../member/login.jsp?returnPage=../in/naver_question.jsp");
}else{
  
String id = (String)session.getAttribute("id");
MemberBean mbean = mgr.memberRead(id);
Vector<TagBean> tlist = tmgr.getTag();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����ϱ�</title>
<link href="header.css" rel="stylesheet" type="text/css">
<style>

.tagBtn{
cursor:pointer;
 width :15px;
height:15px;
background:url("img/x.png");
background-size:15px 15px;
border:0;
outline:0;
margin-left: 5px;
}
.tagli{
float: left;
 margin-left: 20px;
 margin-top:10px;
 list-style: none;
font-size:20px;
}
#sharp{
position: absolute;
left:14px;
top:7px;
font-weight: bold;
color: #40c700;
}
#myInput{
width: 250px;
height: 30px;
padding-left: 30px;
}
.autocomplete {
  /*the container must be positioned relative:*/
  position: relative;
  display: inline-block;
  margin-top: 30px;
}
.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  top: 100%;
  left: 0;
  right: 0;
}
.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff;
  border-bottom: 1px solid #d4d4d4;
}
.autocomplete-items div:hover {
  background-color: #40c700;
  color:white;
}
.autocomplete-active {
  background-color: DodgerBlue !important;
  color: #ffffff;
}



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
height: 110px;
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
#submit:hover{background-color: aliceblue;}
#tagaddbtn{
color:#40c700;
width: 100px;
height: 50px;
background-color:white;
border: 2px solid #777;
 border-radius: 7px;
 display:block;
 cursor: pointer;
 margin-left: 370px;
 margin-top: -40px;
}
#tagaddbtn:hover{background-color: aliceblue;}
#fileup2{display: none;}
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
function delthis(obj) {
	$(obj).parent().remove();
}
function addTag() {
	var e = document.getElementById("myInput").value;
	document.getElementById("myInput").value = "";
	document.getElementById("myInput").focus();
	
	btn=document.createElement("button");
    btn.setAttribute("type","button");
    btn.setAttribute("class","tagBtn");
    btn.setAttribute("onclick","delthis(this);");
    
    h= document.createElement("input");
    h.setAttribute("type","hidden");
    h.setAttribute("name","tag");
    h.setAttribute("value", "#"+e);
    
     var t = document.getElementById("tag");
     
     if(document.getElementById("tagul")==null){     //ul�� �ѹ��� �����
     	  var s = document.createElement("ul");
        	t.appendChild(s);
     }else{
   	  var s = document.getElementById("tagul");
     }
     
     if(s.childElementCount<5){   //5������ �˻��� ���ϸ� ���� 
     var s1 = document.createElement("li");
     t.style.height="165px";
     s.id="tagul";
     s1.setAttribute("class","tagli");
     
     var span=document.createElement("span");
     
     span.style.backgroundColor="rgb(119,188,215,0.4)";
     span.style.color="#555";
     span.id ="spanid";
     span.innerHTML = "<b>#</b>"+e;
     
     
     s.appendChild(s1);        //ul�� li����
     s1.appendChild(span);   //li�� span ����
     s1.appendChild(btn);    //li�� btn ����
     s1.appendChild(h);
     }else{
   	  alert("�±״� 5�� ������ ���ð��� �մϴ�.");
     }
     
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
	
	fileTarget.on('change', function(){ // ���� ����Ǹ�
		if(window.FileReader){ // modern browser
			var filename = $(this)[0].files[0].name;
		} else { // old IE
			var filename = $(this).val().split('/').pop().split('\\').pop(); // ���ϸ� ����
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
	
function nextt(){
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
function titleCheck() {
	var e = document.getElementById("titletext");
	
	if(e.value.length<5){
		if(document.getElementById("textcheck")==null){
		var text = document.createElement("p");
		text.id = "textcheck";
		text.innerHTML="������ �ʹ� ª���ϴ�. (5�� �̻�)";
		text.style.color="brown";
		text.style.marginLeft="220px";
		document.querySelector("div#titlediv").appendChild(text);
		}
	}else{
		if(document.getElementById("textcheck")!=null){
			$("p").remove();
		}
	}
	
}
function pointcheck() {
	
	var e = document.getElementById("pointtext");
	if(e.value<=<%=mbean.getInPoint()%>){
		if(document.getElementById("pointcheck")==null){
		var text = document.createElement("p");
			text.id = "pointcheck";
			text.style.marginLeft="100px";
		}else{
			var text = document.getElementById("pointcheck");
		}
			text.style.color="#40c700";
			text.innerHTML="���� �Ǿ����ϴ�.";
			document.querySelector("div#point").appendChild(text);
	}else{
		if(document.getElementById("pointcheck")==null){
		var text = document.createElement("p");
		text.id = "pointcheck";
		text.style.marginLeft="100px";
		}else{
			var text = document.getElementById("pointcheck");
		}
		text.style.color="red";
		text.innerHTML="���� �������� �����ϴ�.";
		document.querySelector("div#point").appendChild(text);
	}
}
function checkAll() {
	if(!checkTitle(Frm.title.value)){  //���� �˻�
		return false;
	}
	if(!checkContent(Frm.content.value)){  //���� �˻�
		return false;
	}
	if(!checkDirectory(Frm.directory)){ //ī�װ� �˻�
		return false;
	}
	if(!checkPoint(Frm.point.value)){  //����Ʈ �˻�
		return false;
	}
	return true;
}
//�����Ͱ� �������� �˻�
function checkExistData(value,dataname) {
	if(value==""){
		alert(dataname+" �Է����ּ���.");
		return false;
	}
	return true;
}
//���� ���� �˻�
function checkTitle(title) {
		if(!checkExistData(title,"������"))
			return false;
	
		if(title.length<5){
		alert("������ �ʹ� ª���ϴ�.");
		return false;
		}
	return true;
}
function checkContent(con) {
	if(!checkExistData(con,"������"))
		return false;
	
	if(con.length<5){
		alert("������ �ʹ� ª���ϴ�.");
		return false;
	}
	return true;
}
function checkDirectory(dir) {
	for (var i = 0; i <dir.length; i++) {
		if(dir[i].checked==true){
			return true;
		}
	}
	alert("ī�װ��� ���� ���ּ���.");
	return false;
}
function checkPoint(p) {
	if(p<0){
		alert("������ �����Դϴ�.");
		return false;
	}
	if(p><%=mbean.getInPoint()%>){
		alert("���������� �����մϴ�.");
		return false;
	}
	return true;
}
function tag() {
	alert("test");
}
var countries = ["Afghanistan","Albania","Algeria","Andorra",
	"Angola","Anguilla","Antigua &amp; Barbuda",
	"Argentina","Armenia","Aruba"];
	
	
	
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<div id="body"> 
<form id="Frm" method="post" action="question"
 enctype="multipart/form-data" name="mFrm" onsubmit="return checkAll();">
<input type="hidden" value="<%=id%>" name="id">
<hr style="margin-top:0px;margin-bottom: 20px;">

<div id="title">

<div id ="titlediv">
<img  src="img/question.png" style="width: 40px;height: 40px;margin-top: 70px;
margin-left:100px;border-radius: 10px;">
<a style="font-size: 23px;color:#40c700;font-weight: 900;">����</a>
<input type="text" name="title" id="titletext" onblur="titleCheck()" maxlength="20" autocomplete="off">
</div>

<div id="textarea">
<textarea rows="20" cols="100" name="content" id="ta" placeholder="

     <%=id%>�� �������ּ���."></textarea>


<h2 style="margin-top: 50px;">���� ���ε�</h2>
<div id="mfile" style="width: 720px;height:100px;margin-bottom:50px;">

<div class="filebox" style="float: left;" > 
<input type="text" class="upload-name" value="���ϸ�" disabled="disabled" id="disnone">
<label for="ex_filename">���ε�</label> 
<input type="file" id="ex_filename" class="upload-hidden" name="filename1">
 <div id="image_container" style="width: 285px;height: 300px;">
 <img src="img/question.png" style="width: 285px;height: 300px;" id="imgtest">
 <input type="text"  autocomplete="off" name="filedata"  style="width: 275px;height:30px;border:3px solid #40c700;" placeholder="�̹��� �����Է�">
 </div>
 </div>
 
 <div class="filebox" style="float:right;" id="fileup2">
<input type="text" class="upload-name2" value="���ϸ�" disabled="disabled" id="disnone2">
<label for="ex_filename2">���ε�</label> 
<input type="file" id="ex_filename2" class="upload-hidden2" name="filename2">
 <div id="image_container2" style="width: 285px;height: 300px;">
 <img style="width: 285px;height: 300px;" id="imgtest2">
<input type="text" autocomplete="off"  name="filedata2" style="width: 275px;height:30px;border:3px solid #40c700;" placeholder="�̹��� �����Է�">
</div>
</div>

</div>
<button type="button" id="next" onclick="nextt()">����</button>



<div id="tag">
<a id="taglabel" style="margin-top: 20px;">�±�</a> 
<form  action="">
  <div class="autocomplete" style="width:300px;">
  <span id="sharp">#</span>
    <input id="myInput" type="text" name="myCountry" placeholder="Tag" autocomplete="off">
  </div>
  <button type="button" onclick="addTag()" id="tagaddbtn">�±� �߰�</button>
</form>
</div>

<%
ArrayList<String> tarr = new ArrayList<String>();
ArrayList<String> tarri = new ArrayList<String>();
for(int l =0;l<tlist.size();l++){
TagBean tbean = tlist.get(l);
tarr.add("'"+tbean.getTag()+"'");
tarri.add("'"+tbean.getTagInfo()+"'");
}%>

<script>

var tarr2 = <%=tarr%>;
var taginfo = <%=tarri%>;


function autocomplete(inp) {
	  var currentFocus;
	  
	  inp.addEventListener("input", function(e) {
	      var a, b, i, val = this.value;
	      closeAllLists();
	      if (!val) { return false;}
	      currentFocus = -1;
	      a = document.createElement("DIV")
	      a.setAttribute("id", this.id + "autocomplete-list");
	      a.setAttribute("class", "autocomplete-items");
	      this.parentNode.appendChild(a);   
	      
	      
	      for (i = 0; i <<%=tarr.size()%>; i++) {
	    	  
	      
	    	  if(a.childElementCount<10){   //10������ �˻��� ���ϸ� ���� 
	        if (tarr2[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
	          b = document.createElement("DIV");
	          
	          b.innerHTML = "# <strong>" + tarr2[i].substr(0, val.length) + "</strong>";
	          b.innerHTML += tarr2[i].substr(val.length);
	          b.innerHTML += "<a style='align:right;font-size:3px;color:#777'>__"+taginfo[i]+"</a>"
	          b.innerHTML += "<input type='hidden' value='" +tarr2[i] + "'>";
	      
	          btn=document.createElement("button");
	          btn.setAttribute("type","button");
	          btn.setAttribute("class","tagBtn");
	          btn.setAttribute("onclick","delthis(this);");
	          
	       
	          
	              b.addEventListener("click", function(e) {

	            	  inp.value = "";
	            	  inp.focus();
		              var t = document.getElementById("tag");
		              
		              if(document.getElementById("tagul")==null){     //ul�� �ѹ��� �����
		              	  var s = document.createElement("ul");
		                 	t.appendChild(s);
		              }else{
		            	  var s = document.getElementById("tagul");
		              }
		              
		              if(s.childElementCount<5){   //5������ �˻��� ���ϸ� ���� 
		              var s1 = document.createElement("li");
		              t.style.height="175px";
		              s.id="tagul";
		              s1.setAttribute("class","tagli");
		              
		              var span=document.createElement("span");
		              
		              span.style.backgroundColor="rgb(119,188,215,0.4)";
		              span.style.color="#555";
		              span.id ="spanid";
		              span.innerHTML = "<b>#</b>"+this.getElementsByTagName("input")[0].value;
		              
		              h= document.createElement("input");
			          h.setAttribute("type","hidden");
			          h.setAttribute("name","tag");
			          h.setAttribute("value", "#"+this.getElementsByTagName("input")[0].value);
		              
			          
		              s.appendChild(s1);        //ul�� li����
		              s1.appendChild(span);   //li�� span ����
		              s1.appendChild(btn);    //li�� btn ����
		              s1.appendChild(h);
		              }else{
		            	  alert("�±״� 5�� ������ ���ð��� �մϴ�.");
		              }
		              
		              closeAllLists();
		         	  });
	              
	              
	          a.appendChild(b);
	        }}
	      }
	  });
	  
	
	  inp.addEventListener("keydown", function(e) {
	      var x = document.getElementById(this.id + "autocomplete-list"); 
	      if (x) x = x.getElementsByTagName("div");
	      if (e.keyCode == 40) {
	        currentFocus++;
	        addActive(x);
	      } else if (e.keyCode == 38) { 
	        currentFocus--;
	        addActive(x);
	      } else if (e.keyCode == 13) {
	        e.preventDefault();
	        if (currentFocus > -1) {
	          if (x) x[currentFocus].click();
	        }
	      }
	  });
		
		
		
	  function addActive(x) {
	    if (!x) return false;
	    removeActive(x);
	    if (currentFocus >= x.length) currentFocus = 0;
	    if (currentFocus < 0) currentFocus = (x.length - 1);
	    x[currentFocus].classList.add("autocomplete-active");
	  }
	  
	  
	  
	  function removeActive(x) {
	    for (var i = 0; i < x.length; i++) {
	      x[i].classList.remove("autocomplete-active");
	    }
	  }
	  
	  
	  function closeAllLists(elmnt) {
	    var x = document.getElementsByClassName("autocomplete-items");
	    for (var i = 0; i < x.length; i++) {
	      if (elmnt != x[i] && elmnt != inp) {
	      x[i].parentNode.removeChild(x[i]);
	    }
	  }
	}
	  
	  
	document.addEventListener("click", function (e) {
	    closeAllLists(e.target);
	});
	}

autocomplete(document.getElementById("myInput"));
</script>
  
<div id="directory">
<h2 style="margin-left: 30px;">ī�װ�</h2>
<hr style="width: 80%;height: 3px;margin-left: 0px;">
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
<a id="pointlabel">�߰�����</a> <input type="text" onblur="pointcheck()"  id="pointtext" name="point" autocomplete="off" placeholder="���� �������� : <%=mbean.getInPoint()%>">
<input type="button" value="�߰�" id="addpoint" onclick="pointcheck()">
</div>
<input type="submit" id="submit" value="�����ϱ�">
</div><!-- title -->
</form>

</div><!-- body -->










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
			<tr>
		<td colspan="4" align="center" style="border-top: 1px solid #888;" onclick="location.href='logout.jsp'">�α׾ƿ�</td>
		</tr>
	</table>
</span>
<%@ include file="footer.jsp" %>
</body>
</html>
<%}%>