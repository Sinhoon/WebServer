<%@ page pageEncoding="utf-8"%>

<%@ include file="inc/header.jsp"%>
<!-- breadcrumb start-->
<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="/index.jsp">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">Library</li>
	</ol>
</nav>
<!-- breadcrumb end-->

<!-- main start -->
<div class="container">
	<div class="row">
		<div class="col-sm-6 alert alert-primary" role="alert">A simple primary
			alert—check it out!</div>
		<div class="col-sm-6 alert alert-primary" role="alert">A simple secondary
			alert—check it out!</div></div>
	<div class="row">
		<div class="col-sm-6 alert alert-primary" role="alert">A simple
			success alert—check it out!</div>
		<div class="col-sm-6 alert alert-primary" role="alert">A simple danger
			alert—check it out!</div></div>
	<div class="row">
		<div class="col-sm-6 alert alert-primary" role="alert">A simple
			warning alert—check it out!</div>
		<div class="col-sm-6 alert alert-primary" role="alert">A simple info
			alert—check it out!</div></div>
	</div>
</div>
<!-- main end -->


<jsp:include page="inc/footer.jsp" />
