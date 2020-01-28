<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%request.setCharacterEncoding("utf-8");%> 
<%response.setContentType("text/html; charset=utf-8"); %>
<%@ page import = "java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
	<title>Home</title>
  	<title>TOAST UI GRID TEST PAGE</title>
  	<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
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
					  <li class="breadcrumb-item active">TOAST UI Grid Page</li>
					</ol>

					<!-- Page Content -->
					<h1>TOAST UI Grid Page</h1>
					<hr>
					<p>This is a great starting point for new custom pages.</p>
					<div id="grid"></div>
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
	
	$(document).ready(function(){ 
/* 		const ROW_COUNT = 100000;
	    const COL_COUNT = 10;

	    const data = [];
	    const columns = [];

	    for (let i = 0; i < ROW_COUNT; i += 1) {
	      const row = { id: i };
	      for (let j = 0; j < COL_COUNT; j += 1) {
	        row[`c\${j}`] = (Math.random() * 100000000000).toFixed();
	      }
	      data.push(row);
	    }
		columns.push({name:'id',header:'id'});
	    for (let i = 0; i < COL_COUNT; i += 1) {
	      const name = `c\${i}`;
	      columns.push({ name, header: name });
	    }

	    const grid = new tui.Grid({
	      el: document.getElementById('grid'),
	      data: data,
	      bodyHeight: 500,
	      columns: columns
	    }); */
 		const ROW_COUNT = 500000;
	    const COL_COUNT = 10;

	    const data = [];
	    const columns = [];

	    for (let i = 0; i < ROW_COUNT; i += 1) {
	    //row 라는 객체를 생성 {key,value}  
	    const row = { id: i };
	      for (let j = 0; j < COL_COUNT; j += 1) {
	        row['c'+j] = (Math.random() * 100000000000).toFixed();
	      }
	      data.push(row);
	    }
	    //console.log(JSON.stringify(data));
	    const id = 'id';
	    columns.push({name:id,header:id});
	    for (let i = 0; i < COL_COUNT; i += 1) {
	      
	    	const name = 'c'+i;
	      columns.push({ name, header: name });
	    }
//console.log(JSON.stringify(columns));
	    const grid = new tui.Grid({
	      el: document.getElementById('grid'),
	      data: data,
	      bodyHeight: 500,
	      columns: columns
	    });
	    
	    

	    
	    
	    
/* 		const gridData = [
			  {
			    name: '10012',
			    artist: 'Seoul'
			  },
			  {
				    name: '10012',
				    artist: 'Seoul'
				  },			  {
					    name: '10012',
					    artist: 'Seoul'
					  },			  {
						    name: '10012',
						    artist: 'Seoul'
						  }
			];
		const grid = new tui.Grid({
		    el: document.getElementById('grid'),
		    data: gridData,
		    scrollX: false,
		    scrollY: false,
		    columns: [
		      {
		        header: 'Name',
		        name: 'name'
		      },
		      {
		        header: 'Artist',
		        name: 'artist'
		      },
		      {
		        header: 'Type',
		        name: 'type'
		      },
		      {
		        header: 'Release',
		        name: 'release'
		      },
		      {
		        header: 'Genre',
		        name: 'genre'
		      }
		    ]
		  }); */
	});
	</script>
</body>

</html>