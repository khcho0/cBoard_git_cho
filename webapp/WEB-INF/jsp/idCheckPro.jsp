<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
<form action="joinForm.do" method="post" name="c_id">
<c:if test = "${result != null }">
	<script type="text/javascript">
		alert("이미 사용중인 아이디입니다.");
		location.href='joinForm.do'
	</script>
</c:if>
<c:if test = "${result == null }">
	<script type="text/javascript">
		alert("사용 가능한 아이디입니다.");
		location.href='joinForm.do'
	</script>
</c:if>
</form>