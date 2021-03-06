<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%

	request.setAttribute("result", "EL 테스트");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test3.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>EL 관련 실습</h1>
	<hr />
</div>

<div>
	<!-- action 속성 생략 → su1 과 su2 데이터를 전송하며 요청하는 페이지는 자기 자신~!!! -->
	<form method="post">
		정수1 <input type="text" name="su1" class="txt"/><br>
		정수2 <input type="text" name="su2" class="txt"/><br>
		<button type="submit" class="btn">결과 확인</button>
	</form>
</div><hr>

<div>
	<h2>폼 데이터 수신</h2>
	
	<!-- 폼의 데이터를 수신하는 방법 1 -->
	<h3><%=request.getParameter("su1") %></h3>
	
	<!-- 폼의 데이터를 수신하는 방법 2 -->
	<h3>${param.su1 }</h3>
	<!-- EL 문법 관찰 -->
	<!-- 제이쿼리 문법과 혼동될 수 있으니 잘 기억해 두자. -->
	<!-- 내부에 있는 파라미터 중에 su1 -->
	<!-- null에 대해 관대하다. null값이 보이지 않는다.(클라이언트에게 좋음) -->
</div>
<br><br><hr>

<div>
	<h2>폼의 데이터를 받아 연산 수행</h2>
	
	<!-- 폼의 데이터를 받아 연산을 수행하는 방법 1 -->
	<%
		String s1 = request.getParameter("su1");
		String s2 = request.getParameter("su2");
		
		int s = 0;
		
		if (s1!=null && s2!=null)
		{
			s = Integer.parseInt(s1) + Integer.parseInt(s2);
		}
	%>
	<h3>합 : <%=s %></h3>
	
	<!-- 폼의 데이터를 받아 연산을 수행하는 방법 2 --> <!-- EL 문법 사용! -->
	<h3> 합 : ${param.su1 + param.su2 }</h3>
	<!-- → 파라미터 수신도 알아서... -->
	<!-- → 필요한 캐스팅도 알아서 자동으로 수행 -->
	<!-- → null 을 대하는 방식 유연함 check~!!! -->
	
	<!-- 최초 페이지 요청에서는 null인 상태, submit 수행 후에는 입력하지 않으면 빈 문자열이 입력된 것 -->
	
</div>
<br><br><hr>

<div>
	<h2>setAttribute() 로 넘긴 데이터 수신</h2>
	
	<!-- setAttribute()로 넘긴 데이터를 수신하는 방법1 -->
	<h3><%=request.getAttribute("result") %></h3>
	
	<!-- setAttribute()로 넘긴 데이터를 수신하는 방법2 -->
	<h3>${result }</h3>
	
</div>


</body>
</html>