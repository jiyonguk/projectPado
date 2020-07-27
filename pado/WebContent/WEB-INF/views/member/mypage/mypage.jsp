<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    <%@ include file="/WEB-INF/views/include/sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/default.css">
<style>
*{
   background-color: rgb(248, 247, 247);
   margin: auto;
   text-align: center;
   font-family: Nanum Gothic, sans-serif;
   color: rgb(97, 97, 97);
}

/* 내정보수정 글자 */
.myh3{
	background-color: white;
	text-align: center;
	font-family: Nanum Gothic;
}


/* 내정보수정 글자있는 칸 */
#myh3div{
	width : 600px;
	border-radius: 20px;
	height: 80px;
	line-height: 80px;
}

/* 내정보수정 전체 영역 */
#myall{
   margin: auto;
   border: 0.5px solid lightsteelblue;
   width: 614px;
   height: 500px;
   margin-top: 100px;
   border-radius: 10px;
   background-color: white;
}


/* 내정보수정밑에 줄 */
hr{
	border: 0.1px solid rgb(141, 141, 141) ;   
	opacity: 0.1;
}

/* 테이블 칸칸이 */
td{
	background-color:white;
	line-height: 250%;
	text-align: left;
}

table{
position:relative;
	top: 30px;
	
}
input{
	background-color:white;
	border : white;
}

#editForm{
	background-color:white;
}

img{
	background-color:white;
}

p{
	background-color:white;
	color : red;
	font-size: 12px;
	text-align: center;
}

#tr{
	text-align: center;
}

#submit{
	    background-color: rgb(138,174,244);
	    width: 100px;
	    height: 30px;
	    border-radius: 10px;
}

th{
	background-color:white;

}


</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

 <div id="myall">
         <div id="myh3div">
         	<h3 class="myh3">내정보수정</h3>
         </div>
         <hr>
			<form id="editForm" action="memberEdit.do" method="post" enctype="multipart/form-data" >
			<input type="hidden" name="midx" value="${member.midx}">
			<table>
				<tr>
					<th>아이디(email) </th>
					<td> <input type="email" name="mid" id="mid" value="${member.mid}" readonly  ><br><p>아이디는 수정이 불가합니다.</p></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td> <input type="password" name="mpw" required> </td>
				</tr>
				<tr>
					<th>이름</th>
					<td> <input type="text" name="mname" value="${member.mname}" required> </td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td> <input type="text" name="mphonenumber" value="${member.mphonenumber}" required> </td>
				</tr>
				<tr>
					<th>사진</th>
					<td><input type="file" name="photo">
						<br>
						현재 파일 : <img alt="프사 " src="<c:url value="${member.mphoto}"/>">
						
					 </td>
				</tr>
				<tr >
					<td id="tr"colspan="2"> 
						<input id="submit" type="submit" value="회원수정">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>