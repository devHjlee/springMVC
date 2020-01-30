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
	<!-- ajax 통신을 위한 meta tag -->
	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
  	<title>PDFBOX MERGE TEST PAGE</title>
  	<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
	<!-- Custom fonts for this template-->
	<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

	<!-- Page level plugin CSS-->
	<link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

	<!-- Custom styles for this template-->
	<link href="../css/sb-admin-2.css" rel="stylesheet">
	<style>
	.btn-file {
    	position: relative;
		overflow: hidden;
	}

    .btn-file input[type=file] {
        position: absolute;
        top: 0;
        right: 0;
        min-width: 100%;
        min-height: 100%;
        font-size: 100px;
        text-align: right;
        filter: alpha(opacity=0);
        opacity: 0;
        outline: none;
        background: white;
        cursor: inherit;
        display: block;
    }
	</style>
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
						<li class="breadcrumb-item active">PDFBOX Merge Page</li>
					</ol>

					<!-- Page Content -->
					<div class="card shadow mb-4" id="files1">
						<div class="card-header py-3">
							<a href="#" class="btn btn-primary btn-icon-split">
                    			<span class="icon text-white-50">
                      				<i class="fas fa-arrow-right"></i>
                    			</span>
                    			<span class="text btn-file">파일첨부<input type="file" name="files1" multiple /></span>
                  			</a>
							<a id="uploadBtn" href="#" class="btn btn-primary btn-icon-split">
                    			<span class="icon text-white-50">
                      				<i class="fas fa-check"></i>
                    			</span>
                    			<span class="text btn-file">PDF Merge</span>
                  			</a>
		                </div>
		                <div class="card-body">파일목록</div>
					</div>
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
	<script src="../vendor/datatables/jquery.dataTables.js"></script>
	<script src="../vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin-2.min.js"></script>

	<script type="text/javascript">
	$(document).ready(function(){
		//다중파일 업로드 커스터마이징 참고 사이트 https://jsfiddle.net/alexjamesbrown/2nzL9f7g/
		$.fn.fileUploader = function (filesToUpload, sectionIdentifier) {
			var fileIdCounter = 0;
		    this.closest(".mb-4").change(function (evt) {
		        var output = [];
		        for (var i = 0; i < evt.target.files.length; i++) {
		            fileIdCounter++;

		            var file = evt.target.files[i];
		            var fileName = evt.target.files[i].name;
		            var fileId = sectionIdentifier + fileIdCounter;

		            if(!validateFileExtension(fileName)){
		            	alert("PDF 파일이 아닙니다.");
		            	return false;
		            }
		            filesToUpload.push({
		                id: fileId,
		                file: file
		            });

		            var removeLink = "<a href=\"#\" class=\"removeFile btn btn-danger btn-circle btn-sm\" data-fileid=\"" + fileId + "\"><i class=\"fas fa-trash\"></i></a>";
		            output.push("<li><strong>", escape(file.name), "</strong> - ", file.size, " bytes. &nbsp; &nbsp; ", removeLink, "</li> ");
		        };

		        $(this).children(".card-body").append(output.join(""));
		        //reset the input to null - nice little chrome bug!
		        evt.target.value = null;
		    });

		    $(this).on("click", ".removeFile", function (e) {
		        e.preventDefault();

		        var fileId = $(this).parent().children("a").data("fileid");

		        // loop through the files array and check if the name of that file matches FileName
		        // and get the index of the match
		        for (var i = 0; i < filesToUpload.length; ++i) {
		            if (filesToUpload[i].id === fileId)
		                filesToUpload.splice(i, 1);
		        }

		        $(this).parent().remove();
		    });

		    this.clear = function () {
		        for (var i = 0; i < filesToUpload.length; ++i) {
		            if (filesToUpload[i].id.indexOf(sectionIdentifier) >= 0)
		                filesToUpload.splice(i, 1);
		        }

		        $(this).children(".card-body").empty();
		    }

		    return this;
		};

		var filesToUpload = [];
		var filesUploader = $("#files1").fileUploader(filesToUpload, "files1");

	    $("#uploadBtn").click(function (e) {
	        e.preventDefault();

	        var formData = new FormData();
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
	        for (var i = 0, len = filesToUpload.length; i < len; i++) {
	        	formData.append("files", filesToUpload[i].file);
	        }

	        $.ajax({
	            url: "/pdfbox/fileUpload",
	            data: formData,
	            cache : false,
	            processData: false,
	            contentType: false,
	            type: "POST",
				beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
					xhr.setRequestHeader(header, token);
	            },
	            success: function (data) {
	                alert("DONE");
	                filesUploader.clear();
	            },
	            error: function (data) {
	                alert("ERROR - " + data.responseText);
	            }
	        });
	    });

	});

	function validateFileExtension(fileName){
		var fileExtension = fileName.split('.').pop().toLowerCase();
		if("pdf" == fileExtension){
			return true;
		}else{
			return false;
		}
	}
	</script>
</body>

</html>