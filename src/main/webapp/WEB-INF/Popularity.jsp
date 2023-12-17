<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="org.jsoup.Jsoup, org.jsoup.nodes.*, org.jsoup.select.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Popularity</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />

<style>
  .star:hover {
    color: blue !important;
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
				Date date = null;
				date = new Date();
				SimpleDateFormat dates = new SimpleDateFormat("yyyy-MM-dd");
				String strDate = dates.format(date);

				ArrayList<String> populTitles = (ArrayList) session.getAttribute("titles");
				if (conn != null && !conn.isClosed()) {
				%>
				<!-- Content -->
				<article class="box post">
					<a href="#" class="image featured"><img src="images/pic01.jpg"
						alt="" /></a>
					<header>
						<h2>Popularity Top 10</h2>
					</header>

					<%
					String sql = null;
					Statement stmt = null;
					sql = "select tv_name from bookmark where user_id = '" + id + "'";
					stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(sql);
					String name = null;
					ArrayList<String> names = new ArrayList<String>();
					user_name = (String) session.getAttribute("user_name");
					if (user_name == null) {
						status = false;
					} else {
						status = true;
					}
					while (rs.next()) {
						name = rs.getString("tv_name");
						names.add(name);
					}
					%>
					<table>
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Title</th>
								<th scope="col">Bookmark</th>
								<th scope="col">Content</th>
							</tr>
						</thead>
						<tbody>
							<%
							for (int i = 0; i < populTitles.size(); i++) {
								String result1 = populTitles.get(i).replaceAll("'", " ");
								//DB에서 Story 가져오기
								String content = null;
								String sql1 = "select tv_content from tv where tv_name = '" + result1 + "'";
								Statement stmt1 = conn.createStatement();
								ResultSet rs1 = stmt1.executeQuery(sql1);

								if (rs1.next()) {
									// 결과가 있을 때만 content 변수에 값을 할당
									content = rs1.getString("tv_content");
								} else {
									// 결과가 없을 경우 "임시" 값을 할당
									content = "Input DB";
								}
							%>
							<tr>

								<td scope="row" style="color: black;"><%=i + 1%></td>
								<td style="color: black;"><%=result1%></td>
								<td style="text-align: center;">
									<%
									if (status == true) {
									%>
									<a class="star" onclick="bookmarkClick('<%=result1%>','<%=id%>')"
										style="text-decoration-line: none; font-size: 30px; color:red; margin-left: 10px; cursor:pointer;">☆</a>
									<%
									} else {
									out.println("<a class='star' onclick=\"Nclick()\" style='text-decoration-line: none; font-size: 30px; color:red; margin-left: 10px; cursor:pointer;'>☆</a>");
									}
									%>
								</td>
								<th style="color: black; font-size: 15px"><%=content%></th>
							</tr>
							<%
							}} else {
                                response.sendRedirect("FailPage.do");
                            }
							%>
						</tbody>
					</table>
				</article>

			</div>
		</section>
	</div>

	<script>
		function bookmarkClick(result, id) {
			var currentURL = "Popularity.do"; // 현재 페이지의 URL 가져오기

			// 여기서 currentURL 값을 원하는대로 활용하여 전달하거나,
			// 필요한 경우 encodeURIComponent 등을 사용하여 URL 파라미터에 추가할 수 있습니다.
			window.location.href = 'AddBookmark.do?result='
					+ encodeURIComponent(result) + '&user_id='
					+ encodeURIComponent(id) + '&current_url='
					+ encodeURIComponent(currentURL);
			alert('Success')
		}
		
		function Nclick() {
			alert('Need login');
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