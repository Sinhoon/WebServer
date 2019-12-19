<%@ page pageEncoding="utf-8" %>

<%@ include file ="../inc/header.jsp" %>
  <!-- breadcrumb start-->
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="/index.jsp">Home</a></li>
      <li class="breadcrumb-item active" aria-current="page">부서관리</li>
    </ol>
  </nav>
  <!-- breadcrumb end-->
 <% 
 	int cPage =0;
	String tempPage = request.getParameter("page");	
	if(tempPage==null | tempPage.length()==0){
		cPage =1;
	}
	try{
	cPage = Integer.parseInt(tempPage);
	}catch(NumberFormatException e){
		cPage= 1;
	}
  %>
  <!-- main start -->
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<p class="h3">부서 등록</p>
			<form name="f" method="post" action="./save.jsp">
				<div class="form-group row">
					<label for="no" class="col-sm-2 col-form-label">부서번호</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" id="no" name="no">
					</div>
				</div>
				<div class="form-group row">
					<label for="name" class="col-sm-2 col-form-label">부서이름</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="name" name="name">
					</div>	
				</div>
				<div class="form-group row">
					<label for="loc" class="col-sm-2 col-form-label">부서지역</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="loc" name="loc">
					</div>
				</div>
				<div class="text-right">
				<a href="list.jsp?page=<%=cPage%>" class="btn btn-outline-secondary">목록</a>
				<button type="submit" id="saveDept" class="btn btn-outline-success">저장</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- main end -->


<jsp:include page="../inc/footer.jsp" />

<script>
$(function(){
	$("#no").focus();
	$("#saveDept").click(function(e){
		//자바스크립트 유효성 검사.
		e.preventDefault();
		if(!$("#no").val()){
			alert("부서 번호 입력하세요");
			$("#no").focus();
			return;
		}
		if(!$("#name").val()){
			alert("부서 이름 입력하세요");
			$("#name").focus();
			return;
		}
		if($("#loc").val().length == 0){
			alert("부서 지역 입력하세요");
			$("#loc").focus();
			return;
		}
		
		f.submit();
	});
	
	
});

</script>
