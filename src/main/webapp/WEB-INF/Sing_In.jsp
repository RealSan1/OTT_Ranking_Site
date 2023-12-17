<%@page import="ex.user_info"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/style.css">
</head>
<%@include file="connectDB.jsp"%>
<body>
	<h1>
		<a href="index.jsp"
			style="position: absolute; right: 870px; top: 100px; text-decoration-line: none; color: white;">OTT
			Ranking</a>
	</h1>
	<div class="wrapper">
		<h2>로그인</h2>
		<form action="#" method="post">
			<div class="input-box">
				<input type="text" placeholder="아이디" required name="id">
			</div>
			<div class="input-box">
				<input type="text" placeholder="비밀번호" required name="pw">
			</div>
			<div class="input-box button">
				<input type="Submit" value="로그인">
			</div>
			<div class="text">
				<h3 style="text-align: right">
					<a href="Find_Id.do">아이디</a> <a
						style="text-decoration-line: none;"> / </a> <a href="Find_PW.do">비밀번호</a>
					<a style="text-decoration-line: none;"> 찾기</a>
				</h3>
				<h3 style="text-align: right">
					<a href="Sing_Up.do">회원가입</a>
				</h3>
			</div>
		</form>
	</div>
	<%
	
	boolean connection = false;
		boolean temp = false;
		String DB_id = null;
		String DB_pw = null;
		String DB_name = null;
		user_info info = null;
		//Sing_In 에서 ID / Password 받아오기
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		String sql = "select user_id, user_pw, user_name from user_info";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		if (id != null) {
			temp = true;
		}

		if (temp) { // 입장 시 alert창 방지
			while (rs.next()) {
		DB_id = rs.getString("user_id");
		DB_pw = rs.getString("user_pw");
		DB_name = rs.getString("user_name");

		if (DB_id.equals(id) && DB_pw.equals(pw)) {
			connection = true; //ID PW 같으면 로그인
			info = new user_info(DB_id, DB_pw, DB_name);
			break;
		}
			}
			if (connection) { //로그인 완료 시                
		session.setAttribute("user_name", info.getUser_Name());
		session.setAttribute("user_id", info.getUser_ID());
		System.out.println("로그인 성공");
		out.println("<script>");
		out.println("location.href = 'index.jsp'");
		out.println("</script>");
			} else {
		out.println("<script>");
		out.println("alert('로그인 실패')");
		out.println("history.back()");
		out.println("</script>");
			}
		}
	%>
</body>
</html>