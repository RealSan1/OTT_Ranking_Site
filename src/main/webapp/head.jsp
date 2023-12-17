<%@page import="java.lang.ProcessHandle.Info"%>
<%@page import="ex.user_info.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<style>
#change a:hover {
	color: blue;
}
</style>
</head>
<body>
	<%
	boolean status = false;
	String user_name = null;
	user_name = (String) session.getAttribute("user_name");
	String id = (String) session.getAttribute("user_id");
	if (user_name == null) {
		status = false;
	} else {
		status = true;
	}
	%>

		<%
	if (status == true) { //로그인 시 유저이름 출력
		String name = user_name;
		out.println("<div id='change'>");
		out.println("<a style='position: relative; left:800px; text-decoration-line: none;'>" + name + "</a>");
		out.println("<a href='logout.do' style='position: relative; left:830px; text-decoration-line: none;'>Logout</a>");
		out.println("</div>");
	} else {
		out.println("<div id='change'>");
		out.println("<a href='Sing_In.do' style='position: relative; left:800px; text-decoration-line: none;'>Sing in</a>");
		out.println("<a href='Sing_Up.do' style='position: relative; left:830px; text-decoration-line: none;'>Sing Up</a>");
		out.println("</div>");
	}
	%>

	<!-- Logo -->
	<h1>

		<a href="index.jsp">OTT Ranking</a>
	</h1>
	<!-- Logo End-->
	
	<!-- Nav -->
	<nav id="nav">
		<ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="#">OTT Top 10</a>
				<ul>
					<li><a href="NetFlix.do">NetFilx</a></li>
					<li><a href="Disney.do">Disney +</a></li>
					<li><a href="Hbo.do">HBO</a></li>
					<li><a href="Amarzon.do">Amarzon Prime</a></li>
				</ul></li>
			<li><a href="Box-Office.do">Box Office Top 10</a></li>
			<li><a href="Popularity.do">Popularity</a></li>
			<li><a href="mybookmark.do">My Bookmark</a></li>
		</ul>
	</nav>
	<!-- Nav End-->

</body>
</html>