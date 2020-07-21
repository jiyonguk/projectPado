<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
</style>
</head>
<body>
	<table>
		<tr>
			<td>게시글 번호</td>
			<td>게시자</td>
			<td>사진</td>
			<td>내용</td>
			<td>게시일</td>
			<td>관리</td>
		</tr>
<c:if test="${not empty boardList}">

	<c:forEach items="${boardList}" var="board">

		
			<tr>
				<td>${board.bidx}</td>
				<td>${board.bid}</td>
				<td>${board.bphoto}</td>
				<td><textarea rows="4" cols="20" name="bmessage" id="bmessage">${board.bmessage}</textarea></td>
				<td>${board.regdate}</td>
				<td><a href="boardEditForm.do?idx=${board.bidx}">수정</a>/<a href="boardDelete.do?idx=${board.bidx}">삭제</a></td>
			</tr>
	</c:forEach>

</c:if>
	</table>
</body>
</html>