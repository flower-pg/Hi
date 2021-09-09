package Pack;

import java.sql.*;

public class fx {
	public fx() {
		// TODO Auto-generated constructor stub
	}
	
	
	public String findId(String nname, String email) {

		String id = null;

		try {
			// JDBC 드라이버
			String jdbc_driver = "com.mysql.cj.jdbc.Driver";
			// URL = "jdbc:mysql://호스팅 주소/데이터베이스 이름?serverTimezone=UTC";
			String jdbc_url = "jdbc:mysql://localhost/db01?serverTimezone=UTC";
			try {
				Class.forName(jdbc_driver);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// 커넥션 = DriverManager.getConnection(URL, "유저명", "데이터베이스 비밀번호");
			Connection connection = DriverManager.getConnection(jdbc_url, "root", "64126346");
			
			String sql = "select id" + " from log" + " where nname = ? and" + " email = ?";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, nname);
			pstmt.setString(2, email);
			ResultSet rs = pstmt.executeQuery();
			
//			String sql2 = "select company_id" + " from company_info" + " where nname = ? and" + " email = ?";
//			PreparedStatement pstmt2 = connection.prepareStatement(sql2);
//			pstmt2.setString(1, nname);
//			pstmt2.setString(2, email);
//			ResultSet rs2 = pstmt2.executeQuery();
			if (rs.next())
				id = rs.getString("id");
//			if (rs2.next())
//				id = rs2.getString("company_info.company_id");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;

	}

}
