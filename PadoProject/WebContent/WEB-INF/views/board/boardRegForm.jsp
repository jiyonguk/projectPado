<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록 폼</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
</style>
</head>
<body>
	<div class="board">
		<form action="boardReg.do" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td></td>
					<td><textarea rows="10" cols="50" name="bmessage" id="bmessage"></textarea></td>
					<td><input type="file" name="bphoto" id="bphoto"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="글쓰기"><input
						type="reset" value="전체삭제"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>