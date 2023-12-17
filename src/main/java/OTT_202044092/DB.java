package OTT_202044092;

import java.sql.*;

public class DB {
	
	
	public Connection getConnection() throws SQLException {
	    try {
	        Class.forName("com.mysql.jdbc.Driver");

	        Connection conn = null;

	        String jdbcURL = "jdbc:mysql://localhost:3306/OTT?"
	                + "useSSL=false&serverTimezone=UTC";

	        String dbUser = "root";
	        String dbPass = "rootpw";

	        // 2. 데이터베이스 커넥션 생성
	        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPass);

	        return conn;

	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace(); // 적절한 예외 처리를 수행하거나 던집니다.
	        throw new SQLException("Failed to establish a database connection.", e);
	    }
	}

		
	

}
