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
						<option>이웃블로그
					</select>
					<div><a href="../joon/logout.jsp">로그아웃</a></div>
				</div>
			</div>
		</div>
		
		<div id="mainImgWrap">
			<div>메인이미지</div>
		</div>
		<div id="container">
		
			<div class="blog-conLeft">
				
				<div class="blog-profileWrap">
					<div class="blog-profileImg">
						<div>프사</div>
					</div>
					<div class="blog-profileId">					
						<div>아이디</div>
					</div>
					<div class="blog-profileDesc">
						<div>할 말</div>
					</div>
				</div>
				<div style="margin-top: 5px;">글쓰기</div>
				<div class="blog-postCategorys">					
					<form class="categoryFrm">
						<ul>
							<li class="pCategory"><strong>카테고리</strong></li>
							<li class="pCategory">
								<input type="submit" class="textbtn" name="category" value="IT"></li>
  							<li class="pCategory">
								<input type="submit" class="textbtn" name="category" value="취미"></li>						
  							<li class="pCategory">
								<input type="submit" class="textbtn" name="category" value="운동"></li>
						</ul>
					</form>
				</div>
				
			</div>
			
			<div class="blog-conRight">
			
				<div class="postWrap">
					<form name="postFrm" method="post" action="postingProc.jsp" enctype="multipart/form-data">
						<input type="text" name="title" style="font-size: 20px; width: 99%; height: 40px;"
									placeholder="제목을 입력하세요">
						<div style="display: flex; justify-content: flex-end;">
							<select name="category">
								<option>카테고리
								<option value="1">취미
								<option value="2">일상
							</select>
							<select name="topic">
								<option>주제
								<option value="1">IT
								<option value="2">요리
								<option value="3">여행
								<option value="4">예술
								<option value="5">스포츠
							</select>
						</div>
  						<textarea id="summernote" name="text"></textarea>
  						<input multiple="multiple" type="file" name="filename[]">
  						<input type="submit" value="저장">
  						<input type="hidden" name="bid" value="cjsgoddns">
					</form>
				</div>
				
			</div>			
		</div>
	</div>
</body>
<script>
$('#summernote').summernote({
        placeholder: '내용을 입력하세요',
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