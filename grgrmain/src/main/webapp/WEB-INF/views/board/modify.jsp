<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<!-- Meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Soft UI - Neumorphism Style UI Kit">
<meta name="author" content="kingstudio.ro">
<!-- Favicon -->
<link rel="icon"
	href="${pageContext.request.contextPath}/assets/images/favicon.png">
<!-- Site Title -->
<title>Soft UI - Neumorphism Style UI Kit</title>
<!-- Bootstrap 4 core CSS -->
<link
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom Styles -->
<link
	href="${pageContext.request.contextPath}/assets/css/nouislider.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/animate.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/css/owl.carousel.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/style.css"
	rel="stylesheet">
<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;600;800&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;600;800&display=swap"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/css/fontawesome-all.min.css"
	rel="stylesheet" type="text/css">
</head>

<body>
	<!-- 헤더 -->
	<jsp:include page="/WEB-INF/views/tiles/header.jsp" />
	<!-- 배너 -->
	<c:set var="boardName" value="자유게시판" />
	<header class="xl bg-img bg-fixed" style="background-image: url(/grgrmain/images/free2.jpg); background-size: cover;">
		<div class="container text-center">
			<h1 class="page-title">Free</h1>
			<p class="w-50 m-x-auto mb-30" style="color: white;"><c:out value="${boardName}" /></p>
		</div>
		<!-- / container -->
	</header>

	<div id="preloader">
		<div class="preloader">
			<span></span> <span></span>
		</div>
	</div>

	<div id="top"></div>
	<!-- / top -->

	<header class="xxl pb-30 bg-img bg-fixed"
		style="background-image: url(${pageContext.request.contextPath}/assets/images/placeholder.jpg)">

		<div class="container relative z-index-1">
			<h1 class="page-title text-left mb-15">상품 조회</h1>
			<nav class="breadcrumb relative z-index-1 pt-10 pl-5">
				<a class="breadcrumb-item" href="#x">Home</a> <a
					class="breadcrumb-item" href="/board/list">Market</a> <span
					class="breadcrumb-item active">Product</span>
			</nav>
		</div>
		<!-- / container -->
	</header>

	<section class="big page-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 tablet-lg-top-30 page-content">
					<div class="project-post">
						<div class="page-content">
							<div id="product-carousel" class="owl-carousel owl-theme">
								<img
									src="${pageContext.request.contextPath}/assets/images/placeholder-square.jpg"
									alt="" class="rounded-10"> <img
									src="${pageContext.request.contextPath}/assets/images/placeholder-square.jpg"
									alt="" class="rounded-10"> <img
									src="${pageContext.request.contextPath}/assets/images/placeholder-square.jpg"
									alt="" class="rounded-10">
							</div>
							<!-- / owl-carousel -->
						</div>
						<!-- / page-content -->
					</div>
					<!-- / project-post -->
				</div>
				<!-- / column -->

				<div class="col-lg-6 sidebar">
					<form id="modifyForm" action="/board/modify" method="post">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									제목 : <input type="text" class="form-control border-faded"
										name="productTitle" value="${pageInfo.productTitle}"
										placeholder="제목" style="font-weight: bold;">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									가격 : <input type="text" class="form-control border-faded"
										name="productPrice" value="${pageInfo.productPrice}"
										placeholder="가격" style="font-weight: bold;">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									상품 설명 :
									<textarea class="form-control border-faded"
										name="productContent" placeholder="상품 설명"
										style="height: 413px; font-weight: bold; resize: none;">${pageInfo.productContent}</textarea>
								</div>
							</div>
						</div>
					</form>
					<div class="col-md-12">
						<input type="hidden" name="productId"
							value="${pageInfo.productId}" />
						<button type="submit" class="btn btn-primary" id="modifyButton">수정</button>
						<form id="deleteForm" action="/board/delete" method="post">
							<input type="hidden" name="productId"
								value="${pageInfo.productId}" />
							<button type="button" class="btn btn-danger" id="deleteButton">삭제</button>
						</form>
					</div>
				</div>


				<!-- / column -->
			</div>
			<!-- / row -->


		</div>
		<!-- / container -->
	</section>


	<a href="#top" class="scroll-to-top is-hidden smooth-scroll"
		data-nav-status="toggle"><i class="fas fa-chevron-up"></i></a>

	<footer>
		<div class="container">
			<div class="row v-center mobile-center">
				<div class="col-md-4 footer-left-area tablet-top">
					<p>
						© 끼리끼리 by <a href="https://kingstudio.ro" target="_blank">옹기종기</a>
					</p>
				</div>
				<!-- / footer-left-area -->
				<div class="col-md-8 footer-right-area">
					<p>
						<a href="${pageContext.request.contextPath}/index.html"
							class="text-link mr-15">Home</a> <a
							href="${pageContext.request.contextPath}/components.html"
							class="text-link mr-15">Components</a> <a
							href="${pageContext.request.contextPath}/sections.html"
							class="text-link mr-15">Sections</a> <a
							href="${pageContext.request.contextPath}/templates.html"
							class="text-link">Templates</a>
					</p>
				</div>
				<!-- / footer-right-area -->
			</div>
			<!-- / row -->
		</div>
		<!-- / container -->

	</footer>

	<!-- core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<!-- / core JavaScript -->

	<!-- preloader -->
	<script src="${pageContext.request.contextPath}/assets/js/preloader.js"></script>
	<!-- / preloader -->

	<!-- smooth scroll -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.easing.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/smooth-scroll.js"></script>
	<!-- / smooth scroll -->

	<!-- hide nav -->
	<script src="${pageContext.request.contextPath}/assets/js/hide-nav.js"></script>
	<!-- / hide nav -->

	<!-- form validation -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/form-validation.js"></script>
	<!-- end of form validation -->

	<!-- Owl Carousel -->
	<script
		src="${pageContext.request.contextPath}/assets/js/owl.carousel.min.js"></script>
	<script>
		$('#product-carousel').owlCarousel({
			loop : true,
			margin : 0,
			nav : false,
			dots : true,
			items : 1,
			animateIn : 'fadeIn',
			animateOut : 'fadeOut'
		})

		// 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
		let mForm = $("#modifyForm"); // 페이지 데이터 수정 from
		let dForm = $("deleteForm");
		/* 수정 하기 버튼 */
		$("#modifyButton").on("click", function(e) {
			mForm.submit();
		});

		$(document).ready(function() {
			// 삭제 버튼 클릭 시
			$("#deleteButton").on("click", function(e) {
				e.preventDefault(); // 기본 동작 막기

				// 삭제 확인 다이얼로그 표시
				if (confirm("정말로 삭제하시겠습니까?")) {
					// 삭제 폼을 서버로 전송
					$("#deleteForm").submit();
				}
			});
		});
	</script>
	<!-- / Owl Carousel -->

</body>

</html>