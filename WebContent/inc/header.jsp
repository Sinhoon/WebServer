<%@page import="kr.co.acorn.dto.MemberDto"%>
<%@ page pageEncoding="utf-8"%>
<% String url = request.getRequestURI();
	String contextPath = request.getContextPath();

%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script> -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style>
a {
	text-decoration: none
}

.d-block w-100 {
	width: 100px !important;
	height: 200px;
}
</style>
<title>Our site</title>
</head>

<body>
	<!-- navbar start-->

	<%
		//  /dept/list.jsp , /emp/list.jsp
		String uri = request.getRequestURI();
	%>

	<nav class="navbar navbar-expand-lg navbar-dark"
		style="background-color: #563d7c">
		<a class="navbar-brand" href="<%=contextPath %>/index.jsp">Home</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarTogglerDemo02"
			aria-controls="navbarTogglerDemo02" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item <%if (uri.startsWith(contextPath+"/dept")) {%>active <%}%>">
					<a class="nav-link" href="<%=contextPath %>/dept/list.jsp?page=1">부서관리<span
						class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item <%if (uri.startsWith("/emp")) {%>active <%}%>">
					<a class="nav-link" href="<%=contextPath %>/emp/list.jsp?page=1">사원관리<span
						class="sr-only">(current)</span></a>
				</li>
				<li
					class="nav-item <%if (uri.startsWith("/crawling")) {%> active <%}%>">
					<a class="nav-link" href="<%=contextPath %>/crawling/list.jsp?">크롤링</a>
				<li
					class="nav-item <%if (uri.startsWith("/notice")) {%> active <%}%>">
					<a class="nav-link" href="<%=contextPath %>/notice/list.jsp?page=1">공지사항</a>
				</li>
				<li class="nav-item <%if (uri.startsWith("/file")) {%>active <%}%>">
					<a class="nav-link" href="<%=contextPath %>/file/index.jsp">파일업로드<span
						class="sr-only">(current)</span></a>
				</li>
			</ul>
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<%
					MemberDto memberDto = (MemberDto) session.getAttribute("member");
					if (memberDto == null) {
				%>
				<li class="nav-item"><a class="nav-link"
					href="<%=contextPath %>/member/write.jsp">회원가입<span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="<%=contextPath %>/member/login.jsp">로그인<span class="sr-only">(current)</span></a>
				</li>
				<%
					} else {
				%>
				<li class="nav-item"><a class="nav-link"
					href="#"> <%=memberDto.getName()%>님 환영합니다<span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="<%=contextPath %>/member/logout.jsp">로그아웃<span class="sr-only">(current)</span></a>
				</li>
				<%}%>

			</ul>

		</div>
	</nav>
	<!-- navbar end-->