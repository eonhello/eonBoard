<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User List</title>

<script>
	var result = '${msg}';
	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
</script>
</head>

<body>
<form action="/user/userList" method="get">
	<h2>회원 목록</h2>
	<table border="1" width="700px">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>회원가입일자</th>
		</tr>
		<c:forEach var="row" items="${list}">
			<tr>
				<td>${row.uid}</td>
				<td>${row.uname}</td>
				<td>${row.umail}</td>
				<td>${row.regdate}</td>
			</tr>
		</c:forEach>
	</table>
</form>
</body>
</html>