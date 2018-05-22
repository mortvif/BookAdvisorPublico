
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<html lang="es">
<head>
<title>BookAdvisor</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">
<link rel="icon" type="image/png" href=images/logo.png>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="layout/styles/style.css" rel="stylesheet" type="text/css"
	media="all">

<script src="layout/scripts/index.js"></script>
</head>
<body id="top">

	<%@ include file="header.jsp"%>
	<%@ include file="loginform.jsp"%>
	<%@ include file="signupform.jsp"%>

	<div class="wrapper row0 bgded"
		style="background-image: url('images/portrait_book.jpeg');">
		<div id="pageintro" class="hoc clear">

			<p>Busca tus libros favoritos y comenta sobre ellos.</p>
			<%@include file="basicsearchform.jsp"%>

		</div>
	</div>

	<div class="wrapper row3">
		<main class="hoc container clear">
		<h2>Libros mejor valorados por los usuarios:</h2>

		<ul class="nospace group center">
			<c:forEach items="${best_books}" var="book" varStatus="loop">
				<c:if test="${loop.index == 0}">
					<li class="one_quarter first btmspace-10">
				</c:if>

				<c:if test="${loop.index > 0 }">
					<li class="one_quarter  btmspace-10">
				</c:if>
				<article class="block">
				<form action="BookDetailServlet" method="get">
					<a href="javascript:;" onclick="parentNode.submit();"><img
						class="recomendados" src="images/covers/${book.getCoverPath()}"
						alt="Libro 1"></a> <input type="hidden" name="isbn"
						value="${book.getIsbn()}">
				</form>

				<a href="bookdetails.jsp"></a> <br>
				<h5>${book.getTitle()}</h5>
				</article>
				</li>
			</c:forEach>
		</ul>
		<h2>Novedades de las editoriales:</h2>

		<ul class="nospace group center">
			<c:forEach items="${publisher_books}" var="book" varStatus="loop">
				<c:if test="${loop.index == 0}">
					<li class="one_quarter first btmspace-10">
				</c:if>

				<c:if test="${loop.index > 0 }">
					<li class="one_quarter  btmspace-10">
				</c:if>
				<article class="block">
				<form action="BookDetailServlet" method="get">
					<a href="javascript:;" onclick="parentNode.submit();"><img
						class="recomendados" src="images/covers/${book.getCoverPath()}"
						alt="Libro 1"></a> <input type="hidden" name="isbn"
						value="${book.getIsbn()}">
				</form>

				<a href="bookdetails.jsp"></a> <br>
				<h5>${book.getTitle()}</h5>
				</article>
				</li>
			</c:forEach>
		</ul>

		<div class="clear"></div>
		</main>



	</div>







	<div class="wrapper row4">
		<footer id="footer" class="hoc clear">
		<div class="one_third first">
			<h6 class="title">Información de contacto</h6>
			<ul class="nospace linklist contact">
				<li><i class="fa fa-map-marker"></i>
					<address>Escuela Técnica Superior de Telecomunicaciones</address></li>
				<li><i class="fa fa-phone"></i>(123) 456 789<br></li>
				<li><i class="fa fa-fax"></i> (123) 456 789</li>
				<li><i class="fa fa-envelope-o"></i> info@bookadvisor.com</li>
			</ul>
		</div>

		</footer>
	</div>


	<div class="wrapper row5">
		<div id="copyright" class="hoc clear">
			<p class="fl_left">
				Copyright &copy; 2018 - All Rights Reserved - <a href="#">BookAdvisor</a>
			</p>
			<p class="fl_right">
				Thanks to <a target="_blank" href="http://www.os-templates.com/"
					title="Free Website Templates">OS Templates</a>
			</p>
		</div>
	</div>


	<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
	<!-- JAVASCRIPTS -->
	<script src="layout/scripts/jquery.min.js"></script>
	<script src="layout/scripts/jquery.backtotop.js"></script>
	<!-- IE9 Placeholder Support -->
	<script src="layout/scripts/jquery.placeholder.min.js"></script>
	<!-- / IE9 Placeholder Support -->
</body>
</html>