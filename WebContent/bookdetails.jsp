<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>





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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script src="layout/scripts/index.js"></script>
</head>
<body id="top">
	<%@ include file="header.jsp"%>

	<%@include file="loginform.jsp"%>
	<%@include file="signupform.jsp"%>

	<!-- ficha libro-->
	<div class="wrapper row3">
		<main class="hoc container clear">

		<div class="content three_quarter first">

			<img class="imgl caratula one_third first"
				src="images/covers/${book.getCoverPath()}" alt="CarÃ¡tula">
			<div class="info two_quarter">
				<h1>${book.getTitle()}</h1>

				<p><b>Autor:</b> ${book.getAuthor()}</p>
				<p><b>Editorial:</b> ${book.getPublisher()}</p>
				<p><b>Categoría:</b> ${book.getGenre()}</p>

				<p><b>Fecha de publicación:</b> ${book.getPublishDate()}</p>

				<p><b>ISBN:</b> ${book.getIsbn()}</p>

				<p><b>Formato:</b> ${book.getFormat()}</p>
				<p><b>Calificación:</b> ${book.getRating()} (calificado
					${book.getnRated()} veces)

				<c:if test="${ book.getRating() == 0}">
					<span class="fa fa-star"></span>
					<span class="fa fa-star"></span>
					<span class="fa fa-star"></span>
					<span class="fa fa-star"></span>
					<span class="fa fa-star"></span>

				</c:if>

				<c:if test="${ book.getRating() == 1}">
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star"></span>
					<span class="fa fa-star"></span>
					<span class="fa fa-star"></span>
					<span class="fa fa-star"></span>

				</c:if>

				<c:if test="${ book.getRating() == 2}">
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star"></span>
					<span class="fa fa-star"></span>
					<span class="fa fa-star"></span>

				</c:if>

				<c:if test="${ book.getRating() == 3}">
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star"></span>
					<span class="fa fa-star"></span>

				</c:if>

				<c:if test="${ book.getRating() == 4}">
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star"></span>

				</c:if>

				<c:if test="${ book.getRating() == 5}">
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>

				</c:if>
				
				</p>
				
 				<p><b>Resumen/Sinopsis:</b> </p>
				<c:if test="${book.getSynopsis().length() >= 100}">
					${book.getSynopsis().substring(0,99)} ....
					<button type="button" class="btn btn-primary"
							data-target="#seeSynopsis" data-toggle="modal"
							style="margin: 10px; font-size: 10px;">Ver Completa</button> 
							
	 
					<div class="modal fade" id="seeSynopsis" tabindex="1" role="dialog"
						aria-hidden="true">
						<div class="modal-dialog modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">
										<b>Sinopsis/Resumen de: ${book.getTitle()}</b>
									</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Cerrar">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
										${book.getSynopsis()}							
								</div>
	
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</c:if>
 	
 				<c:if test="${book.getSynopsis().length() < 100}">
									${book.getSynopsis()}
				</c:if>
 				



				<div class="modal fade" id="addexchange" tabindex="-1" role="dialog"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">
									<b>Añadir intercambio</b>
								</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Cerrar">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<p><b>AVISO: Al añadir un intercambio autoriza a esta plataforma a comunicar su email a aquellos usuarios que acepten el intercambio.</b></p>
								<form action="ExchangeServlet" method="get">
									<input type="hidden" name="isbn" id="isbn" value="${book.getIsbn()}">
									<label for="exchange">Añada los libros que ofrece en el
										intercambio (un libro por línea)<span>*</span>
									</label>
									<textarea name="exchange" id="exchange" rows="3" cols="40"
										placeholder="Libro que deseo recibir a cambio"></textarea>
									<br> <input type="submit" value="Enviar">

								</form>
							</div>

						</div>
					</div>
				</div>
				<div class="clear"></div>


			</div>
			<!-- end ficha-->

			<!-- intercambios-->

			<div class="sidebar one_quarter first">
				<h5>Intercambios de libros</h5>
				<c:if test="${user != null}">
					<button type="button" class="btn btn-primary"
						data-target="#addexchange" data-toggle="modal"
						style="margin: 10px; font-size: 10px;">Añadir intercambio</button>
				</c:if>

				<div class="dropdown show">
					<a href="#" role="button" id="dropintercambios"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="fa fa-list"></i> Ordenar por:
					</a>

					<div class="dropdown-menu" aria-labelledby="dropintercambios">
						<a class="dropdown-item" href="#"> Nombre ascendente</a><br>
						<a class="dropdown-item" href="#"> Más reciente</a>
					</div>
				</div>
				<br>
				<nav class="sdb_holder ofertas">
				<ul>
					<c:if test="${user != null}">
						<c:if test="${book.getExchanges() != null}">
							<c:forEach items="${book.getExchanges()}" var="exchange"
								varStatus="status">
								
								<c:if test="${exchange.getAccepter() == null }">
																
									<li><a href="#">Oferta de: ${exchange.getRequester().getUsername()}</a> <!-- Button trigger modal -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#oferta${status.index}"
											style="font-size: 11px;">Ver oferta</button> <!-- Modal -->
										
										<div class="modal fade" id="oferta${status.index}" tabindex="1" role="dialog"
											aria-hidden="true">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">
															<b>Oferta de intercambio</b>
														</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Cerrar">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<p><b>Libro ofrecido:</b> ${book.getTitle()}</p>
														<p><b>Usuario:</b> ${exchange.getRequester().getUsername()}</p>
														<p><b>Fecha de creación:</b> ${exchange.getCreatedAt()}</p>
														<p><b>Libros solicitados para intercambio:</b></p>
														<p>${exchange.getDescription()}</p>														
													</div>
													
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal" style="font-size: 11px;">Cerrar</button>
														<button type="button" class="btn btn-primary"
															style="font-size: 11px;" data-toggle="modal"
															data-target="#offerdetail${status.index}" data-dismiss="modal">Aceptar
															intercambio</button>
													</div>
												</div>
											</div>
										</div>
										
										<div class="modal fade" id="offerdetail${status.index}" tabindex="1"
											role="dialog" aria-hidden="true">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">
															<b>Detalles de intercambio</b>
														</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Cerrar">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<p>Para realizar el intercambio de cualquier libro
															interesado debe contactar personalmente con la persona
															interesada por email</p>
														<br>
														<p>Email de contacto: ${exchange.getRequester().getMail()}</p>
	
	
													</div>
													<div class="modal-footer">
														<input type="button" class="btn btn-secondary"
															data-dismiss="modal" style="font-size: 11px; margin-top:18px;" value="Cerrar">
														<form action="AcceptExchangeServlet" method="get">
															<input type="hidden" name="exchange_id" id="exchange_id" value="${exchange.getId()}">
															<br> <input type="submit" class="btn btn-primary"
															style="font-size: 11px;" data-toggle="modal"
															data-target="#offerdetail" value="Aceptar">
	
														</form>
														<!-- <button type="button" class="btn btn-primary"
															style="font-size: 11px;" data-toggle="modal"
															data-target="#offerdetail">Aceptar</button> -->
													</div>
												</div>
											</div>
										</div> <br></li>
									
								</c:if>
									
							</c:forEach>
						</c:if>
					</c:if>
				</ul>

				</nav>

			</div>
			<!-- end intercambios-->

			<!-- comentarios-->
			<div id="comments" class="three_quarter comments">
				<h2>Comentarios</h2>
				<ul>
					<c:forEach items="${book.getReviews()}" var="r">
						<li><article> <header> <figure
								class="avatar"> <c:if
								test="${r.getAuthor().getProfilePicPath() == null}">
								<img src="images/demo/avatar.png" alt="Foto de Perfil">
							</c:if> <c:if test="${r.getAuthor().getProfilePicPath() != null}">
								<img src="images/profilepics/${r.getAuthor().getProfilePicPath()}" alt="">
							</c:if> </figure>
							<address>
								<a href="#">${r.getAuthor().getUsername()}</a>
							</address>
							<time datetime="2045-04-06T08:15+00:00">${r.getCreatedAt()}</time>
							</header>
							<div class="comcont">
								<p>${r.getReview()}</p>
							</div>
							</article></li>
					</c:forEach>


				</ul>
				<c:if test="${user != null && user.isReader()}">
					<h2>Escribe tu comentario</h2>
					<%@include file="commentsform.jsp"%>
				</c:if>
			</div>
		</div>

		<!-- end comentarios--> <!-- ierias-->
		<div class="sidebar one_quarter librerias">
			<h5>Librerias cercanas</h5>
			<div class="dropdown show">
				<a href="#" role="button" id="droplibrerias" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> <i
					class="fa fa-list"></i> Ordenar por:
				</a>

				<div class="dropdown-menu" aria-labelledby="droplibrerias">
					<a class="dropdown-item" href="#"> Nombre descendente</a><br>
					<a class="dropdown-item" href="#"> Precio menos a mas</a>
				</div>
			</div>
			<br>
			<nav class="sdb_holder">
			<ul>
				<li><a href="#">Libreria 1</a>
				<li style="margin-left: 50px;">Precio: <i class="fa fa-euro"></i></li>
				</li>

				<li><a href="#">Libreria 2</a>
				<li style="margin-left: 50px;">Precio: <i class="fa fa-euro"></i></li>

				</li>
				<li><a href="#">Libreria 3</a>
				<li style="margin-left: 50px;">Precio: <i class="fa fa-euro"></i></li>

				</li>
			</ul>

			</nav>

		</div>
		<!-- end librerias--> <!-- bibliotecas-->


		<div class="sidebar one_quarter">
			<h5>Bibliotecas cercanas</h5>
			<div class="dropdown show">
				<a href="#" role="button" id="dropbibliotecas"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fa fa-list"></i> Ordenar por:
				</a>

				<div class="dropdown-menu" aria-labelledby="dropbibliotecas">
					<a class="dropdown-item" href="#"> Nombre ascendente</a><br> <a
						class="dropdown-item" href="#"> Mas cercana</a>
				</div>
			</div>
			<br>
			<nav class="sdb_holder">
			<ul>
				<li><a href="#">Bibiloteca 1</a> <!-- <i class="fa fa-map-pin"></i> -->
				<li style="margin-left: 50px;">Direccion:</li>
				</li>
				<li><a href="#">Bibiloteca 2</a><!--  <i class="fa fa-map-pin"></i> -->
				<li style="margin-left: 50px;">Direccion:</li>
				</li>
				<li><a href="#">Bibiloteca 3</a> <!-- <i class="fa fa-map-pin"></i> -->
				<li style="margin-left: 50px;">Direccion:</li>
				</li>
			</ul>

			</nav>

		</div>


		<!-- end bibliotecas -->
		<div class="clear"></div>
		</main>
	</div>

	<!--footer-->
	<div class="wrapper row4">
		<footer id="footer" class="hoc clear">
		<div class="one_third first">
			<h6 class="title">Informacion de contacto</h6>
			<ul class="nospace linklist contact">
				<li><i class="fa fa-map-marker"></i>
					<address>Escuela Tecnica Superior de Telecomunicaciones
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
