<%@page import="ex.user_info"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sing_Up</title>
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
		<h2>회원가입</h2>
		<form action="#">
			<div class="input-box">
				<input type="text" placeholder="아이디" required name="id"
					autofocus="autofocus">
			</div>
			<div class="input-box">
				<input type="text" placeholder="이름" required name="name">
			</div>
			<div class="input-box">
				<input type="password" placeholder="패스워드" required name="pw">
			</div>
			<div class="input-box">
				<input type="text" placeholder="이메일" required name="email">
			</div>
			<div class="input-box">
				<input type="text" placeholder="생년월일" required name="birth">
			</div>
			<div class="input-box button">
				<input type="submit" value="회원가입">
			</div>
			<div class="text">
				<h3 style="text-align: right">
					계정이 있나요? <a href="Sing_In.do">Login now</a>
				</h3>
			</div>
		</form>
	</div>

	<%
	boolean temp = false;
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String birth = request.getParameter("birth");

	PreparedStatement pstat = null;

	String sql = "insert into user_info values (?,?,?,?,?)";
	if (id != null) {
	    temp = true;
	}

	if (temp) { // 입장 시 alert창 방지
	    try {
	        pstat = conn.prepareStatement(sql);
	        pstat.setString(1, id);
	        pstat.setString(2, pw);
	        pstat.setString(3, name);
	        pstat.setString(4, email);
	        pstat.setString(5, birth);
	        pstat.executeUpdate();
            response.getWriter().write("<script>");
            response.getWriter().write("window.location.href = 'index.jsp'");
            response.getWriter().write("</script>");
	    } catch (SQLException e) {
	        // SQLException 처리
	        e.printStackTrace(); // 또는 다른 예외 처리 방법 사용
	        out.println("<script>");
			out.println("alert('등록된 계정')");
			out.println("</script>");
	    } 
	    
	}

	%>
</body>
</html>