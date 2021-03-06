<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>게시글 작성</title>
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
	<table>
	    <tr>
	    	<td>
    			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				    <tr style= text-align:center>
					    <td>글 내용 확인</td>
				    </tr>
			    </table>
			    <form name="writeForm" method="post" action="writePro.do">
    			<table style="margin:0px;padding:0px;align:center">
				    <tr height="50">
					    <td >&nbsp;</td>
					    <td align="center">제목</td>
					    <td>
					    	<c:forEach items="${result }" var="result">
					    		${result.TITLE}
					    	</c:forEach>
						</td>
					    <td>&nbsp;</td>
				    </tr>
				    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
				    <tr height="50">
					    <td>&nbsp;</td>
					    <td align="center">작성자</td>
					    <td>
					    	<c:forEach items="${result }" var="result">
					    		${result.ID}
					    	</c:forEach>
					    </td>
					    <td>&nbsp;</td>
				    </tr>
				    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
				    <tr height="50">
					    <td>&nbsp;</td>
					    <td align="center">내용</td>
					    <td>
					    	<c:forEach items="${result }" var="result">
					    		${result.CONTENT}
					    	</c:forEach>
					    </td>
					    <td>&nbsp;</td>
				    </tr>
				    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
				    <tr align="center">
					    <td>&nbsp;</td>
					    <td colspan="2">
					    <c:forEach items="${result}" var="result">
					    <c:if test="${id == result.ID}">
							<input type="button" value="수정" onClick="window.location='modifyForm.do?code=${result.CODE}'" />
							<input type="button" value="삭제" onClick="window.location='deletePro.do?code=${result.CODE}'" />
						</c:if>
						</c:forEach>    
						    <button type="button"onClick="window.location='mainList.do'">목록으로</button>
					    </td>
					    <td>&nbsp;</td>
				    </tr>
				</table>
				</form>
    		</td>
 		</tr>
    </table>
	</div>
</body>
</html>