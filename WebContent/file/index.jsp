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
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<p class="h3">파일 업로드</p>
			<!-- 파일 업로드 할때 form 엘리머트에 encrtpe 추가  -->
			<form name="f" method="post" enctype="multipart/form-data"
				action="./uploadfile.jsp">
				<div class="form-group row">
					<div class="col-sm-10">
						<input type="text" class="form-control" id="name" name="name" placeholder="이름">
					</div>
				</div>
				<div class="custom-file">
					<label for="file">Choose file to upload</label>
  					 <input type="file" id="file" name="file" multiple>
 
	
				</div>
				<div class="text-right">
					<button type="submit" id="uoloadfile" class="btn btn-outline-success">저장</button>
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
		$("#uoloadfile").click(function(e) {
			//자바스크립트 유효성 검사.
			f.submit();
		});

	});
</script>
