<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Form</title>
</head>
<body>
	<div>
		<h1>Login</h1>
		<form action="loginPro.do" id="login_form" method="post">
			<div>
				<input type="text" name="id" placeholder="id" />
			</div>
			<div>
				<input type="text" name="pw" placeholder="password" />
			</div>
			<div>
				<button type="submit" id="login-form">로그인</button>
				<button type="button" id="login" onClick="window.location='joinForm.do'">회원가입</button>
			</div>
		</form>
	</div>
</body>
</html>