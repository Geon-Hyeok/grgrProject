<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>아이디 찾기</title>
</head>
<body>
    <h1>아이디 찾기</h1>
    
    <form id="findIdForm">
        <label for="name">이름:</label>
        <input type="text" id="name" name="name"><br>
        <label for="email">이메일:</label>
        <input type="email" id="email" name="email">
        <button type="button" onclick="findId()">찾기</button>
    </form>
    
    <div id="result"></div>
    
    <script>
        function findId() {
            var name = document.getElementById("name").value;
            var email = document.getElementById("email").value;
            
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var resultDiv = document.getElementById("result");
                    resultDiv.innerHTML = xhr.responseText;
                }
            };
            xhr.open("POST", "${pageContext.request.contextPath}/user/find-id", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.send("name=" + name + "&email=" + email);
        }
    </script>
</body>
</html>