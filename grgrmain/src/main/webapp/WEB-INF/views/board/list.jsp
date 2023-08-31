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
<title>끼리끼리 상점</title>
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
	<jsp:include page="/WEB-INF/views/tiles/header.jsp" />
	<div id="preloader">
		<div class="preloader">
			<span></span> <span></span>
		</div>
	</div>

	<div id="top"></div>
	<!-- / top -->

	<header class="xl bg-img bg-fixed"
		style="background-image: url(${pageContext.request.contextPath}/assets/images/placeholder.jpg)">

		<div class="container text-center">
			<h1 class="page-title">Market</h1>
			<p class="w-50 m-x-auto mb-30">끼리끼리 옹기종기 장터</p>
			<a href="#start" class="btn btn-sm btn-primary smooth-scroll"><i
				class="fas fa-shopping-cart mr-5"></i> <span>쇼핑하러 가기</span></a>
		</div>
		<!-- / container -->
	</header>

	<section id="start" class="lg page-section">
		<!-- <ul class="portfolio-filter list-inline text-center mb-30">
			<li id="portfolio-filter-list"><a href="#">지역 : 강남구 </a></li>
			<li id="portfolio-filter-list"><a href="#" data-group="all"
				class="active ml-2">전체</a></li>
			<li id="portfolio-filter-list"><a href="#" data-group="food">맛집후기</a>
			</li>
			<li id="portfolio-filter-list"><a href="#" data-group="market">동네후기</a>
			</li>
			<li id="portfolio-filter-list"><a href="#" data-group="living">생활정보</a>
			</li>
			<li id="portfolio-filter-list"><a href="#" data-group="event">이벤트</a>
			</li>
		</ul> -->
		<div class="d-flex justify-content-center">
			<!-- 중앙 정렬을 위한 컨테이너 -->
			<div class="col-lg-4 col-xl-3 sidebar">
				<div class="widget text-left pb-15 mt-0">
					<div class="input-group input-w-overlap-btn mb-0">
						<input type="text" class="form-control pill" id="searchKeyword"
							placeholder="Search..."> <span class="input-group-btn">
							<button
								class="btn btn-sm btn-primary lh-0 overlapping-btn big-btn pill"
								type="button" id="searchButton">
								<i class="fas fa-search mr-5"></i> Search
							</button>
						</span>
					</div>
				</div>
			</div>


		</div>


		<div id="resultArea">
			<!-- 검색 결과가 여기에 표시될 곳 -->
		</div>

		<div class="container" style="clear: both">
			<div class="row justify-content-center">
				<div class="col-lg-8 col-xl-9 tablet-lg-top-30 page-content">
					<div class="row">
						<c:forEach var="list" items="${list}">
							<div class="col-sm-6 col-xl-3">
								<div class="card">
									<div class="card-body text-center p-y-30">
										<img
											src="${pageContext.request.contextPath}/assets/images/placeholder-square.jpg"
											alt="" class="mb-30 rounded raised-sm">
										<p class="card-title product-title fs-20">
											<a
												href="<c:url value='/board/get?productId=${list.productId}' />"
												class="title-link primary-hover fs-20"> <c:out
													value="${list.productTitle}" />
											</a>
										</p>
										<p class="price-block text-primary">
											₩
											<c:out value="${list.productPrice}" />
										</p>
										<p class="product-regdate">
											<i class="far fa-calendar-alt mr-5"></i>
											<fmt:formatDate value="${list.productRegdate}"
												pattern="yyyy/MM/dd" />
										</p>

										<div class="product-card-footer">
											<a
												href="<c:url value="/board/get?productId=${list.productId}" />"
												class="btn btn-sm btn-outline-primary mt-15"> <i
												class="fas fa-shopping-cart mr-5"></i> <span>Buy Now</span>
											</a>
										</div>
										<!-- / product-card-footer -->
									</div>
									<!-- / card-body -->
								</div>
								<!-- / card -->
							</div>
							<!-- / column -->
						</c:forEach>
					</div>
					<!-- / row -->
				</div>
				<!-- / col-lg-8 col-xl-9 tablet-lg-top-30 page-content -->

			</div>
			<!-- / row -->
		</div>
		<!-- / container -->

		<span style="float: right"><a
			href="<c:url value='/board/insert'/>"
			class="btn btn-primary-gradient m-y-10 mr-10"
			style="float: right; display: block"><span
				class="fas fa-edit mr-10"></span> <span style="font-size: 20px">글쓰기</span></a></span>
	</section>

	<nav aria-label="pagination-center">
		<ul class="pagination justify-content-center">
			<li class="page-item disabled"><a class="page-link" href="#"><i
					class="fas fa-arrow-left mb-5"></i></a></li>
			<c:forEach var="num" begin="${pager.startPage}"
				end="${pager.endPage}">
				<li class="page-item ${num == pager.cri.pageNum ? 'active' : ''}">
					<a class="page-link"
					href="${pageContext.request.contextPath}/board/list?pageNum=${num}&amount=${pager.cri.amount}">
						${num} </a>
				</li>
			</c:forEach>
			<li class="page-item"><a class="page-link" href="#"><i
					class="fas fa-arrow-right mb-5"></i></a></li>
		</ul>
	</nav>


	<a href="#top" class="scroll-to-top is-hidden smooth-scroll"
		data-nav-status="toggle"><i class="fas fa-chevron-up"></i></a>

	<footer>
		<div class="container">
			<div class="row v-center mobile-center">
				<div class="col-md-4 footer-left-area tablet-top">
					<p>
						© Soft UI by <a href="https://kingstudio.ro" target="_blank">KingStudio</a>
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

	<form id="moveForm" method="get">
		<input type="hidden" name="keyword" value="${pager.cri.keyword}">
		<input type="hidden" name="pageNum" value="1">
	</form>

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

	<!-- noUI slider -->
	<script
		src="${pageContext.request.contextPath}/assets/js/nouislider.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/noui-init.js"></script>
	<!-- / noUI slider -->

	<script>
		$(document).ready(function() {
			const moveForm = $("#moveForm"); // moveForm 변수를 정의해야 함

			$("#searchButton").on("click", function(e) {
				e.preventDefault();
				let val = $("#searchKeyword").val();
				moveForm.find("input[name='keyword']").val(val);
				moveForm.find("input[name='pageNum']").val(1);
				moveForm.submit();
			});

			$("#searchKeyword").on("keypress", function(e) {
				if (e.which === 13) { // 엔터 키의 keyCode는 13입니다.
					e.preventDefault();
					let val = $("#searchKeyword").val();
					moveForm.find("input[name='keyword']").val(val);
					moveForm.find("input[name='pageNum']").val(1);
					moveForm.submit();
				}
			});
		});

		$(document).ready(function() {

			let result = '<c:out value="${result}"/>';

			checkAlert(result);

			function checkAlert(result) {

				if (result === '') {
					reutrn;
				}

				if (result === "insert success") {
					alert("등록이 완료되었습니다.");
				}

				if (result === "update success") {
					alert("수정이 완료되었습니다.");
				}

				if (result === "delete success") {
					alert("삭제가 완료되었습니다.");
				}

			}

		});
	</script>



</body>

</html>