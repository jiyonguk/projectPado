<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입처리</title>
<link rel="stylesheet" href="<c:url value="/css/default.css" />">

</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

	<div>
		<h1 class="subtitle">회원 가입</h1>
		<hr>
		<h3>
		
		<c:if test="${result gt 0 && member ne null}">
			<div>
				회원가입 완료
			</div>
			<script>
			alert('회원가입이 완료 되었습니다. \n 로그인을 해주세요.');
			location.href='<c:url value="/index.do"/>';
			</script>
		</c:if>
		
		<c:if test="${not (result gt 0 && member ne null)}">
			회원가입 실패
		</c:if>
		
		</h3>
	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>