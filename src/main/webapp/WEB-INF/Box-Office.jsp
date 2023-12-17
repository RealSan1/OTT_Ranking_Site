<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="org.jsoup.Jsoup, org.jsoup.nodes.*, org.jsoup.select.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Box Office</title>
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
								Document doc = null;
								Date date = null;
								date = new Date();
								SimpleDateFormat dates = new SimpleDateFormat("yyyy-MM-dd");
								String strDate = dates.format(date);

								ArrayList<String> title_array = new ArrayList<String>();
								ArrayList<String> percent_array = new ArrayList<String>();
								doc = Jsoup.connect("http://www.cgv.co.kr/movies/?lt=1&ft=0").get();
								Elements titles = doc.select("div.box-contents strong.title");
								Elements percents = doc.select("div.box-contents div.score strong.percent span");
								for (int i = 0; i < titles.size(); i++) {
									Element title = titles.get(i);
									title_array.add(title.toString());
									Element percent = percents.get(i);
									percent_array.add(percent.toString());

								}
								%>

								<h2>Box Office</h2>
							</header>
							<strong><%=strDate%> Top 10</strong> <br> <br>
							<!-- Content End -->

							<!-- Accordion Start -->
							<article class="box post">
								<table>
									<thead>
										<tr>
											<th scope="col">#</th>
											<th scope="col">Title</th>
											<th scope="col">예매율</th>
										</tr>
									</thead>
									<tbody>
										<%
										for (int i = 0; i < title_array.size(); i++) {
											String result1 = title_array.get(i);
											String pre = percent_array.get(i);
										%>
										<tr>
											<td scope="row" style="color: black;"><%=i + 1%></td>
											<td style="color: black; font-size: 15px"><%=result1%></td>
											<th style="color: black; font-size: 15px"><%=pre%></th>
										</tr>
										<%
										}
										%>

									</tbody>
								</table>
							</article>

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