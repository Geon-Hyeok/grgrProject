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
	<c:set var="boardName" value="판매게시판" />
	<header class="xl bg-img bg-fixed" style="background-image: url(/grgrmain/images/market.jpg); background-size: cover;">
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
	
		<div class="container relative z-index-1">
			<h1 class="page-title text-left mb-15">상품 조회</h1>
			<nav class="breadcrumb relative z-index-1 pt-10 pl-5">
				<a class="breadcrumb-item" href="#x">Home</a> <a
					class="breadcrumb-item" href="/board/list">Market</a> <span
					class="breadcrumb-item active">Product</span>
			</nav>
		</div>
		<!-- / container -->

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
					<h3 class="mb-5">
						<c:out value="${pageInfo.productTitle}" />
					</h3>
					<p class="fs-20 mb-15">
						₩
						<c:out value="${pageInfo.productPrice}" />
					</p>
					<p class="lead m-y-40">
						<c:out value="${pageInfo.productContent}" />
					</p>
					<p class="ratings mb-0">
						<i class="fas fa-star fs-16"></i> <i class="fas fa-star fs-16"></i>
						<i class="fas fa-star fs-16"></i> <i class="fas fa-star fs-16"></i>
						<i class="fas fa-star fs-16"></i> <span class="ml-5">(2
							Reviews)</span>
					</p>
					<!-- / input-group -->

					<div class="form-cart">
						<div
							class="input-group input-w-overlap-btn mb-0 md-input-group sm-input">
							<input type="number" step="1" min="0" name="cart" value="1"
								title="Qty" class="form-control qty mr-10 rounded"> <span
								class="input-group-btn">
								<button class="btn btn-primary rounded" type="button">
									<i class="fas fa-shopping-cart mr-5"></i> <span>Buy Now</span>
								</button>
							</span>
						</div>
						<!-- / input-group -->
					</div>
					<!-- / form-cart -->
				</div>
				<!-- / column -->
			</div>
			<!-- / row -->

			<div class="card mt-30">
				<div class="card-body">
					<ul class="nav nav-tabs nav-pills" role="tablist">
						<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
							href="#info" role="tab"><i class="fas fa-tag mr-5"></i> 판매자
								정보</a></li>
						<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
							href="#reviews" role="tab"><i class="fas fa-star mr-5"></i>
								리뷰 (2)</a></li>
					</ul>
					<!-- / nav tabs -->
					<div class="tab-content">

						<div class="tab-pane fade mt-30" id="info" role="tabpanel">
							<div class="table-overflow">
								<table class="table table-xl border mb-0">
									<tbody>
										<tr>
											<td>
												<h4 class="fs-14 mb-0">판매자:</h4>
											</td>
											<td><c:out value="${userInfo.nickName}" /></td>
											<td>
												<h4 class="fs-14 mb-0">연락처:</h4>
											</td>
											<td><c:out value="${userInfo.phone}" /></td>
											<td><h4 class="fs-14 mb-0">이메일:</h4></td>
											<td><c:out value="${userInfo.email}" /></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- / table-overflow -->
						</div>
						<div class="tab-pane fade mt-30" id="reviews" role="tabpanel">
							<div class="table-overflow">
								<table class="table table-xl mb-0">
									<tbody>
										<tr>
											<td>
												<div class="list-media img-lg">
													<div class="list-item">
														<div class="media-img">
															<img class="circle"
																src="${pageContext.request.contextPath}/assets/images/placeholder-mini.jpg"
																alt="">
														</div>
														<!-- / media-img -->
														<div class="info">
															<span class="title">Mark</span> <span
																class="sub-title mb-5">@mdo</span> <span
																class="sub-title opc-5">Jun 07, 2020</span>
														</div>
														<!-- / info -->
													</div>
													<!-- / list-item -->
												</div> <!-- / list-media -->
											</td>
											<td></td>
											<td></td>
											<td></td>
											<td>Awesome T-Shirt! I love it.</td>
											<td>
												<p class="ratings mb-0">
													<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
														class="fas fa-star"></i> <i class="fas fa-star"></i> <i
														class="fas fa-star"></i>
												</p>
											</td>
										</tr>
										<tr>
											<td>
												<div class="list-media img-lg">
													<div class="list-item">
														<div class="media-img">
															<img class="circle"
																src="${pageContext.request.contextPath}/assets/images/placeholder-mini.jpg"
																alt="">
														</div>
														<!-- / media-img -->
														<div class="info">
															<span class="title">John</span> <span
																class="sub-title mb-5">@jhn</span> <span
																class="sub-title opc-5">Jun 03, 2020</span>
														</div>
														<!-- / info -->
													</div>
													<!-- / list-item -->
												</div> <!-- / list-media -->
											</td>
											<td></td>
											<td></td>
											<td></td>
											<td>Great Product, highly recommend it!</td>
											<td>
												<p class="ratings mb-0">
													<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
														class="fas fa-star"></i> <i class="fas fa-star"></i> <i
														class="fas fa-star"></i>
												</p>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- / table-overflow -->
						</div>
						<!-- / tab-pane -->
					</div>
					<!-- / tab-content -->
				</div>
				<!-- / card-body -->
			</div>
			<!-- / card -->

			<div id="comment-form">
				<h6 class="mb-15">리뷰 작성하기</h6>
				<form id="commentForm">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" class="form-control border-faded"
									id="subject" placeholder="*Name">
							</div>
						</div>
						<!-- / sub-column -->
						<div class="col-md-6">
							<div class="form-group">
								<input type="email" class="form-control border-faded" id="email"
									placeholder="*Email">
							</div>
						</div>
						<!-- / sub-column -->
						<div class="col-md-12">
							<div class="form-group">
								<textarea id="message" class="form-control border-faded"
									rows="5" placeholder="*Comment"></textarea>
							</div>
						</div>
						<!-- / sub-column -->
					</div>
					<!-- / row -->
					<button type="submit" id="form-submit"
						class="btn btn-primary-gradient w-100">
						<span>등록</span>
					</button>
				</form>
				<!-- / commentForm -->
			</div>
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
	</script>
	<!-- / Owl Carousel -->

</body>

</html>