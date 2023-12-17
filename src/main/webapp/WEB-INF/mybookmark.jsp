<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.jsoup.Jsoup, org.jsoup.nodes.*, org.jsoup.select.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Dopetrope by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />

<style>
#Change:hover {
	color: rgb(220, 20, 60);
}
</style>
</head>
<body class="no-sidebar is-preload">
	<%@include file="connectDB.jsp"%>
	<div id="page-wrapper">

		<!-- Header -->
		<section id="header">
			<%@ include file="/head.jsp"%>
		</section>

		<!-- Main -->
		<section id="main">
			<div class="container">

				<%
				if (id != null){
				%>
				<!-- Content -->
				<article class="box post">
					<a href="#" class="image featured"><img src="images/pic01.jpg"
						alt="" /></a>
					<header>
						<h1><%=user_name%>'s Bookmark
						</h1>
					</header>

					<%
					String sql = "select tv_name from bookmark where user_id = '" + id + "'";
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(sql);
					String name = null;
					ArrayList<String> names = new ArrayList<String>();
					while (rs.next()) {
						name = rs.getString("tv_name");
						names.add(name);
					}
					%>
					<table>
						<tbody>
							<%
							//ArrayList<String> NetTitles = (ArrayList) session.getAttribute("Netflix");
							for (int i = 0; i < names.size(); i++) {
								String result1 = names.get(i);
								//DB에서 Story 가져오기
								String content1 = null;
								String sql1 = "select tv_content from tv where tv_name = '" + result1 + "'";
								Statement stmt1 = conn.createStatement();
								ResultSet rs1 = stmt1.executeQuery(sql1);

								if (rs1.next()) {
									// 결과가 있을 때만 content 변수에 값을 할당
									content1 = rs1.getString("tv_content");
								} else {
									// 결과가 없을 경우 "임시" 값을 할당
									content1 = "Input DB";
								}
							%>
							<tr>
								<td style="color: black;"><%=result1%></td>
								<th name="name" style="color: black; font-size: 15px"><%=content1%></th>
								<form action="DelBookmark.do" method="post">
									<input type="hidden" name="itemName" value="<%=result1%>">
									   <input type="hidden" name="user_id" value="<%=id%>">
									<th id="Change" onclick="submitForm(<%=i%>)"
										style="color: black; font-size: 15px; text-decoration-line: none; cursor: pointer;">delete</th>
								</form>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</article>
				<%
				} else{
				%>
				<header>
					<h1>Login</h1>
					<a>To access your account, please identify yourself by
						providing the information requested in the fields below, then
						click "Sing in". </a><br> <a>If you are not registered yet,
						click "Sing Up" and follow the instructions to create an account.</a>
				</header>
				<%
				}
				%>
			</div>
		</section>

	</div>

	<script>
		function submitForm(i) {
			//삭제할 제목 넘기기
			document.forms[i].submit();
		}
	</script>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>