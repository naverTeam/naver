<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="blog.BlogTemplate"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="blogMgr" class="blog.BlogMgr"/>
<jsp:useBean id="blogBean" class="blog.BlogBean"/>
<jsp:useBean id="cateMgr" class="blog.CateMgr"/>

<%
		request.setCharacterEncoding("EUC-KR");

		String id = (String) session.getAttribute("id");
		//��α׿� �ʿ��� jsp���� 4�� ����////////////////////////////////////////////////////////////////////////
		BlogTemplate btemp = new BlogTemplate();
		
		String blogTemplate = btemp.blogTemplate(id);
		String modifyTemplate = btemp.blogModifyTemplate(id);
		String settingTemplate = btemp.blogSettingTemplate(id);
		String postingTemplate = btemp.blogPostingTemplate(id);
		
		BufferedWriter createBlog = new BufferedWriter(
				new OutputStreamWriter(
						new FileOutputStream("C:/Jsp/naver/WebContent/blog/blog_"+id+".jsp"), "euc-kr"));
			createBlog.write(blogTemplate);
			createBlog.close();
			
		BufferedWriter createBlogModify = new BufferedWriter(
				new OutputStreamWriter(
						new FileOutputStream("C:/Jsp/naver/WebContent/blog/blog_"+id+"_modify.jsp"), "euc-kr"));
			createBlogModify.write(modifyTemplate);
			createBlogModify.close();

		BufferedWriter createBlogSetting = new BufferedWriter(
				new OutputStreamWriter(
						new FileOutputStream("C:/Jsp/naver/WebContent/blog/blog_"+id+"_setting.jsp"), "euc-kr"));
			createBlogSetting.write(settingTemplate);
			createBlogSetting.close();
		
		BufferedWriter createBlogPosting = new BufferedWriter(
				new OutputStreamWriter(
						new FileOutputStream("C:/Jsp/naver/WebContent/blog/blog_"+id+"_posting.jsp"), "euc-kr"));
			createBlogPosting.write(postingTemplate);
			createBlogPosting.close();
		///////////////////////////////////////////////////////////////////////////////////////////////
		//��α� ������ ������ blog ���̺�� category ���̺� ������Ʈ
		boolean flag = blogMgr.insertBlog(id);//��α� ���̺� �μ�Ʈ
		
		if(flag=true){
			cateMgr.insertBaseCategory(id);//ī�װ� ���̺� �μ�Ʈ
		}
			
		response.sendRedirect("blog_"+id+".jsp");
%>