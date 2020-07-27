<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<link rel="stylesheet" href="<c:url value="/css/default.css" />">
</head>
<body>

	<%@ include file="/WEB-INF/views/include/header.jsp" %>

	<div>
		<h1 class="subtitle">회원 수정</h1>
		<hr>
		<h3>
		
		<c:if test="${result gt 0 && member ne null}">
			<script>
				alert('수정완료');
				history.go(-1);
			</script>
		</c:if>
		
		<c:if test="${not (result gt 0 && member ne null)}">
			<script>
				alert('수정실패');
				history.go(-1);
			</script>
		</c:if>
		
		
		
		</h3>
	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>