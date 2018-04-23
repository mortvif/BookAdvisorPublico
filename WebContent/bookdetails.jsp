<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>





<html>
<head>
    <title>BookAdvisor</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
    <link rel="icon"
          type="image/png"
          href=images/logo.png>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="layout/styles/style.css" rel="stylesheet" type="text/css" media="all">

    <script src="layout/scripts/index.js"></script>
</head>
<body id="top">
<%@ include file = "header.jsp" %>

<%@include file="loginform.jsp"%>
<%@include file="signupform.jsp"%>

<!-- ficha libro-->
<div class="wrapper row3">
    <main class="hoc container clear">

        <div class="content three_quarter first">

            <img class="imgl caratula one_third" src="images/covers/${book.getCoverPath()}" alt="CarÃ¡tula">
            <div class="info">
                <h1>${book.getTitle()}</h1>

                <p>Autor: ${book.getAuthor()}</p>
                <p>Editorial: ${book.getPublisher()}</p>
                <p>Categoría: ${book.getGenre()}</p>

                <p>Fecha de publicación: ${book.getPublishDate()}</p>

                <p>ISBN: ${book.getIsbn()}</p>

                <p>Formato: ${book.getFormat()}</p>
                <p>Resumen/Sinopsis: ${book.getSynopsis() }
                <p>Calificación: ${book.getRating()} (calificado ${book.getnRated()} veces)</p>
                
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
                
           
            </div>
            <!-- end ficha-->

            <!-- intercambios-->
            <div class="sidebar one_quarter first">
                <h5>Intercambios de libros</h5>
                <div class="dropdown show">
                    <a href="#" role="button" id="dropintercambios"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-list"></i> Ordenar por:
                    </a>

                    <div class="dropdown-menu" aria-labelledby="dropintercambios">
                        <a class="dropdown-item" href="#"> Nombre ascendente</a><br>
                        <a class="dropdown-item" href="#"> MÃ¡s reciente</a>
                    </div>
                </div>
                <br>
                <nav class="sdb_holder">
                    <ul>
                        <li><a href="#">Oferta 1</a></li>
                        <li><a href="#">Oferta 2</a></li>
                        <li><a href="#">Oferta 3</a></li>
                    </ul>

                </nav>

            </div>
            <!-- end intercambios-->

            <!-- comentarios-->
            <div id="comments" class="three_quarter">
                <h2>Comentarios</h2>
                <ul>
                    <c:forEach items="${book.getReviews()}" var="r">
	                    <li>
	                        <article>
	                            <header>
	                                <figure class="avatar"><img src="images/demo/avatar.png" alt=""></figure>
	                                <address>
	                                    <a href="#">${r.getAuthor().getUsername()}</a>
	                                </address>
	                                <time datetime="2045-04-06T08:15+00:00">${r.getCreatedAt()}</time>
	                            </header>
	                            <div class="comcont">
	                                <p>${r.getReview()}</p></div>
	                        </article>
	                    </li>
                    </c:forEach>


                </ul>
                <c:if test="${user != null && user.isReader()}">
	                <h2>Escribe tu comentario</h2>
	                <%@include file="commentsform.jsp"%>
                </c:if>
            </div>
        </div>

        <!-- end comentarios-->

        <!-- librerias-->
        <div class="sidebar one_quarter librerias">
            <h5>LibrerÃ­as cercanas</h5>   <div class="dropdown show">
            <a href="#" role="button" id="droplibrerias"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-list"></i> Ordenar por:
            </a>

            <div class="dropdown-menu" aria-labelledby="droplibrerias">
                <a class="dropdown-item" href="#"> Nombre descendente</a><br>
                <a class="dropdown-item" href="#"> Precio menos a mÃ¡s</a>
            </div>
        </div>
            <br>
            <nav class="sdb_holder">
                <ul>
                    <li><a href="#">LibrerÃ­a 1</a>
                    <li style="margin-left: 50px;">Precio: <i class="fa fa-euro"></i></li>
                    </li>

                    <li><a href="#">LibrerÃ­a 2</a>
                    <li style="margin-left: 50px;">Precio: <i class="fa fa-euro"></i></li>

                    </li>
                    <li><a href="#">LibrerÃ­a 3</a>
                    <li style="margin-left: 50px;">Precio: <i class="fa fa-euro"></i></li>

                    </li>
                </ul>

            </nav>

        </div>
        <!-- end librerias-->

        <!-- bibliotecas-->


        <div class="sidebar one_quarter">
            <h5>Bibliotecas cercanas</h5>   <div class="dropdown show">
            <a href="#" role="button" id="dropbibliotecas"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-list"></i> Ordenar por:
            </a>

            <div class="dropdown-menu" aria-labelledby="dropbibliotecas">
                <a class="dropdown-item" href="#"> Nombre ascendente</a><br>
                <a class="dropdown-item" href="#"> MÃ¡s cercana</a>
            </div>
        </div>
            <br>
            <nav class="sdb_holder">
                <ul>
                    <li><a href="#">Bibiloteca 1</a>
                        <i class="fa fa-map-pin"></i>
                    <li style="margin-left: 50px;">DirecciÃ³n:</li>
                    </li>
                    <li><a href="#">Bibiloteca 2</a>
                        <i class="fa fa-map-pin"></i>
                    <li style="margin-left: 50px;">DirecciÃ³n:</li>
                    </li>
                    <li><a href="#">Bibiloteca 3</a>
                        <i class="fa fa-map-pin"></i>
                    <li style="margin-left: 50px;">DirecciÃ³n:</li>
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
            <h6 class="title">InformaciÃ³n de contacto</h6>
            <ul class="nospace linklist contact">
                <li><i class="fa fa-map-marker"></i>
                    <address>
                        Escuela TÃ©cnica Superior de Telecomunicaciones
                    </address>
                </li>
                <li><i class="fa fa-phone"></i>(123) 456 789<br></li>
                <li><i class="fa fa-fax"></i> (123) 456 789</li>
                <li><i class="fa fa-envelope-o"></i> info@bookadvisor.com</li>
            </ul>
        </div>

    </footer>
</div>


<div class="wrapper row5">
    <div id="copyright" class="hoc clear">
        <p class="fl_left">Copyright &copy; 2018 - All Rights Reserved - <a href="#">BookAdvisor</a></p>
        <p class="fl_right">Thanks to <a target="_blank" href="http://www.os-templates.com/"
                                         title="Free Website Templates">OS Templates</a></p>

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