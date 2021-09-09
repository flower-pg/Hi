<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
</head>
<body>
	<%
	response.setContentType("text/html;Charset=UTF-8");
	request.setCharacterEncoding("UTF-8");
	
	Connection connection=null;
	PreparedStatement pstmt=null;

	%>
	<jsp:useBean id="per" class="Pack.Person" scope="page" />
	<jsp:setProperty property="*" name="per"/>

<FORM METHOD=POST action="join_ok.jsp">
	<table border="1">
		<th>Join</th>
			<tr>
				<td>ID :</td>
				<td><input type="text" name="id"> 
				<input type="submit" value="중복확인"></td>
			<%-- <%
			try{
				Class.forName("com.mysql.jdbc.Driver");
				String url="jdbc:mysql://loaclhost/db";
				connection=DriverManager.getConnection(url,"root","db1234");
				
				String check=request.getParameter("id");
				
				String sql="select nname from log where id=?";
			
				pstmt.getConnection().prepareStatement(sql);
				pstmt.setString(1,check);
				
				String p;
				if(check.equals("id"))
					p="join_f.jsp";
				else
					p="join_ok.jsp";
			%> --%>
			</tr>
			<tr>
				<td>PASSWORD :</td>
				<td><input type="text" name="pw"></td>
			</tr>
			<tr>
				<td>이름 :</td>
				<td><input type="text" name="nname"></td>
			</tr>
			<tr>
				<td>주소 :</td>
				<td><input type="text" name="addr"></td>
			</tr>
			<tr>
				<td>전화번호 :</td>
				<td><input type="text" name="tel"></td>
			</tr>
			<tr>
				<td>E-mail :</td>
				<td><input type="text" name="email"></td>
			</tr>
		
	</table>
	<input type="submit" value="가입">
	<button onclick="location='index.jsp'">취소</button>
	<%-- <%}catch (Exception e){
		e.printStackTrace();
	}
	 %> --%>
	 
</FORM>
</body>
</html>
