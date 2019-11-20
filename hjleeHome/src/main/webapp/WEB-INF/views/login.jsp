<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%request.setCharacterEncoding("utf-8");%> 
<%response.setContentType("text/html; charset=utf-8"); %>
<%@ page import = "java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
 	<title>SB Admin - Dashboard</title>

	<!-- Custom fonts for this template-->
	<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

	<!-- Page level plugin CSS-->
	<link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

	<!-- Custom styles for this template-->
	<link href="../css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark">

	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">Login</div>
			<div class="card-body">
				<form id="loginForm" action="/login" method="post">
				<div class="form-group">
				    <input type="text" name="userId" class="form-control" placeholder="ID" required="required">
				</div>
				<div class="form-group">
				    <input type="password" name="usePwd" class="form-control" placeholder="Password" required="required">
				</div>
<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
    <font color="red">
        <p>Your login attempt was not successful due to <br/>
            ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
    </font>
</c:if>
				<div class="form-group">
				  <div class="checkbox">
				    <label>
				      <input type="checkbox" value="remember-me">
				      Remember Password
				    </label>
				  </div>
				</div>
				<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
				  <a id="loginBtn" class="btn btn-primary btn-block" href="#">Login</a>
				</form>
			<div class="text-center">
			  <a class="d-block small mt-3" href="/comm/register">Register an Account</a>
			  <a class="d-block small" href="forgot-password.html">Forgot Password?</a>
			</div>
	    </div>
	  </div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$('#loginBtn').click(function(){
			$("#loginForm").submit();
		});
	});
	</script>
</body>

</html>