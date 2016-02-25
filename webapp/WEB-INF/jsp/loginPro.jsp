<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	
<c:if test="${result == '0'}">
	<script type="text/javascript">
		location.href="/mainList.do"
	</script>
</c:if>
<c:if test="${result == '1'}">
	<script type="text/javascript">
		alert("패스워드가 일치하지 않습니다");
	 	history.go(-1);
	</script>
</c:if>
<c:if test="${result == '2'}">
	<script type="text/javascript">
		alert("ID가 존재하지 않습니다");
	 	history.go(-1);
	</script>
</c:if>