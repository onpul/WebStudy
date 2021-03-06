<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
</head>
<body>

<div>
	<h2>JSTL 코어(Core)를 활용한 회원 정보 입력</h2>
	<hr>
</div>

<div>
	<form action="MemberInsert.jsp" method="post">
		<!-- (이름, 전화번호, 주소) * 5명 분 -->
		<!-- → submit 액션 처리 -->
		<table class="table" style="text-align: center;">
			<tr>
				<th>이름</th>
				<c:set var="i" value="1"></c:set><!-- check~!!! -->
				<c:forEach var="a" begin="1" end="5" step="1">
					<%-- <td><input type="text" name="name${a }"/></td> --%>
					<td><input type="text" name="name${i }"/></td>
					<c:set var="i" value="${i+1}"></c:set>
				</c:forEach>
			</tr>
			<tr>
				<th>전화번호</th>
				<c:set var="i" value="1"></c:set>
				<c:forEach var="a" begin="1" end="5" step="1">
					<td><input type="text" name="tel${i }"/></td>
					<c:set var="i" value="${i+1}"></c:set>
				</c:forEach>
			</tr>
			<tr>
				<th>주소</th>
				<c:forEach var="a" begin="1" end="5" step="1">
					<td><input type="text" name="addr${a }"/></td>
				</c:forEach>
			</tr>
			<tr>
				<td colspan="6"><button type="submit" style="width: 300px; height: 40px;">제출하기</button></td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>