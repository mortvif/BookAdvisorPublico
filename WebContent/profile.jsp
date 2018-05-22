
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>

<html>
<head>
<title>BookAdvisor</title>
<meta charset="utf-8">
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
	<!-- ficha libro-->
	<div class="wrapper row3">
		<main class="hoc container clear">

		<div class="content">
			<c:if test="${user.getProfilePicPath() == null}">
				<img class="imgl  one_quarter first profile"
					src="images/demo/avatar.png" alt="Foto perfil">
			</c:if>
			<c:if test="${user.getProfilePicPath() != null}">
				<img class="imgl  one_quarter first profile"
					src="images/profilepics/${user.getProfilePicPath()}"
					alt="Foto perfil">
			</c:if>
			<div class="info three_quarter">
				<h1>Perfil de usuario de : ${user.getUsername()}</h1>

				<!-- 	             <p>Apellidos:</p> -->
				<p>Tipo de perfil: ${user.getRole()}</p>
				<p>Email: ${user.getMail()}</p>
				<!-- 	                <p>Página web:</p> -->

				<p>Dirección: ${user.getAddress()}</p>
				<!-- 	                <p>Teléfono de contacto:</p> -->
				<br>

				<!-- intercambios -->
				<h3>Intercambios</h3>
				<hr>
				<div class="comments" style="margin-top: 0px; !important">
					<ul>
						<c:if test="${user_exchanges != null}">
						<c:forEach items="${user_exchanges}" var="e" varStatus="status"> 
						
								<li><article>
									<header>
										<address>
											<p style="color:#DFA94F;"><b>Intercambio del libro ${e.getBookRequested().getTitle()}</b></p>
										</address>
									</header>
									<div class="comcont">
										<p><b>Libro ofrecido:</b> ${e.getBookRequested().getTitle()}</p>								
										<p><b>Libro deseado:</b> ${e.getDescription()}</p>
										<p><b>Fecha de creación:</b> ${e.getCreatedAt()}</p>
										<p><b>Creado por:</b> ${e.getRequester().getUsername()} (${e.getRequester().getMail()})</p>																										
										<c:if test="${e.getAccepter() != null}">
											<p><b>Estado:</b> Aceptado por ${e.getAccepter().getUsername()} (${e.getAccepter().getMail()})</p>
										</c:if>
										<c:if test="${e.getAccepter() == null}">
											<p><b>Estado:</b> Pendiente de aceptación</p>
											<form action="DeleteExchange" method="get">
												<input type="hidden" name="exchangeid" value="${e.getId()}">										
												<button type="submit">Eliminar</button>																	
											</form>	
										</c:if>
									</div>
								</article></li>
						</c:forEach>
						</c:if>

					</ul>

				</div>
				<!-- end intercambios -->

				<!-- comentarios -->
				<h3>Comentarios</h3>
				<hr>
				<div class="comments" style="margin-top: 0px; !important">
					<ul>
					<c:forEach items="${user_reviews}" var="r">
						<li><article>
								<header>

									<address>
										<p style="color:blue;"><b>Comentario en:</b> ${r.getBookReviewed().getTitle()}</p>
									</address>
									<time datetime="2045-04-06T08:15+00:00"><b>Fecha:</b> ${r.getCreatedAt()}</time>

								</header>
								<div class="comcont">
									<p><b>Comentario: </b>${r.getReview()}</p>

										<form action=DeleteComment method="get">
											<input type="hidden" name="reviewid" value="${r.getId()}">										
											<button type="submit">Eliminar</button>																	
										</form>	
										
								</div>
							</article></li>
					</c:forEach>


					</ul>

				</div>
				<!-- end comentarios -->









			</div>

			<div class="clear"></div>
		</main>
	</div>

	<!--footer-->
	<div class="wrapper row4">
		<footer id="footer" class="hoc clear">
			<div class="one_third first">
				<h6 class="title">Información de contacto</h6>
				<ul class="nospace linklist contact">
					<li><i class="fa fa-map-marker"></i>
						<address>Escuela Técnica Superior de Telecomunicaciones
						</address></li>
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

	<!-- end footer-->

	<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
	<!-- JAVASCRIPTS -->
	<script src="layout/scripts/jquery.min.js"></script>
	<script src="layout/scripts/jquery.backtotop.js"></script>
	<!-- IE9 Placeholder Support -->
	<script src="layout/scripts/jquery.placeholder.min.js"></script>
	<!-- / IE9 Placeholder Support -->
</body>
</html>




