<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="Pack.Person"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="text-align: center;">
	<jsp:useBean id="per" class="Pack.Person" scope="page" />
	<jsp:setProperty property="*" name="per"/>
	<form action="login.jsp" method="post">
		<input type="text" name = "id" value="test" placeholder="ID를 입력해주세요"><br>
		<input type="password" name = "pw" value="1234" placeholder="비밀번호를 입력해주세요"><br>
		<input type="submit" value="로그인">
	</form>
	<a href="join.jsp">회원가입</a>
	<a href="id_search.jsp">ID찾기</a>
	<a href="pw_search.jsp">PW찾기</a>
</body>

</html>