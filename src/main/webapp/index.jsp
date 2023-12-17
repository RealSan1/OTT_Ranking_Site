<%@page import="java.util.ArrayList"%>
<%@page import="org.jsoup.Jsoup, org.jsoup.nodes.*, org.jsoup.select.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE HTML>
<html>
<head>
<title>OTT Ranking</title>
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

<body class="homepage is-preload">
	<%
	ArrayList<String> NetFlix_Array = new ArrayList<String>();
	ArrayList<String> Disney_Array = new ArrayList<String>();
	ArrayList<String> Amazon_Array = new ArrayList<String>();
	ArrayList<String> HBO_Array = new ArrayList<String>();
	ArrayList<String> title_array = new ArrayList<String>();
	Document doc = Jsoup.connect("https://flixpatrol.com/top10/").get();
	Document doc1 = Jsoup.connect("https://flixpatrol.com/popular/").get();
	String query = "-2 > div.-mx-content > div > div > table > tbody > tr > td.table-td.w-1\\/2 > a > div:nth-child(2)";
	
	Elements titles = doc1.select("body > div:nth-child(4) > div > div > table > tbody > tr > td.table-td.w-full.md\\:w-2\\/3 > a > div:nth-child(2) > div.group-hover\\:underline");

	Elements Netflix_Titles = doc.select("#netflix" + query);


	Elements Disney_Titles = doc.select("#disney" + query);

	Elements HBO_Titles = doc.select("#hbo" + query);

	Elements AMZ_Titles = doc.select("#amazon-prime" + query);
	

	System.out.println(AMZ_Titles);
	for (int i = 0; i < Netflix_Titles.size(); i++) {
		//넷플릭스
		Element Net_title = Netflix_Titles.get(i);
		
		NetFlix_Array.add(Net_title.text());

		//디즈니
		Element Dis_title = Disney_Titles.get(i);
		Disney_Array.add(Dis_title.text());

		//HBO
		Element HBO_title = HBO_Titles.get(i);
		HBO_Array.add(HBO_title.text());

		//아마존
		Element AMZ_title = AMZ_Titles.get(i);
		Amazon_Array.add(AMZ_title.text());
		
		//인기
		Element title = titles.get(i);
        title_array.add(title.text());  // text() 메서드를 사용하여 요소의 텍스트를 가져옴
        
    	session.setAttribute("Netflix", NetFlix_Array);
    	session.setAttribute("Disney", Disney_Array);
    	session.setAttribute("Hbo", HBO_Array);
    	session.setAttribute("AMZ", Amazon_Array);
    	session.setAttribute("titles", title_array);
	}

	%>
	<div id="page-wrapper">

		<!-- Header -->
		<section id="header">
			<%@ include file="head.jsp"%>

			<!-- Banner -->
			<section id="banner">
				<header style="background-color: rgb(34, 30, 31)">

					<!-- Update 버튼 -->
					<!-- 					<button type="button" class="btn btn-secondary" -->
					<!-- 						onclick="location.href='Get_Title.jsp'" -->
					<!-- 						style="position: absolute; right: 10px; top: 20px;">Ranking -->
					<!-- 						Update</button> -->

					<table>
						<thead>
							<tr>
								<th scope="col" style="color: white;">NetFilx</th>
							</tr>
						</thead>
						<tbody>
							<%
							//ArrayList<String> NetTitles = (ArrayList) session.getAttribute("Netflix");
							for (int i = 0; i < NetFlix_Array.size(); i++) {
								String result = NetFlix_Array.get(i);
							%>
							<tr>
								<th scope="row" style="color: white;"><%=i + 1%></th>
								<td style="color: white;"><%=result%></td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</header>
			</section>

			<!-- Intro -->
			<section id="intro" class="container">
				<div class="row">
					<div class="col-4 col-12-medium">
						<section class="first">
							<table>
								<thead>
									<tr>
										<th scope="col">Disney +</th>
									</tr>
								</thead>
								<tbody>
									<%
									//ArrayList<String> DisTitles = (ArrayList) session.getAttribute("Disney");
									for (int i = 0; i < Disney_Array.size(); i++) {
										String result = Disney_Array.get(i);
									%>
									<tr>
										<th scope="row"><%=i + 1%></th>
										<td><%=result%></td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</section>
					</div>
					<div class="col-4 col-12-medium">
						<section class="middle">
							<table>
								<thead>
									<tr>
										<th scope="col">HBO</th>
									</tr>
								</thead>
								<tbody>
									<%
									//ArrayList<String> HboTitles = (ArrayList) session.getAttribute("Hbo");
									for (int i = 0; i < HBO_Array.size(); i++) {
										String result = HBO_Array.get(i);
									%>
									<tr>
										<th scope="row"><%=i + 1%></th>
										<td><%=result%></td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</section>
					</div>
					<div class="col-4 col-12-medium">
						<section class="last">
							<table>
								<thead>
									<tr>
										<th scope="col">Amzone_Prime</th>
									</tr>
								</thead>
								<tbody>
									<%
									//ArrayList<String> AMZTitles = (ArrayList) session.getAttribute("AMZ");
									for (int i = 0; i < Amazon_Array.size(); i++) {
										String result = Amazon_Array.get(i);
									%>
									<tr>
										<th scope="row"><%=i + 1%></th>
										<td><%=result%></td>
									</tr>
									<%
									}
									%>

								</tbody>
							</table>
						</section>
					</div>
				</div>
			</section>

		</section>
	</div>

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>