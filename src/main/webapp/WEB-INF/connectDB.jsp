<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Connection conn = null;
	
	String jdbcURL = "jdbc:mysql://localhost:3306/OTT?"
					+ "useSSL=false&serverTimezone=UTC";
	
	String dbUser = "root";
	String dbPass = "rootpw";
	
	try {
		// 데이터베이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcURL, dbUser, dbPass);
		
		
	} catch (SQLException e) {

		e.printStackTrace();

	} finally {
		// 반드시 연결을 닫아야 합니다.
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	%>
</body>
</html>
