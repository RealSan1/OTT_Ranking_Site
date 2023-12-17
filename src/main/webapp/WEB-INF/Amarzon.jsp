<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dopetrope by HTML5 UP</title>
<meta charset="utf-8" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="right-sidebar is-preload">
	<%@include file="connectDB.jsp"%>
	<div id="page-wrapper">

		<!-- Header -->
		<section id="header">
			<%@ include file="/head.jsp"%>
		</section>

		<!-- Main -->
		<section id="main">
			<div class="container">
				<div class="row">
					<div class="col-8 col-12-medium">

						<!-- Content Start -->
						<article class="box post">
							<a class="image featured"><img src="images/pic01.jpg" alt="" /></a>
							<header>
								<%
								Date date = null;
								date = new Date();
								SimpleDateFormat dates = new SimpleDateFormat("yyyy-MM-dd");
								String strDate = dates.format(date);
								if (conn != null && !conn.isClosed()) {
								%>
								<h2>Amarzon Top 10</h2>
							</header>
							<strong><%=strDate%></strong> <br> <br>
							<!-- Content End -->

							<!-- Accordion Start -->
							<div class="accordion" id="accordionPanelsStayOpenExample">
								<%
								String content = null;
								ArrayList<String> AMZTitles = (ArrayList) session.getAttribute("AMZ");
								for (int i = 0; i < AMZTitles.size(); i++) {
									String result = AMZTitles.get(i);
									//DB에서 Story 가져오기
									String sql = "select tv_content from tv where tv_name = '" + result + "'";
									Statement stmt = conn.createStatement();
									ResultSet rs = stmt.executeQuery(sql);

									if (rs.next()) {
										// 결과가 있을 때만 content 변수에 값을 할당
										content = rs.getString("tv_content");
									} else {
										// 결과가 없을 경우 "임시" 값을 할당
										content = "Input DB";
									}
								%>
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button collapsed" type="button"
											data-bs-toggle="collapse"
											data-bs-target="#netflix-collapse<%=i%>"
											aria-expanded="false" aria-controls="netflix-collapse<%=i%>"
											style="background-color: rgb(34, 30, 31)">
											#<%=i + 1%>
											<%=result%>
										</button>
									</h2>
									<div id="netflix-collapse<%=i%>"
										class="accordion-collapse collapse">
										<div class="accordion-body">
											<h1>
												Title :
												<%=result%>
												<%
												if (status == true)
													out.println("<button onclick=\"bookmarkClick('" + result + "','" + id + "')\" type=\"button\" class=\"btn btn-primary btn-sm\" style=\"background-color: rgb(34, 30, 31); margin-left: 10px; -bs-btn-padding-y: .20rem; - -bs-btn-padding-x: .5rem; - -bs-btn-font-size: .75rem;\">BookMark</button>");

												%>
											</h1>
											<a><%=content%></a>
										</div>
									</div>
								</div>
								<%
								} } else {
                                    response.sendRedirect("FailPage.do");
                                }
								%>
								<script>
								function bookmarkClick(result, id) {
								    var currentURL = "Amarzon.do"; // 현재 페이지의 URL 가져오기

								    // 여기서 currentURL 값을 원하는대로 활용하여 전달하거나,
								    // 필요한 경우 encodeURIComponent 등을 사용하여 URL 파라미터에 추가할 수 있습니다.
								    window.location.href = 'AddBookmark.do?result=' + encodeURIComponent(result) + '&user_id=' + encodeURIComponent(id) + '&current_url=' + encodeURIComponent(currentURL);
								}

								</script>
							</div>
							<!-- Accordion End -->
						</article>
					</div>

					<div class="col-4 col-12-medium">

						<!-- Sidebar Start -->
						<section class="box">
							<header>
								<h3 onclick="location.href='Popularity.jsp'">Popularity</h3>
							</header>
							<p>Today Top 10</p>
							<ul class="divided">
								<%
								String txt =null;
								 ArrayList<String> populTitles = (ArrayList)session.getAttribute("titles");
									for(int i=0; i<populTitles.size(); i++){
										txt = populTitles.get(i);
									
								%>
									<li style="font-size: 15px; color: black"><%=i+1 %>. <%=txt %></li>
								<%
								}
								%>
							</ul>
						</section>

						<!-- Sidebar End-->
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
</body>
</html>