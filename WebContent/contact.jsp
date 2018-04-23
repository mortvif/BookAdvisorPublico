<!DOCTYPE html>

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

<%@include file="header.jsp"%>

<%@include file="loginform.jsp"%>
<%@include file="signupform.jsp"%>


<!-- ficha libro-->
<div class="wrapper row3">
    <main class="hoc container clear">

        <div class="content three_quarter first">



            <!-- comentarios-->
            <div id="contacto" class="three_quarter">

                <h1>Contáctanos</h1>
                <p>Para cualquier consulta o para reportar algún hecho rellene el siguiente formulario:</p>
                <form action="#" method="post">
                    <div class="one_third first">
                        <label for="name">Nombre <span>*</span></label>
                        <input type="text" name="name" id="name" value="" size="22" required>
                    </div>
                    <div class="one_third">
                        <label for="email">Email <span>*</span></label>
                        <input type="email" name="email" id="email" value="" size="22" required>
                    </div>
                    <div class="one_third">
                        <label for="subject">Asunto</label>
                        <input type="text" name="subject" id="subject" value="" size="22">
                    </div>
                    <div class="block clear">
                        <label for="comment">Tu mensaje</label>
                        <textarea name="comment" id="comment" cols="100" rows="20"></textarea>
                    </div>
                    <div>
                        <input type="submit" name="submit" value="Enviar" style="display: inline">
                        &nbsp;
                        <input type="reset" name="reset" value="Borrar" style="display: inline">
                    </div>
                </form>
            </div>
        </div>

        <!-- end comentarios-->


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
                    <address>
                        Escuela Técnica Superior de Telecomunicaciones
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