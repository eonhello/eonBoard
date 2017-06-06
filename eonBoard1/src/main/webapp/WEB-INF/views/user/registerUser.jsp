<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register User</title>
</head>
<body>
    <h2>회원 등록</h2>
    <form action="/user/registerUser" method="post">
        <table border="1" width="400px">
            <tr>
                <td>아이디</td>
                <td><input name="uid"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="upw"></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input name="uname"></td>
            </tr>
            <tr>
                <td>이메일주소</td>
                <td><input name="umail"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="확인">
                    <input type="reset" value="취소">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
