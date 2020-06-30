
<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<Article> articles = (List<Article>) request.getAttribute("articles");
%>
<link rel="stylesheet" href="/blog/resource/css/common.css" />
<link rel="stylesheet" href="/blog/resource/css/home/main.css" />
<script src="${pageContext.request.contextPath}/resource/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/home/main.js"></script>

<style>

.title{
	text-align:left;
	color:black;
}
.title > a{
	text-align:left;
	color:black;
}

h2 {
	text-align:center;
}

.table-box {
	display:flex;
	justify-content:center;
	align-items:center;
	width:100%;
	margin-top:30px;
}

.col {
	color:red;
}

table {
	border-collapse: collapse;
    line-height: 30px;
    border-left: none; 
   border-right: none;
   width:60%;
}

table .first-tr {
	border-top:2px solid #388e3c;
}

table td,th {

    border-bottom:1px solid silver;
    border-collapse: collapse;
    text-align: center;
    padding: 7px;
}


a:hover{
    text-decoration: underline;
}

.top-bar {
	background-color:#388e3c;
}

.boardName {
  align-items:center;
  display:flex;
  flex: 1, 0 , 0;
  width:50%;
  justify-content:flex-end;
  font-size:2.5rem;
  font-weight:bold;
  color:white;
}

.board {
  display:flex;
  flex:1, 0, 0 ;
  width:40%;
  font-size:1.1rem;
  align-items:flex-end;
  margin-bottom:50px;
  color:white;
}

.con {
  display:flex;
  flex-direction:column;
}

.text-box{
  width:60%;
  margin-bottom:20px;
   justify-content:space-between;
  display:flex;
}

.text-box2{
	width:100px;
}

.paging {
	margin-top:10px;
	font-size:0;
}

.paging > .num {
	border: 1px solid #388e3c;
	border-radius: 2000px;
}


.paging > a {
	padding: 5px 10px;
    display: inline-block;
    margin-left: 10px;
    font-size: 12px;
    color:black;
}

.head2 {
	height:100px;
	background-color:black;
}

.bd{
	text-align:center;
	color:black;
}
</style>
<body>
	
	 
  
  	<%@ include file="/jsp/part/head.jspf"%>
  	
  	<div class="head2"></div>
	
	<h1 class="bd">IT일반</h1>
	
	<div class="con table-box">
	 <div class="text-box">
    <div class="text-2">총 1건 / 금일 : 1건</div> 
    <div class="text-3"><input type="text"></div> 
		</div>
	
	
		<table>
			
			<thead>
				<tr class = "first-tr">
					<th class ="id">No</th>
					<th class = "col">카테고리</th>
					<th class = "title">제목</th>
					<th class = "writer">글쓴이</th>
					<th class = "regDate">작성시간</th>
					<th class = "views">조회수</th>
				</tr>
			</thead>
			<tbody>
			<%
				for (Article article : articles) {
			%>
			<tr>
				<td class ="id"><%=article.getId()%></td>
				<td class = "col">IT/일반</td>
				<td class = "title text-align-left"><a href="./detail?id=<%=article.getId()%>"><%=article.getTitle()%></a></td>
				<td class="writer">신성민</td>
				<td class="regDate"><%=article.getRegDate()%></td>
				<td class="views">1</td>
				
			</tr>
			<%
				}
			%>
			</tbody>
		</table>
		<div class="paging">
			<a class = "btn" href="">끝</a>
			<a class = "btn" href="">이전</a>
			<a class = "num" href="">1</a>
			<a class = "num" href="">2</a>
			<a class = "num" href="">3</a>
			<a class = "btn" href="">다음</a>
			<a class = "btn" href="">마지막</a>
		</div>
		</div>
		
		
		
<%@ include file="/jsp/part/foot.jspf" %>