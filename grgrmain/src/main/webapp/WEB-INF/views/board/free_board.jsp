<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Meta -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="Soft UI - Neumorphism Style UI Kit" />
<meta name="author" content="kingstudio.ro" />
<!-- Favicon -->
<link rel="icon"
	href="${pageContext.request.contextPath}/assets/images/favicon.png" />
<!-- Site Title -->
<title>Soft UI - Neumorphism Style UI Kit</title>
<!-- Bootstrap 4 core CSS -->
<link
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<!-- Custom Styles -->
<link href="${pageContext.request.contextPath}/assets/css/animate.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/assets/css/style.css"
	rel="stylesheet" />
<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;600;800&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;600;800&display=swap"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/assets/css/fontawesome-all.min.css"
	rel="stylesheet" type="text/css" />
<style>
.va-middle {
	font-size: 20px;
}

.page-link {
	font-size: 20px;
}

.mb-20 {
	font-size: 2rem;
	font-weight: 'bold';
}

.board-images {
	width: 100px;
}

#comment-reply {
	margin-bottom: 20px; /* 아래쪽 여백을 20px로 설정 */
	clear: both;
}
.comment-style{
	font-size: 15px;
	font-weight:normal;
	
}
.comment{
	border-top: 1px solid #97989d;
}
</style>
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


	<!-- 큰 컨테이너  -->
	<section class="lg bg-light-grey" id="my-section">
		<div class="container">
			<div class="w-90 m-x-auto mt-70">
				<div class="col-xl-auto">
					<a href="#x"
						class="d-inline title-color primary-hover fs-24 fw-bold mb-15"
						style="margin: 10px">${freeBoard.freeTitle} </a>
					<%-- 세션!! <c:if test="${freeBoard.uno==loginUno }"> --%>
					<c:if test="${freeBoard.uno==sessionScope.loginUno}">
						<!-- 수정버튼 제출시 제출된 게시글로 진입 + 자신의 게시글에서 글목록 누를시 원래보던 페이지로 이동할 것  -->
						<a
							href="<c:url value='/freeboard/modify${searchCondition.getQueryString()}&freeBno=${freeBoard.freeBno}'/>"
							class="btn btn-xs btn-primary pill"
							style="float: right; font-size: 15px; margin: 10px"><span>수정</span></a>
					</c:if>

					<%-- 세션!! <c:if test="${freeBoard.uno==loginUno }"> --%>
					<c:if test="${freeBoard.uno==sessionScope.loginUno }">
						<!-- 자신의 글일시 해당 글번호의 글을 삭제할 수 있음 -->
						<a
							href="<c:url value='/freeboard/remove${searchCondition.getQueryString()}&freeBno=${freeBoard.freeBno}'/>"
							class="btn btn-xs btn-primary pill"
							style="float: right; font-size: 15px; margin: 10px"><span>삭제</span></a>
					</c:if>
					<%-- <c:if test="${loginUserStatus}==1 }"> --%>
					<c:if test="${sessionScope.loginUserStatus == 1 }">
						<!-- 관리자는 해당 글번호의 글을 숨김처리할 수 있음 -->
						<a
							href="<c:url value='/freeboard/hide${searchCondition.getQueryString()}&freeBno=${freeBoard.freeBno}'/>"
							class="btn btn-xs btn-primary pill"
							style="float: right; font-size: 15px; margin: 10px"><span>숨김</span></a>
					</c:if>
					<p
						class="fs-12 post-meta-small p-y-15 pl-15 mb-15 border-secondary"
						style="clear: both; padding: 10px">

						<i class="fas fa-user mr-5"></i>${freeBoard.nickname } <span
							class="mr-5 ml-5 text-muted">|</span><i
							class="fas fa-calendar-alt mr-5"></i>${freeBoard.freeRegdate }<span
							class="mr-5 ml-5 text-muted">|</span> <i class="fas fa-tag mr-5"></i>
					</p>

					<p class="m-y-30">${freeBoard.freeContent}</p>
					<c:forEach var="file" items="${freeFiles}">
						<%-- <img src="${pageContext.request.contextPath}/resources/upload/${file.freeFileUpload}" --%>
						<img src="<c:url value="/upload/${file.freeFileUpload}"/>"
							alt="${file.freeFileOrigin }" class="board-images" width="50">
					</c:forEach>
					<!-- 보던페이지로 이동 -->
					<a
						href="<c:url value='/freeboard/list${searchCondition.getQueryString()}' />"
						class="btn btn-xs btn-primary pill"
						style="float: right; font-size: 15px"><span>글목록</span></a>
				</div>
				<!-- / column -->

				<!-- 이전글, 다음글 -->
				<nav aria-label="pager" style="clear: both; padding-top: 30px">
					<ul class="pager">
						<c:if test="${!isFirstPost }">
							<li class="pager-left"><a
								href="<c:url value='/freeboard/read${searchCondition.getQueryString()}&freeBno=${prevFreeBno}'/>"><i
									class="fas fa-arrow-left"></i> <span class="ml-5">이전글</span></a></li>
						</c:if>
						<c:if test="${isFirstPost }">
							<li class="pager-left disabled"><i class="fas fa-arrow-left"></i>
								<span class="ml-5">이전글</span></a></li>
						</c:if>

						<c:if test="${!isLastPost}">
							<li class="pager-right"><a
								href="<c:url value='/freeboard/read${searchCondition.getQueryString()}&freeBno=${nextFreeBno}'/>"><span
									class="mr-5">다음글</span> <i class="fas fa-arrow-right"></i></a></li>
						</c:if>

						<c:if test="${isLastPost}">
							<li class="pager-right disabled"><span class="mr-5">다음글</span>
								<i class="fas fa-arrow-right"></i></li>
						</c:if>
					</ul>
				</nav>

				<!-------------------------------------------댓글영역 ----------------------------------------------->

				<i class="far fa-comments fs-20 text-warning d-block mb-15" style="border-top: 1px solid #97989d; padding-top: 15px">댓글</i>

				<!-- 댓글 출력 -->
				<ul id="comments-list" style="border-bottom: solid 1px #97989d; padding-left:0px">

				</ul>

				<!-- 댓글 제출 폼 -->
				<div id="reply-form" >
					<form id="replyForm">
						<textarea id="reply" class="form-control border-faded" rows="15"
							placeholder="댓글을 입력하세요"></textarea>
						<button type="button" id="submit-reply"
							class="btn btn-primary-gradient w-100 mt-15">
							<span>댓글 등록</span>
						</button>
					</form>
				</div>
				<!-- / replyForm - 댓글 제출 폼 -->
				<!-- 페이지 네비게이션 -->
				<nav aria-label="pagination-center">
					<ul class="pagination justify-content-center">

					</ul>
				</nav>
				<!-- 페이지 네비 -->
			</div>
		</div>
		<!-- 대댓글 폼 : 대댓 버튼 누를시 댓글아래로 이동하여 style -> block-->
		<div id="comment-reply" data-group=""
			style="display: none; width: 95%; display: flex; justify-content: flex-end; align-items: center; margin: 10px;">
			<input class="form-control" type="text" name="freeCommentContent"
				placeholder="대댓글을 입력하세요...">
			<div class="input-group-append">
				<button id="wrtRepBtn" type="button"
					class="btn btn-outline-secondary">등록</button>
			</div>
		</div>

		<!-- 대댓글 폼 -->
	</section>
	<!-- / pagination-center -->

	<!-- 위로 스크롤 -->
	<a href="#top" class="scroll-to-top is-hidden smooth-scroll"
		data-nav-status="toggle"><i class="fas fa-chevron-up"></i></a>

	<!-- footer 영역 -->
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

	<!-- portfolio script -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.shuffle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/portfolio.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<!-- 댓글기능 관련 스크립트  -->
	<script>
		const url = new URL(window.location.href);
		const freeBno = url.searchParams.get("freeBno");
		let pageNum = 1;
		let loginUno;
		let freeCommentNo;
		let loginUserStatus;
		//댓글 조회
		let showList = function(freeBno, pageNum) {
			$.ajax({
				type : 'GET',
				url : '/GRGR1/freecomment/list/' + freeBno + "?pageNum="+ pageNum, // infoBno 값을 경로에 포함시킵니다.
				headers : {
					'Accept' : 'application/json'
				},
				success : function(data) {
					
					if(data.freeCommentList.length===0){
						var html="<li class='comment'>";
						html += '<p class="mb-0 comment-style" style="padding: 10px 30px 10px 50px; text-align:center">댓글이 존재하지 않습니다. 첫번째 댓글을 입력해주세요.</p>';
					
						html+="</li>";
						$("#comments-list").html(html);
						return;
					}
					
					
					loginUno = ${sessionScope.loginUno};
					loginUserStatus = ${sessionScope.loginUserStatus};
					console.log("loginUno :" + loginUno);
			            resetReplyForm();
			            renderComments(data.freeCommentList);
			            renderPagination(data.commentPager);
			        
				},
				error : function(err) {
					
					console.error("댓글을 불러오는데 실패했습니다.", err);
				}
			});

		}

		function renderComments(comments) {
			var $commentList = $('#comments-list');

			$commentList.empty(); // 기존 댓글 내용을 지웁니다.

			comments.forEach(function(comment) {
				var commentHTML = toHtml(comment); 
				$commentList.append(commentHTML);
			});
		}
		
		let toHtml = function(comment) {
			let html = '<li class="comment " data-cno="' + comment.freeCommentNo;
		    html += '" data-group="' + comment.freeCommentGroup;
		    html += '" data-freeBno="' + comment.freeBno + '">';
			if (comment.freeCommentBlindstate === 3) { // 댓글이 삭제
				html += '<p class="mb-0 comment-style" style="padding: 10px 30px 10px 50px; text-align:center">삭제된 댓글입니다.</p>';
			} else if (comment.freeCommentBlindstate == 2) { //게시자가 숨겼다면
				html += '<p class="mb-0 comment-style" style="padding: 10px 30px 10px 50px; text-align:center">관리자에의해 비공개된 댓글입니다.</p>';
			} else { // 정상적으로 보이는 게시물
				
				if(comment.freeCommentGroup == comment.freeCommentNo){ //부모댓글
					html += '<div class="comment-free" style="padding: 10px 30px;">';
					html += '<span class="comment-author" style="padding-right: 20px">'
							+ comment.nickname + '</span>';
					html += '<span class="comment-date">'+ comment.freeCommentRegdate + '</span>';
					html += '</div>';
					html += '<p class="mb-0 comment-style" style="padding: 0px 30px 10px 40px;">'
							+ comment.freeCommentContent;
					html += '<span id="comment-select" style="float: right;">';
					html += '<a href="#x" class="replyBtn"><i class="far fa-comments fs-15 mr-5"></i>대댓글</a>';
				
					if (comment.uno === loginUno) {
						//html += '<a href="#x" class="comment-modify"> <i class="far fa-comments fs-15 mr-5"></i>변경</a>';
						html += '<a href="#x" class="comment-remove"> <i class="far fa-comments fs-15 mr-5"></i>삭제</a>';
					}
					if (loginUserStatus === 1) {
						html += '<a href="#x" class="comment-hide"> <i class="far fa-comments fs-15 mr-5"></i>숨김</a>';
					}
					html += '</span>';
					html += '</p>';
					 
			 	} else { //자식댓글
			 		html += '<div class="comment-free" style="padding: 10px 30px;">';
					html += '<span class="comment-author" style="padding: 0 20px 0 80px">'
							+ comment.nickname + '</span>';
					html += '<span class="comment-date">'+ comment.freeCommentRegdate + '</span>';
					html += '</div>';
					html += '<p class="mb-0 comment-style" style="padding: 0px 30px 10px 100px;">ㄴ'	+ comment.freeCommentContent;
					html += '<span id="comment-select" style="float: right;">';				
					if (comment.uno === loginUno) {
						//html += '<a href="#x" class="comment-modify"> <i class="far fa-comments fs-15 mr-5"></i>변경</a>';
						html += '<a href="#x" class="comment-remove"> <i class="far fa-comments fs-15 mr-5"></i>삭제</a>';
					}
					if (loginUserStatus === 1) {
						html += '<a href="#x" class="comment-hide"> <i class="far fa-comments fs-15 mr-5"></i>숨김</a>';
					}
					html += '</span>';
					html += '</p>';
				 
			 }
			}

			html += '</li>';
			return html;
		}

		function renderPagination(commentPager) {
			const paginationContainer = $('.pagination');
			let html = "";

			// 이전 페이지 
			if (commentPager.startPage == 1) {
				html += '<li class="page-item disabled">';
				html += '<a class="page-link" href="javascript:void(0)">';
				html += '<i class="fas fa-arrow-left mb-5"></i>';
				html += '</a></li>';
			} else {
				html += '<li class="page-item">';
				html += '<a class="page-link" href="javascript:void(0)" onclick="showList(freeBno, '
						+ commentPager.prevPage + ')">';
				html += '<i class="fas fa-arrow-left mb-5"></i>';
				html += '</a></li>';
			}

			// 페이지 번호
			for (let i = commentPager.startPage; i <= commentPager.endPage; i++) {
				const isActive = i === commentPager.pageNum ? 'active' : '';
				html += '<li class="page-item ' + isActive + '">';
				html += '<a class="page-link" href="javascript:void(0)" onclick="setPageNum('
						+ i + ')">' + i + '</a>';

				html += '</li>';
			}

			// 다음 페이지
			if (commentPager.endPage == commentPager.totalPage) {
				html += '<li class="page-item disabled">';
				html += '<a class="page-link" href="javascript:void(0)">';
				html += '<i class="fas fa-arrow-right mb-5"></i>';

				html += '</a></li>';
			} else {
				html += '<li class="page-item">';
				html += '<a class="page-link" href="javascript:void(0)" onclick="showList(freeBno, '
						+ commentPager.nextPage + ')">';
				html += '<i class="fas fa-arrow-right mb-5"></i>';
				html += '</a></li>';
			}

			// HTML 추가
			paginationContainer.html(html);
		}


		function setPageNum(selectedPageNum) {
			pageNum = selectedPageNum; // pageNum에 페이지 번호 저장
			showList(freeBno, pageNum);
		}
		
		function resetReplyForm() {
		    //$("#comment-reply").hide(); // 대댓글 폼을 숨깁니다.
		    $("#comment-reply").appendTo("#my-section"); // 대댓글 폼을 원래 위치로 되돌립니다.
		    $("#comment-reply").val("");
		}
		
		
		$(document).ready(function() {

			$("#comment-reply").hide(); //대댓글 폼을 일단 숨김
		    showList(freeBno, pageNum);
		    

		<!-- 대댓글 폼 --> */

		 /* 대댓글 폼 : 대댓 버튼 누를시 댓글아래로 이동하여 style -> block */
		$("#comments-list").on("click", ".replyBtn", function() {
			 const commentContainer = $(this).closest('.comment');
			 console.log()
			 const commentGroup = commentContainer.data('group'); // 선택한 댓글의 data-group값 가져오기
			 $("#comment-reply input[name='freeCommentContent']").val('');
			 $("#comment-reply").appendTo(commentContainer);
			 $("#comment-reply").data('group', commentGroup);
			 $("#comment-reply").show();
		});
		/* 대댓글 등록 버튼 클릭 */
		$("#wrtRepBtn").on("click", function() {
		    const commentGroup = $("#comment-reply").data('group');
		    const replyContent = $("#comment-reply input[name='freeCommentContent']").val();

		    $.ajax({
		        type: "POST",
		        url: "<c:url value="/freecomment/write/"/>/" + freeBno,
		        headers: {
		            'Content-Type': 'application/json'
		        },
		        data: JSON.stringify({
		        	freeCommentGroup: commentGroup,
		        	freeCommentContent: replyContent
		        }),   
		        success: function(response) {
		            showList(freeBno, pageNum);
		        },
		        error: function(err) {
		            console.error("대댓글 등록에 실패했습니다.", err.responseText);
		        }
		    });
		});

		
		$(document).on('click', function(event) {
		    // 대댓글 폼이나 대댓글 버튼 외 곳을 클릭하면 숨겨짐
		    if (!$(event.target).closest("#comment-reply").length && !$(event.target).closest(".replyBtn").length) {
		        $("#comment-reply").hide(); // 대댓글 폼 숨기기
		        // 대댓글 폼 이동 (section아래로 보냈음)
		        $("#comment-reply").appendTo("#my-section");
		    }
		});

		    // 댓글 삭제
		    $("#comments-list").on("click", ".comment-remove", function() {
		        let freeCommentNo = $(this).closest('li.comment').data('cno');
		        console.log('freeCommentNo :' + freeCommentNo);

		        $.ajax({
		            type: 'PUT',
		            url: '/GRGR1/freecomment/remove/' + freeCommentNo,
		            dataType: 'text',
		            success: function() {
		                const commentLi = $('li[data-cno="' + freeCommentNo + '"]');
		                commentLi.find('p.mb-0').text("작성자에 의해 삭제된 댓글입니다.");
		                commentLi.find('.comment-info').remove();
		                commentLi.find('.comment-modify, .comment-remove').remove();
		                showList(freeBno, pageNum);
		            },
		            error: function(err) {
		                console.error("댓글 상태 변경에 실패했습니다.", err.responseText);
		            }
		        });
		    });

		    // 댓글 숨김
		    $("#comments-list").on("click", ".comment-hide", function() {
		        let freeCommentNo = $(this).closest('li.comment').data('cno');
		        console.log('freeCommentNo :' + freeCommentNo);

		        $.ajax({
		            type: 'PUT',
		            url: '/GRGR1/freecomment/hide/' + freeCommentNo,
		            dataType: 'text',
		            success: function() {
		                const commentLi = $('li[data-cno="' + freeCommentNo + '"]');
		                commentLi.find('p.mb-0').text("Blind 되었습니다.");
		                commentLi.find('.comment-info').remove();
		                commentLi.find('.comment-hide').remove();
		                showList(freeBno, pageNum);
		            },
		            error: function(err) {
		                console.error("댓글 상태 변경에 실패했습니다.", err.responseText);
		            }
		        });
		    });

		    // 댓글 등록
		    $("#submit-reply").click(function() {
		        let replyContent = $("#reply").val();

		        if (replyContent.trim() == '') {
		            alert('댓글을 입력해주세요');
		            $('#reply').focus();
		            return;
		        }

		        $.ajax({
		            type: 'POST',
		            url: "<c:url value="/freecomment/write"/>/"+freeBno,
		            headers: {
		                'Content-Type': 'application/json'
		            },
		            data: JSON.stringify({
		            	freeBno: freeBno,
		            	freeCommentContent: replyContent,
		            }),
		            success: function(data) {
		              //  alert(data);
		                showList(freeBno, pageNum);
		                $('#reply').val('');
		                
		            },
		            error: function(err) {
		                console.error("댓글을 불러오는데 실패했습니다.", err.responseText);
		            }
		        });
		    });

		});
	</script>

	<script>
		$(document).ready(function() {
			if (Modernizr.touch) {
				// show the close overlay button
				$('.close-overlay').removeClass('hidden');
				// handle the adding of hover class when clicked
				$('.img').click(function(e) {
					if (!$(this).hasClass('hover')) {
						$(this).addClass('hover');
					}
				});
				// handle the closing of the overlay
				$('.close-overlay').click(function(e) {
					e.preventDefault();
					e.stopPropagation();
					if ($(this).closest('.img').hasClass('hover')) {
						$(this).closest('.img').removeClass('hover');
					}
				});
			} else {
				// handle the mouseenter functionality
				$('.img').mouseenter(function() {
					$(this).addClass('hover');
				})
				// handle the mouseleave functionality
				.mouseleave(function() { // 추가된 부분
					$(this).removeClass('hover');
				}); // 추가된 부분
			}
		});
	</script>
	<!-- / portfolio script -->
</body>
</html>