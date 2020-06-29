
<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%
	List<Article> articles = (List<Article>) request.getAttribute("articles");
%>

<body>
	<h2 class = "con">게시물 리스트</h2>
	
	<div class="con table-box">
		<table border ="1px">
			
			<thead>
				<tr>
					<th class ="id">ID</th>
					<th class = "col">등록날짜</th>
					<th class = "col">갱신날짜</th>
					<th class = "title">제목</th>
				</tr>
			</thead>
			<tbody>
			<%
				for (Article article : articles) {
			%>
			<tr>
				<td class ="id"><%=article.getId()%></td>
				<td class = "col"><%=article.getRegDate()%></td>
				<td class = "col"><%=article.getUpdateDate()%></td>
				<td class = "title text-align-left"><a href="./detail?id=<%=article.getId()%>"><%=article.getTitle()%></a></td>
			</tr>
			<%
				}
			%>
			</tbody>
			
		</table>
		</div>
<%@ include file="/jsp/part/foot.jspf" %>