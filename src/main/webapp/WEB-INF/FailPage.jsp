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

				<!-- Content -->
				<header>
					<h1>DB connection failed</h1>
					<a>Please check the database</a>
				</header>


		</section>

	</div>



	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>