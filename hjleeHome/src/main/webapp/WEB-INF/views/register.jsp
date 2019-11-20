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
		<div class="card card-register mx-auto mt-5">
		  <div class="card-header">Register an Account</div>
		  <div class="card-body">
		    <form>
		      <div class="form-group">
		        <div class="form-row">
		          <div class="col-md-6">
		            <div class="form-label-group">
		              <input type="text" id="firstName" class="form-control" placeholder="First name" required="required" autofocus="autofocus">
		              <label for="firstName">First name</label>
		            </div>
		          </div>
		          <div class="col-md-6">
		            <div class="form-label-group">
		              <input type="text" id="lastName" class="form-control" placeholder="Last name" required="required">
		              <label for="lastName">Last name</label>
		            </div>
		          </div>
		        </div>
		      </div>
		      <div class="form-group">
		        <div class="form-label-group">
		          <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required="required">
		          <label for="inputEmail">Email address</label>
		        </div>
		      </div>
		      <div class="form-group">
		        <div class="form-row">
		          <div class="col-md-6">
		            <div class="form-label-group">
		              <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="required">
		              <label for="inputPassword">Password</label>
		            </div>
		          </div>
		          <div class="col-md-6">
		            <div class="form-label-group">
		              <input type="password" id="confirmPassword" class="form-control" placeholder="Confirm password" required="required">
		              <label for="confirmPassword">Confirm password</label>
		            </div>
		          </div>
		        </div>
		      </div>
		      <a class="btn btn-primary btn-block" href="login.html">Register</a>
		    </form>
		    <div class="text-center">
		      <a class="d-block small mt-3" href="/comm/login">Login Page</a>
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