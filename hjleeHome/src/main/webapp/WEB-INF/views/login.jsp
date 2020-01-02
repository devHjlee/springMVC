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
	<link href="../css/sb-admin-2.css" rel="stylesheet">
</head>

<body class="bg-dark">
	<div class="container">
	
	  <!-- Outer Row -->
		<div class="row justify-content-center">
	
			<div class="col-xl-10 col-lg-12 col-md-9">
			
			  <div class="card o-hidden border-0 shadow-lg my-5">
			    <div class="card-body p-0">
			      <!-- Nested Row within Card Body -->
			      <div class="row">
			        <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
			        <div class="col-lg-6">
			          <div class="p-5">
			            <div class="text-center">
			              <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
			            </div>
			            <form class="user" id="loginForm" action="/login" method="post">
							<div class="form-group">
							    <input type="text" name="email" class="form-control" placeholder="Email" required="required">
							</div>
							<div class="form-group">
							  <input type="password" name="userPwd" class="form-control" placeholder="Password" required="required">
							</div>
						<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
						    <font color="red">
						        <p>Your login attempt was not successful due to <br/>
						            ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
						        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
						    </font>
						</c:if>
							<div class="form-group">
							  <div class="custom-control custom-checkbox small">
							    <input type="checkbox" class="custom-control-input" id="customCheck">
							    <label class="custom-control-label" for="customCheck">Remember Me</label>
							  </div>
							</div>
							<a id="loginBtn" href="#" class="btn btn-primary btn-user btn-block">
							  Login
							</a>
							<hr>
							<a href="index.html" class="btn btn-google btn-user btn-block">
							  <i class="fab fa-google fa-fw"></i> Login with Google
							</a>
							<a href="index.html" class="btn btn-facebook btn-user btn-block">
							  <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
							</a>
							<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
			            </form>
			            <hr>
			            <div class="text-center">
			              <a class="small" href="forgot-password.html">Forgot Password?</a>
			            </div>
			            <div class="text-center">
			              <a class="small" href="/register">Create an Account!</a>
			            </div>
			          </div>
			        </div>
			      </div>
			    </div>
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