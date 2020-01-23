<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%response.setContentType("text/html; charset=utf-8"); %>
<%@ page import = "java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
 	<title>SB Admin - Dashboard</title>
	<!-- ajax 통신을 위한 meta tag -->
	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Custom fonts for this template-->
	<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

	<!-- Page level plugin CSS-->
	<link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

	<!-- Custom styles for this template-->
	<link href="../css/sb-admin-2.css" rel="stylesheet">
</head>

<body class="bg-gradient-primary">
	<div class="container">
		<div class="card o-hidden border-0 shadow-lg my-5">
		  <div class="card-body p-0">
		    <!-- Nested Row within Card Body -->
		    <div class="row">
		      <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
		      <div class="col-lg-7">
		        <div class="p-5">
		          <div class="text-center">
		            <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
		          </div>
		          <form class="user" id="registerForm" action="/register" method="post" accept-charset="utf-8">
		            <div class="form-group row">
		              <div class="col-sm-12 mb-3 mb-sm-0">
		                <input type="text" class="form-control form-control-user" id="username" name="username" placeholder="Name">
		              </div>
		            </div>
		            <div class="form-group">
		              <input type="email" class="form-control form-control-user" id="email" name="email" placeholder="Email Address">
		            </div>
		            <div class="form-group row">
		              <div class="col-sm-6 mb-3 mb-sm-0">
		                <input type="password" class="form-control form-control-user" id="password" name="password" placeholder="Password">
		              </div>
		              <div class="col-sm-6">
		                <input type="password" class="form-control form-control-user" id="repeatPassword" placeholder="Repeat Password">
		              </div>
		            </div>
				    <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
				    <a id="registerBtn" class="btn btn-primary btn-user btn-block" href="#">Register Account</a>
		            <hr>
		            <a href="index.html" class="btn btn-google btn-user btn-block">
		              <i class="fab fa-google fa-fw"></i> Register with Google
		            </a>
		            <a href="index.html" class="btn btn-facebook btn-user btn-block">
		              <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
		            </a>
		          </form>
		          <hr>
		          <div class="text-center">
		            <a class="small" href="forgot-password.html">Forgot Password?</a>
		          </div>
		          <div class="text-center">
		            <a class="small" href="login.html">Already have an account? Login!</a>
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
		$('#registerBtn').click(function(){
			var regExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			var chkName = document.getElementById('username').value;
			var chkEmail = document.getElementById('email').value;
			var chkPwd = document.getElementById('password').value;
			var chkRPwd = document.getElementById('repeatPassword').value;

			if(chkName.trim() == ''){
				alert('이름을 입력해 주세요.');
				return false;
			}
			if (chkEmail == '' || !regExp.test(chkEmail)) {
				alert("올바른 이메일 주소를 입력하세요");
				return false;
			}
			if(chkPwd != chkRPwd){
				alert('비밀번호가 일치하지 않습니다.');
				return false;
			}
			var csrfChk = $("${_csrf.parameterName}").val();
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			var jsonData = {"email":chkEmail,"username":"이형재"};

			$.ajax({
				type: 'POST',
				contentType: "application/json; charset=utf-8;",
				url:'/emailChk',
				data: JSON.stringify(jsonData), // String -> json 형태로 변환
				beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
					xhr.setRequestHeader(header, token);
	            },
				dataType: 'json', // success 시 받아올 데이터 형
				async: false, //동기, 비동기 여부
				cache :false, // 캐시 여부
				success: function(data){
					if(data.result == "fail"){
						alert('email이 존재합니다.');
					}else{
						$("#registerForm").submit();
					}
				},
				error:function(xhr,status,error){
					console.log('xhr:'+xhr+'status:'+status+'error:'+error);
				}
			});
		});
	});
	</script>
</body>

</html>