

<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%
	Article article = (Article) request.getAttribute("article");
%>
<link rel="stylesheet" href="css/common.css" />

<script src="${pageContext.request.contextPath}/resource/js/common.js"></script>

<!-- 하이라이트 라이브러리 추가, 토스트 UI 에디터에서 사용됨 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/highlight.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/styles/default.min.css">

<!-- 하이라이트 라이브러리, 언어 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/css.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/javascript.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/xml.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/php.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/php-template.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/sql.min.js"></script>

<!-- 코드 미러 라이브러리 추가, 토스트 UI 에디터에서 사용됨 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />

<!-- 토스트 UI 에디터, 자바스크립트 코어 -->
<script
	src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.js"></script>

<!-- 토스트 UI 에디터, 신택스 하이라이트 플러그인 추가 -->
<script
	src="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight-all.min.js"></script>

<!-- 토스트 UI 에디터, CSS 코어 -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />


<script
	src="${pageContext.request.contextPath}/resource/js/home/main.js"></script>

<style>
.con {
	display: flex;
	justify-content: center;
	margin-top: 30px;
	align-items: center;
	justify-content: space-between;
}

.title {
	font-weight: bold;
	font-size: 3rem;
}

.flex {
	display: flex;
}
</style>


<body>



	<nav class="con">
		<div class="title"><%=article.getTitle()%></div>
		<div class="id"><%=article.getId()%></div>
		<div class="regDate"><%=article.getRegDate()%></div>
		<div class="update"><%=article.getUpdateDate()%></div>
	</nav>

	<div id="origin1" style="display:none;"><%=article.getBody()%></div>
	<div class="id"><%=article.getId()%></div>
	<div id="viewer1"></div>
	<script>
		var editor1__initialValue = $('#origin1').html();
		var editor1 = new toastui.Editor({
			el : document.querySelector('#viewer1'),
			height : '800px',
			initialValue : editor1__initialValue,
			viewer : true,
			plugins : [ toastui.Editor.plugin.codeSyntaxHighlight ]
		});
	</script>




	<%@ include file="/jsp/part/foot.jspf"%>