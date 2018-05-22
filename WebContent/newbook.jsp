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


<%@include file="header.jsp" %>

<%@include file="loginform.jsp" %>
<%@include file="signupform.jsp" %>

<div class="wrapper row3">
    <main class="hoc container clear">
        <h1>Nuevo libro</h1>

        <div class="one_third first">

            <img class="imgl borderedbox inspace-5" src="images/portada.jpeg" alt="" style="height:330px;width:240px; !important">

        </div>
        <div class="two_third">
            <%@include file="newbookform.jsp"%>
        </div>

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