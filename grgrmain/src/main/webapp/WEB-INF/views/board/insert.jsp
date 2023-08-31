<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/tiles/header.jsp" />
	<h1>상품 등록</h1>
	<form action="<c:url value="/board/insert"/>" method="post">
		<div class="input_wrap">
			<label>제목</label> <input name="productTitle">
		</div>
		<div class="input_wrap">
			<label>상품 설명</label>
			<textarea rows="3" name="productContent"></textarea>
		</div>
		<div class="input_wrap">
			<label>가격</label> <input name="productPrice">
		</div>
		<div class="input_wrap">
			<label>회원번호</label> <input name="uno">
		</div>
		<button class="btn">등록</button>
	</form>
</body>
</html>