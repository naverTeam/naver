<%@ page contentType="text/html; charset=EUC-KR"%>

<%
		request.setCharacterEncoding("EUC-KR");
		String id = "cjsgoddns";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>blog</title>
	<link rel="stylesheet" href="./resources/css/blog_style.css">
	<script type="text/javascript" src="./resources/js/script.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
    
</head>
<body>
	<div id="root">
		
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
					<div><a href="../joon/logout.jsp">�α׾ƿ�</a></div>
				</div>
			</div>
		</div>
		
		<div id="mainImgWrap">
			<div>�����̹���</div>
		</div>
		<div id="container">
		
			<div class="blog-conLeft">
				
				<div class="blog-profileWrap">
					<div class="blog-profileImg">
						<div>����</div>
					</div>
					<div class="blog-profileId">					
						<div>���̵�</div>
					</div>
					<div class="blog-profileDesc">
						<div>�� ��</div>
					</div>
				</div>
				<div style="margin-top: 5px;">�۾���</div>
				<div class="blog-postCategorys">					
					<form class="categoryFrm">
						<ul>
							<li class="pCategory"><strong>ī�װ�</strong></li>
							<li class="pCategory">
								<input type="submit" class="textbtn" name="category" value="IT"></li>
  							<li class="pCategory">
								<input type="submit" class="textbtn" name="category" value="���"></li>						
  							<li class="pCategory">
								<input type="submit" class="textbtn" name="category" value="�"></li>
						</ul>
					</form>
				</div>
				
			</div>
			
			<div class="blog-conRight">
			
				<div class="postWrap">
					<form name="postFrm" method="post" action="postingProc.jsp" enctype="multipart/form-data">
						<input type="text" name="title" style="font-size: 20px; width: 99%; height: 40px;"
									placeholder="������ �Է��ϼ���">
						<div style="display: flex; justify-content: flex-end;">
							<select name="category">
								<option>ī�װ�
								<option value="1">���
								<option value="2">�ϻ�
							</select>
							<select name="topic">
								<option>����
								<option value="1">IT
								<option value="2">�丮
								<option value="3">����
								<option value="4">����
								<option value="5">������
							</select>
						</div>
  						<textarea id="summernote" name="text"></textarea>
  						<input multiple="multiple" type="file" name="filename[]">
  						<input type="submit" value="����">
  						<input type="hidden" name="bid" value="cjsgoddns">
					</form>
				</div>
				
			</div>			
		</div>
	</div>
</body>
<script>
$('#summernote').summernote({
        placeholder: '������ �Է��ϼ���',
        tabsize: 2,
        height: 120,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
</script>  
</html>