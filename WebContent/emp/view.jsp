<%@page import="kr.co.acorn.dto.DeptDto"%>
<%@page import="kr.co.acorn.dao.DeptDao"%>
<%@ page pageEncoding="utf-8"%>

<%@ include file="../inc/header.jsp"%>
<!-- breadcrumb start-->
<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="/index.jsp">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">부서관리</li>
	</ol>
</nav>
<!-- breadcrumb end-->

<!-- main start -->
<%
	String tempPage = request.getParameter("page");
	String tempNo = request.getParameter("no");
	if (tempPage == null || tempPage.length() == 0) {
		tempPage = "1";
	}
	if (tempNo == null || tempPage.length() == 0) {
		response.sendRedirect("list.jsp?page=" + tempPage);
		return;
	}
	int cPage = 0;
	int no = 0;
	try {
		cPage = Integer.parseInt(tempPage);

	} catch (NumberFormatException e) {
		cPage = 1;
	}
	try {
		no = Integer.parseInt(tempNo);
	} catch (NumberFormatException e) {
		response.sendRedirect("list.jsp?page=" + cPage);
		return;
	}
	DeptDao dao = DeptDao.getInstance();
	DeptDto dto = dao.select(no);
	if (dto == null) {
		response.sendRedirect("list.jsp?page=" + tempPage);
		return;
	}
	String name = dto.getName();
	String loc = dto.getLoc();
%>
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<p class="h3">부서 상세보기</p>
			<form name="f" method="post">
				<div class="form-group row">
					<label for="no" class="col-sm-2 col-form-label">사원번호</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" id="no" name="no">
					</div>
				</div>
				<div class="form-group row">
					<label for="name" class="col-sm-2 col-form-label">이름</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="name" name="name">
					</div>
				</div>
				<div class="form-group row">
					<label for="job" class="col-sm-2 col-form-label">직책</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="job" name="job">
					</div>
				</div>
				<div class="form-group row">
					<label for="mgr" class="col-sm-2 col-form-label">사수</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" id="mgr" name="mgr">
					</div>
				</div>
				<div class="form-group row">
					<label for="sal" class="col-sm-2 col-form-label">월급</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" id="sal" name="sal">
					</div>
				</div>
				<div class="form-group row">
					<label for="comm" class="col-sm-2 col-form-label">상여금</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" id="comm" name="comm">
					</div>
				</div>
				<div class="form-group row">
					<label for="Deptno" class="col-sm-2 col-form-label">부서번호</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" id="Deptno"
							name="Deptno">
					</div>
				</div>
				<input type="hidden" name="page" value="<%=cPage%>" />
				<div class="text-right">
					<a href="list.jsp?page=<%=cPage%>"
						class="btn btn-outline-secondary">목록</a>
					<button type="button" id="updateEmp"
						class="btn btn-outline-success">수정</button>
					<button type="button" id="deleteEmp"
						class="btn btn-outline-danger">삭제</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- main end -->

<jsp:include page="../inc/footer.jsp" />

<script>
	$(function() {
		$("#no").focus();
		$("#updateEmp").click(function(e) {
			//자바스크립트 유효성 검사.
			e.preventDefault();
			if(!$("#no").val()){
				alert("사원 번호 입력하세요");
				$("#no").focus();
				return;
			}
			if(!$("#name").val()){
				alert("이름 입력하세요");
				$("#name").focus();
				return;
			}
			if($("#job").val().length == 0){
				alert("직책 입력하세요");
				$("#job").focus();
				return;
			}
			if($("#sal").val().length == 0){
				alert("월급 입력하세요");
				$("#sal").focus();
				return;
			}
		
			if($("#Deptno").val().length == 0){
				alert("부서번호 입력하세요");
				$("#Deptno").focus();
				return;
			}
		
			f.action = "update.jsp";
			f.submit();

		});

		$("#deleteEmp").click(function(e) {
			f.action = "delete.jsp";
			f.submit();
		});

	});
</script>
