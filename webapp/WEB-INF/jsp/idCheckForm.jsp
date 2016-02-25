<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복 확인</title>
	<%
		String strReferer = request.getHeader("referer");
		if(strReferer == null){
	%>
		<script language="javascript">
	 		alert("로그인 페이지를 통해 로그인을 하신 후에 다시 접근해 주십시오.");
	 		document.location.href="loginForm.do";
	 	</script>
	<%
	 	return;
		}
	%>
</head>
	<body>
		<div>
			<form action="idCheckPro.do" id="idCheck-form" method="post">
				<div>
					<input type="text" name="id" />
					<input type="hidden" name="${id }" value="id" />
				</div>
				<div>
					<button type="submit" id="idCheck-form">중복 확인</button>
					<button type="button" onClick="window.close()">취소</button>
				</div>
			</form>
		</div>
	</body>
</html>