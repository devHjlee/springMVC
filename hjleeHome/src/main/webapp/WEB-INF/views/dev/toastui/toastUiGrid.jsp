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
  	<title>TOAST UI GRID TEST PAGE</title>
  	<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
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
					<p>This is a great starting point for new custom pages.</p><input type="button" id="gridTest" value="BUTTON"/>
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
	<!-- Toast Ui js -->
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
	<script src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.js"></script>
	<!-- Bootstrap core JavaScript-->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<!-- Core plugin JavaScript-->
	<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
	
	<!-- Page level plugin JavaScript-->
	<script src="../vendor/datatables/jquery.dataTables.js"></script>
	<script src="../vendor/datatables/dataTables.bootstrap4.js"></script>
	
	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin-2.min.js"></script>

	<script type="text/javascript">
	$(document).ready(function(){
		function appendRow(index) {
			var newRow = {
			eventId: '',
			localEvent: '',
			copyControl: ''
			};
			if (index== null) { // 행 추가(끝에)
			grid.appendRow(epgCleanRow, null);
			} else { // 행 삽입
			var optionsOpt = {
			at: indx,
			extendPrevRowSpan: false,
			focus: false
			};
			grid.appendRow(newRow , optionsOpt);
			}
		}
		class CustomTextEditor {
		constructor(props) {
			const el = document.createElement('input');
			const { maxLength } = props.columnInfo.editor.options;

			el.type = 'text';
			el.maxLength = maxLength;
			el.value = String(props.value);

			this.el = el;
		}

		getElement() {
			return this.el;
		}

		getValue() {
			return this.el.value;
		}

		mounted() {
			this.el.select();
		}
	}
	    const dataSource = {
	    		  api: {
	    		    readData: {
	    		      url: '/toast/grid/readData',
	    		      method: 'GET'
	    		    }
	    		  },
	    			initialRequest: false
	    		};
	    var grid = new tui.Grid({
	      el: document.getElementById('grid'),
	      data: dataSource,
	      bodyHeight: 250,
	      columns: [
				{
					header: 'Name',
					name: 'c0',
					onBeforeChange(ev){
						console.log('Before change:' + ev);
						ev.stop();
					},
					onAfterChange(ev){
						console.log('After change:' + ev);
					},
					editor: 'text'
				},
				{
					header: 'Artist',
					name: 'c1',
					onBeforeChange(ev){
						console.log('Before change:' + ev);
					},
					onAfterChange(ev){
						console.log('After change:' + ev);
					},
					editor: {
						type: CustomTextEditor,
						options: {
							maxLength: 10
						}
					}
				},
				{
					header: 'Type',
					name: 'c2',
					onBeforeChange(ev){
						console.log('Before change:' + ev);
					},
					onAfterChange(ev){
						console.log('After change:' + ev);
					},
					formatter: 'listItemText',
					editor: {
						type: 'select',
						options: {
							listItems: [
								{ text: 'Deluxe', value: '1' },
								{ text: 'EP', value: '2' },
								{ text: 'Single', value: '3' }
							]
						}
					}
				},
				{
					header: 'Genre',
					name: 'c3',
					onBeforeChange(ev){
						console.log('Before change:' + ev);
					},
					onAfterChange(ev){
						console.log('After change:' + ev);
					},
					formatter: 'listItemText',
					editor: {
						type: 'checkbox',
						options: {
							listItems: [
								{ text: 'Pop', value: '1' },
								{ text: 'Rock', value: '2' },
								{ text: 'R&B', value: '3' },
								{ text: 'Electronic', value: '4' },
								{ text: 'etc.', value: '5' }
							]
						}
					},
					copyOptions: {
						useListItemText: true // when this option is used, the copy value is concatenated text
					}
				},
				{
					header: 'Grade',
					name: 'c4',
					onBeforeChange: function(ev){
						console.log('Before change:' + ev);
					},
					onAfterChange: function(ev){
						console.log('After change:' + ev);
					},
					copyOptions: {
						useListItemText: true
					},
					formatter: 'listItemText',
					editor: {
						type: 'radio',
						options: {
							listItems: [
								{ text: '★☆☆☆☆', value: '1' },
								{ text: '★★☆☆☆', value: '2' },
								{ text: '★★★☆☆', value: '3' },
								{ text: '★★★★☆', value: '4' },
								{ text: '★★★★★', value: '5' }
							]
						}
					}
				}
			]
	    });

  	    grid.on('beforeRequest', function(data) {
  	        // before sending a request
  	        console.log("beforeRequest " + data);
  	    });
/*    	    grid.on('response', function(data) {
  	      // when receiving response regardless of success/fail
  	      //console.log("data " + data.xhr.response);
  	      //grid.setData(data.responseData.list);
  	  }); */
  	    grid.on('successResponse', function(response) {
  	      // when the result is true
  	      //alert("successResponse " + JSON.parse(dddddata));
  	    	//const responseObj = JSON.stringify(response.data);

  	      //console.log('result : ', responseObj);
  	      //console.log('data : ', responseObj.data);
  	  });
  	    grid.on('errorResponse', function(data) {
  	      // when an error occurred
  	      alert("errorResponse " + data);
  	  });
  	  var parameter22 = {startdate : '2019-02-11'};
		
		  $("#gridTest").click(function(){
			  grid.readData(1,parameter22,true);
		  });
	});
	</script>
</body>

</html>