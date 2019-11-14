<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%request.setCharacterEncoding("utf-8");%> 
<%response.setContentType("text/html; charset=utf-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  main
</h1>

<P>  The time on the server is ${serverTime}. </P>
<sec:authorize access="isAnonymous()">
    <h5><a href='<c:url value="/comm/login"/>'>LOGIN</a> 로그인 해주세요.</h5>
</sec:authorize>
</body>
</html>
