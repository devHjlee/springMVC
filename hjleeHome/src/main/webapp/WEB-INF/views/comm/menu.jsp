<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%request.setCharacterEncoding("utf-8");%> 
<%response.setContentType("text/html; charset=utf-8"); %>
<%@ page import = "java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<head>
</head>

<body>
	<!-- Sidebar -->
	<ul class="sidebar navbar-nav">
	  <li class="nav-item active">
	    <a class="nav-link" href="index.html">
	      <i class="fas fa-fw fa-tachometer-alt"></i>
	      <span>Dashboard</span>
	    </a>
	  </li>
	  <li class="nav-item dropdown">
	    <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	      <i class="fas fa-fw fa-folder"></i>
	      <span>Pages</span>
	    </a>
	    <div class="dropdown-menu" aria-labelledby="pagesDropdown">
	      <h6 class="dropdown-header">Login Screens:</h6>
	      <a class="dropdown-item" href='<c:url value="/comm/login"/>'>Login</a>
	      <a class="dropdown-item" href="register.html">Register</a>
	      <a class="dropdown-item" href="forgot-password.html">Forgot Password</a>
	      <div class="dropdown-divider"></div>
	      <h6 class="dropdown-header">Other Pages:</h6>
	      <a class="dropdown-item" href="404.html">404 Page</a>
	      <a class="dropdown-item" href="blank.html">Blank Page</a>
	    </div>
	  </li>
	  <%-- </sec:authorize> --%>
	  <li class="nav-item">
	    <a class="nav-link" href='<c:url value="/admin/admin"/>'>
	      <i class="fas fa-fw fa-chart-area"></i>
	      <span>Charts</span></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href='<c:url value="/board/board"/>'>
	      <i class="fas fa-fw fa-table"></i>
	      <span>Tables</span></a>
	  </li>
	</ul>
</body>

</html>