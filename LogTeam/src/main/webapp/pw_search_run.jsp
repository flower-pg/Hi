<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Pack.Person"%>
<%@page import="java.sql.*"%>
<%@page import="Pack.fx"%>

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
<jsp:useBean id="per" class="Pack.Person" scope="page" />
<jsp:setProperty property="*" name="per"/>

<%
try {
	String id;
	String sql = "select pw from log where id = ? and nname = ? and email = ?;";

	// JDBC 드라이버
	String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	// URL = "jdbc:mysql://호스팅 주소/데이터베이스 이름?serverTimezone=UTC";
	String jdbc_url = "jdbc:mysql://localhost/db01?serverTimezone=UTC";
	Class.forName(jdbc_driver);
	// 커넥션 = DriverManager.getConnection(URL, "유저명", "데이터베이스 비밀번호");
	Connection connection = DriverManager.getConnection(jdbc_url, "root", "64126346");
	
	PreparedStatement pstmt = connection.prepareStatement(sql);
	pstmt.setString(1, per.getId());
	pstmt.setString(2, per.getNname());
	pstmt.setString(3, per.getEmail());
	ResultSet rs = pstmt.executeQuery();

	
	if(rs.next()){
		String a = rs.getString("pw");
		out.println(per.getNname() + "님의 비밀번호는는 " + a + " 입니다.");
		System.out.println(a);
		return;
	}

} catch (Exception e) {
	e.printStackTrace();
}
%>

 	<script type="text/javascript">
 		alert('회원정보 불일치');
 		history.back();
 	</script>

</body>
</html>