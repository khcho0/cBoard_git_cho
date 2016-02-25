<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>게시글 작성</title>

	<script language="javascript">
		
		var clearChk=true;
		var limitByte = 4000; //바이트의 최대크기, limitByte 를 초과할 수 없슴
		
		// textarea에 마우스가 클릭되었을때 초기 메시지를 클리어
		function clearMessage(frm){
			if(clearChk){ 
		    	frm.content.value="";
		    	clearChk=false;
		  }
		
		}
		// textarea에 입력된 문자의 바이트 수를 체크
		function checkByte(frm) {
	   
	        var totalByte = 0;
	        var message = frm.content.value;
	
	        for(var i =0; i < message.length; i++) {
                var currentByte = message.charCodeAt(i);
                if(currentByte > 128) totalByte += 2;
			else totalByte++;
	        }
	        frm.messagebyte.value = totalByte;
	
	        if(totalByte > limitByte) {
	        	alert( limitByte+"바이트까지 입력 가능합니다.");
			frm.content.value = message.substring(0,limitByte);
	        }
		}
	</script>	
	
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
					    <td>글쓰기</td>
				    </tr>
			    </table>
			    <form name="writeForm" method="post" action="writePro.do">
    			<table style="margin:0px;padding:0px;align:center">
				    <tr height="50">
					    <td >&nbsp;</td>
					    <td align="center">제목</td>
					    <td><input type="text" name="title" size="50"></td>
					    <td>&nbsp;</td>
				    </tr>
				    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
				    <tr height="50">
					    <td>&nbsp;</td>
					    <td align="center">작성자</td>
					    <td>
					    	${id}
					    	<input type="hidden" name="id" value="${id}" />
					    </td>
					    <td>&nbsp;</td>
				    </tr>
				    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
				    <tr height="50">
					    <td>&nbsp;</td>
					    <td align="center">내용</td>
					    <td><textarea name="content" cols="50" rows="13" onFocus="clearMessage(this.form);" onKeyUp="checkByte(this.form);"></textarea></td>
					    <td>&nbsp;</td>
				    </tr>
				    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
				    <tr align="center">
					    <td>&nbsp;</td>
					    <td colspan="2">
						    <input type="submit" value="등록" />
						    <button type="button"onClick="window.location='mainList.do'">목록으로</button>
					    </td>
					    <td>&nbsp;</td>
				    </tr>
				</table>
				<table width="140" height="27" border="0" cellpadding="0" cellspacing="0">
				    <tr>
				    	<td align="left">
				    		<input type="text" name="messagebyte" value="0" size="1" maxlength="2" readonly />
				    		<font color="#000000">/ 4000 byte</font>
				    	</td>
				    </tr>
				</table>
				</form>
    		</td>
 		</tr>
    </table>
	</div>
</body>
</html>