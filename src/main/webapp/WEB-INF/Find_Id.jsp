<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/style.css">
</head>
	<%@include file= "connectDB.jsp" %>
<body>
	<h1>
		<a href="index.jsp"
			style="position: absolute; right: 870px; top: 100px; text-decoration-line: none; color: white;">OTT
			Ranking</a>
	</h1>
	<div class="wrapper">
		<h2>아이디 찾기</h2>
		<form action="#" method="post">
			<div class="input-box">
				<input type="text" placeholder="이메일" required name="Email">
			</div>
			<div class="input-box">
				<input type="text" placeholder="생년월일" required name="birt">
			</div>
			<div class="input-box button">
				<input type="Submit" value="인증">
			</div>
		</form>
	</div>

	<%
		String DB_id = null;
		String DB_email = null;
		String DB_birh = null;
		boolean status = false;
		boolean temp = false;
		
		
		
		request.setCharacterEncoding("UTF-8");
	
		String email = request.getParameter("Email");
		String birh = request.getParameter("birt");
		String id = null;
		if(email != null){
			temp = true;
		}
	
		if(temp == true){ // 입장 시 alert창 방지
		String sql = "select user_id, user_birthday, user_email from user_info";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			DB_id = rs.getString("user_id");
			DB_birh = rs.getString("user_birthday");
			DB_email = rs.getString("user_email");
			
			if(DB_email.equals(email) || DB_birh.equals(birh)){
				id = DB_id;
				status = true;
				break;
			}
		}
		
		if (status==true){
			out.println("<script>");
			out.println("alert('아이디 : "+id+"')");
			out.println("</script>");
		} else{
			out.println("<script>");
			out.println("alert('등록된 계정이 없습니다.')");
			out.println("</script>");
		}
		}
	%>
</body>
</html>