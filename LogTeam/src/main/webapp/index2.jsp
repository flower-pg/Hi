<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="Pack.Person"%>
<%@ page import="Pack.Person"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="text-align: center;">
	<jsp:useBean id="per" class="Pack.Person" scope="page" />
	<jsp:setProperty property="*" name="per"/>
	
	<input type="text" placeholder="ID" value="test"/>
	<input type="hidden" id="check" value = "no">
	<button onclick="check()">중복체크</button>
	

</body>
	
<script type="text/javascript">
	function check() {
		window.open("idcheck.jsp","IDCHECK","width = 400, height = 350")
	}
</script>
</html>