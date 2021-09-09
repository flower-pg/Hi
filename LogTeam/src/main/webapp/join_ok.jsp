<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ page import="Pack.Person"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join_ok</title>
</head>
<body>
<jsp:useBean id="per" class="Pack.Person" scope="page" />
<jsp:setProperty property="*" name="per"/>
<%-- <jsp:getProperty name="per" property="id"/> --%>
<%= per.getId() %>
<%
	response.setContentType("text/html;Charset=UTF-8");
	request.setCharacterEncoding("UTF-8");
	
	Connection connection=null;
	PreparedStatement pstmt=null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/db01";
		connection=DriverManager.getConnection(url,"root","64126346");
		
		String sql="insert into log(id,pw,nname,addr,tel,email) values(?,?,?,?,?,?);";
		pstmt=connection.prepareStatement(sql);
		
		pstmt.setString(1,per.getId());
		pstmt.setString(2,per.getPw());
		pstmt.setString(3,per.getNname());
		pstmt.setString(4,per.getAddr());
		pstmt.setString(5,per.getTel());
		pstmt.setString(6,per.getEmail());
		
		 int count = pstmt.executeUpdate();
         if( count == 0 ){
             System.out.println("데이터 입력 실패");
         }
         else{
             System.out.println("데이터 입력 성공");
         }
     } catch( ClassNotFoundException e){
         System.out.println("드라이버 로딩 실패");
     }

     catch( SQLException e){
         System.out.println("에러 " + e);
     }

     finally{
         try{
             if( connection != null && !connection.isClosed()){
                 connection.close();
             }
             if( pstmt != null && !pstmt.isClosed()){
                 pstmt.close();
             }
         }
         catch( SQLException e){
             e.printStackTrace();
         }
     }
		
%>
<h2>가입을 축하드립니다.</h2>
</body>
</html>