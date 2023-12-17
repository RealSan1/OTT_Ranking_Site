<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/style.css">
<%@include file="connectDB.jsp"%>
</head>
<body>
	<h1>
		<a href="index.jsp"
			style="position: absolute; right: 870px; top: 100px; text-decoration-line: none; color: white;">OTT
			Ranking</a>
	</h1>
	<div class="wrapper">
		<h2>비밀번호 찾기</h2>
		<form action="#" method="post">
			<div class="input-box">
				<input type="text" placeholder=아이디 required name="Id">
			</div>
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
		String DB_pw = null;
		String DB_email = null;
		String DB_birh = null;
		boolean status = false;
		boolean temp = false;
		
		request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("Id");
		String email = request.getParameter("Email");
		String birh = request.getParameter("birt");
		String pw = null;
		if(id != null){
			temp = true;
		}
	
		if(temp == true){ // 입장 시 alert창 방지
		String sql = "select user_id, user_birthday, user_email, user_pw from user_info";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			DB_id = rs.getString("user_id");
			DB_birh = rs.getString("user_birthday");
			DB_email = rs.getString("user_email");
			DB_pw = rs.getString("user_pw");
			
			if(DB_email.equals(email) || DB_birh.equals(birh) || DB_id.equals(id)){
				pw = DB_pw;
				status = true;
				break;
			}
		}
		
		if (status==true){
			out.println("<script>");
			out.println("alert('비밀번호 : "+pw+"')");
			out.println("</script>");
		} else{
			out.println("<script>");
			out.println("alert('등록된 계정이 없습니다.')");
			out.println("</script>");
		}}
%>
</body>
</html>