<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Pack.Person"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="per" class="Pack.Person" scope="page"></jsp:useBean>
	<jsp:setProperty property="*" name="per" />
	<%
	response.setContentType("text/html;Charset=UTF-8");
	request.setCharacterEncoding("UTF-8");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		Class.forName("com.mysql.jdbc.Driver");

		String url = "jdbc:mysql://localhost/db01";
		conn = DriverManager.getConnection(url, "root", "64126346");
		// 연결 끝

		String logId = per.getId();
		String logPw = per.getPw();

		String sql = "select id from log where id = ? and pw = ?";

		pstmt = conn.prepareStatement(sql);

		System.out.println(logId);
		System.out.println(logPw);

		pstmt.setString(1, logId);
		pstmt.setString(2, logPw);

		System.out.println(sql);

		rs = pstmt.executeQuery();

		while (rs.next()) {
			String id = rs.getString("id");
			out.println(logId+"님 로그인 되었습니다.");
			out.println("<a href='index.jsp'>로그아웃</a>");
			return;
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			if (conn != null && !conn.isClosed()) {
		conn.close();
			}
			if (pstmt != null && !pstmt.isClosed()) {
		pstmt.close();
			}
			if (rs != null && !rs.isClosed()) {
		rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	%>
	<script type="text/javascript">
		alert('회원 정보 불일치');
		history.back();
	</script>
</body>
</html>
