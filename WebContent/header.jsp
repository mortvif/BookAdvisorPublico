
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- navigation menu-->
<div class="container-fluid header">
	<header id="header" class="hoc clear">
		<div id="logo" class="fl_left">
			<h1>
				<a href="index" style="font-family: 'Times New Roman';">BookAdvisor</a>
			</h1>
			<i class="fa fa-map-o"></i>
			<p>Reseñas literarias</p>
		</div>
		<nav id="mainav" class="fl_right">
			<ul class="clear inline nospace pushright">
				
				<c:if test="${user != null}">
<!-- 						<form action = "NewBookServlet"> -->
<%-- 							<input type = "hidden" name = "user" value = "${user.username}" /> --%>
<!-- 							<a class="btn" href="javascript:;" onclick="parentNode.submit();">Añadir Libro</a> -->
<!-- 						</form> -->
	                	
<!-- 	                	<form action = "ProfileServlet"> -->
<%-- 							<input type = "hidden" name = "user" value = "${user.username}" /> --%>
<%-- 							<a class="btn" href="javascript:;" onclick="parentNode.submit();">Perfil de ${user.username} </a> --%>
<!-- 						</form> -->
						
<!-- 						<form action = "LogoutServlet"> -->
<%-- 							<input type = "hidden" name = "user" value = "${user.username}" /> --%>
<!-- 							<a class="btn" href="javascript:;" onclick="parentNode.submit();">Logout</a> -->
<!-- 						</form> -->

	                <a href="newbook.jsp" class="btn">Añadir libro</a>                
					<a href="ProfileServlet" class="btn">Perfil de ${user.username}</a>
					<a href="LogoutServlet" class="btn">Logout</a>
					
				</c:if>
				
				<c:if test="${user == null}">
					<li><i class="fa fa-sign-in"></i> <a data-toggle="modal"
						data-target="#login" id="usuario">Login</a></li>
					<li><i class="fa fa-user"></i> <a data-toggle="modal"
						data-target="#signup" >Crear cuenta</a></li>
				</c:if>

				
			</ul>
		</nav>
	</header>
</div>
<!-- end navigation-->