<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 초기화</title>
    <link rel="stylesheet" href="<c:url value="${pageContext.request.contextPath}/resources/css/style.css" />">
    <style>
    body {
    font-family: Arial, sans-serif;
}

.container {
    width: 300px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
}

.form-group {
    margin-bottom: 15px;
}

label {
    font-weight: bold;
    display: block;
    margin-bottom: 5px;
}

input[type="text"],
input[type="email"] {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

button {
    background-color: #007bff;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}

p {
    margin-top: 10px;
    color: red;
}
</style>    
</head>
<body>
    <div class="container">
        <h2>비밀번호 초기화</h2>
        <form action="${pageContext.request.contextPath}/user/forgot-password" method="post">
            <div class="form-group">
                <label for="userId">아이디</label>
                <input type="text" id="userId" name="userId" required>
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" required>
            </div>
            <button type="submit">비밀번호 초기화</button>
        </form>
        <p class="message ${errorMessage != null ? 'error' : ''}">${errorMessage}</p>
        <p class="message ${successMessage != null ? 'success' : ''}">${successMessage}</p>
    
    </div>
</body>
</html>