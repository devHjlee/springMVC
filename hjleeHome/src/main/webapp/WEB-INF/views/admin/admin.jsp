<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%request.setCharacterEncoding("utf-8");%> 
<%response.setContentType("text/html; charset=utf-8"); %>
<%@ page import = "java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
	<title>Home</title>
  	<title>SB Admin - Dashboard</title>

	<!-- Custom fonts for this template-->
	<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

	<!-- Page level plugin CSS-->
	<link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

	<!-- Custom styles for this template-->
	<link href="../css/sb-admin-2.css" rel="stylesheet">
</head>

<body id="page-top">
	<div id="wrapper">
	<jsp:include page="/WEB-INF/views/include/menu.jsp"/>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
			<jsp:include page="/WEB-INF/views/include/header.jsp"/>
				<div class="container-fluid">
					
					<!-- Breadcrumbs-->
					<ol class="breadcrumb">
					  <li class="breadcrumb-item">
					    <a href="/">Dashboard</a>
					  </li>
					  <li class="breadcrumb-item active">admin Page</li>
					</ol>
					
					<!-- Page Content -->
					<h1>Admin Page</h1>
					<hr>
					<p>This is a great starting point for new custom pages.</p>
				</div>
			<!-- /.container-fluid -->

			</div>
			<jsp:include page="/WEB-INF/views/include/footer.jsp"/>	
	   <!-- /.content-wrapper -->
		</div>
	</div>
	<!-- /#wrapper -->

	<jsp:include page="/WEB-INF/views/include/logoutmodal.jsp"/>

	<!-- Bootstrap core JavaScript-->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<!-- Core plugin JavaScript-->
	<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
	
	<!-- Page level plugin JavaScript-->
	<!-- <script src="../vendor/chart.js/Chart.min.js"></script> -->
	<script src="../vendor/datatables/jquery.dataTables.js"></script>
	<script src="../vendor/datatables/dataTables.bootstrap4.js"></script>
	
	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin-2.min.js"></script>
	<script type="text/javascript">

	</script>
</body>

</html>