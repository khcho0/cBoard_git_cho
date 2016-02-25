<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Join Form</title>

	<script language="javascript">
		function submit1(){
			var form = document.forms["submit_form"];
			form.action = 'joinPro.do';
			form.submit();
		}
		function submit2(){
			var form = document.forms["submit_form"];
			form.action = 'idCheckPro.do';
			form.submit();
		}
	</script>

	<%
		String strReferer = request.getHeader("referer");
		if(strReferer == null){
	%>
		<script language="javascript">
	 		alert("로그인 페이지의 회원가입 버튼을 통해 다시 접근해 주십시오.");
	 		document.location.href="loginForm.do";
	 	</script>
	<%
	 	return;
		}
	%>
</head>
<body>
	<div>
		<h1>회원가입</h1>
		<form name="submit_form">
			<div>ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" name="id" value = "${id }"/>
				<input type="button" value="중복확인" onClick="submit2();" />
			</div>
			<div>
				Password &nbsp;
				<input type="text" name="pw" />
			</div><br />
			<div>
				<input type="button" value="가입" onClick="submit1();" />
				<button type="button" onClick="window.location='loginForm.do'">취소</button>
			</div>
		</form>
	</div>
</body>
</html>