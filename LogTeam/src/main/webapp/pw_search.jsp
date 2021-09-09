<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
response.setContentType("text/html;Charset=UTF-8");
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form class="form-horizontal" role="form" method="POST"
		action="pw_search_run.jsp">
		<fieldset>
			<legend>비밀번호 찾기</legend>
			<input type="text" name="id" placeholder="아
			이디" required autofocus/><br/>
			<input type="text" name="nname" placeholder="이름" required autofocus/><br/>
			<input type="email" name="email" placeholder="이메일" required/>
			<p/>
			<button type="submit">비밀번호 찾기</button>
		</fieldset>
	</form>
</body>
</html>