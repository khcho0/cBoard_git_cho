<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c"uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
		<title>게시판</title>
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
			<table style="margin:0px;padding:0px;align:center">
				<tr height="80">
					<td style="margin:0px;padding:0px">
						<div style="position:absolute;left:800;bottom:710;font-size:14pt;font-weight:bold;color:#35BDF5"></div>
						<tr>
							<td>
								<h2>게시판</h2>
							</td>
							<td>
								<h4><a href="logOutPro.do">로그아웃</a></h4>
							</td>
						</tr>
						<tr>
							<td style="margin:0px;padding:0px;background-color:white"><br></td>
						</tr>
						<tr>
							<td style="margin:0px;padding:0px;width:900px;border:2px solid gray;padding:5px;">
						<table cellpadding="0" cellspacing="0" style="width:100%;margin:0px;padding:0px;border:1px solid gray">
							<colgroup>
								<col width="10%">
								<col width="20%">
								<col width="20%">
								<col width="15%">
								<col width="15%">
							</colgroup>
						<tr height="50">
							<td style="text-align:center;font-size:10pt;border-bottom:1px solid gray">글번호</td>
							<td colspan="2" style="text-align:center;font-size:10pt;border-bottom:1px solid gray">제목</td>
							<td style="text-align:center;font-size:10pt;border-bottom:1px solid gray">작성자</td>
							<td style="text-align:center;font-size:10pt;border-bottom:1px solid gray">작성일</td>
						</tr>
							<c:forEach items="${result}" var="result">
								<tr height="40">
									<td style="text-align:center;font-size:9pt;border-bottom:1px solid gray">${result.CODE }</td>
									<td colspan="2" style="text-align:center;font-size:9pt;border-bottom:1px solid gray"><a href ="content.do?code=${result.CODE}">${result.TITLE}</a></td>
									<td style="text-align:center;font-size:9pt;border-bottom:1px solid gray">${result.ID}</td>
									<td style="text-align:center;font-size:9pt;border-bottom:1px solid gray">${result.INS_DATE}</td>
								</tr>
							</c:forEach>
								<%-- <tr height="50">
									<td style="text-align:center;font-size:10pt;border-bottom:1px solid gray">글번호</td>
									<td colspan="2" style="text-align:center;font-size:10pt;border-bottom:1px solid gray">제목</td>
									<td style="text-align:center;font-size:10pt;border-bottom:1px solid gray">작성자</td>
									<td style="text-align:center;font-size:10pt;border-bottom:1px solid gray">작성일</td>
								</tr>
							<c:forEach items="${s_result}" var="s_result">
								<tr height="40">
									<td style="text-align:center;font-size:9pt;border-bottom:1px solid gray">${s_result.CODE }</td>
									<td colspan="2" style="text-align:center;font-size:9pt;border-bottom:1px solid gray"><a href ="content.do?code=${s_result.CODE}">${s_result.TITLE}</a></td>
									<td style="text-align:center;font-size:9pt;border-bottom:1px solid gray">${s_result.ID}</td>
									<td style="text-align:center;font-size:9pt;border-bottom:1px solid gray">${s_result.INS_DATE}</td>
								</tr>
							</c:forEach> --%>
						</table>
							</td>
						</tr>
						<tr>
							<td>
								<form name="searchForm" method="post" action="mainList.do">
									<table>
										<tr>
											<td>
												<select name="search">
													<option value="">----선택----</option>
													<option value="code">번호</option>
													<option value="id">작성자 ID</option>
													<option value=title>제목</option>
												</select>
											</td>
											<td>
												<input type="text" name="searchValue" />
											</td>
											<td>
												<input type="submit" value="검색" />
											</td>
										</tr>
									</table>
								</form>
							</td>
							<td align = "right">
								<button type="button" onClick="window.location='writeForm.do'">게시글 작성</button>
							</td>
						</tr>
						<tr height="40">
			               <td colspan="5" align="center">
								<c:if test="${boardCount > 0}">
			                  	<c:if test="${startPage > pageSize}">
			                  		<a href="/mainList.do?pageNum=1&pageBlock=${pageBlock }" style="text-decoration:none;font-size:12pt">◀◀&nbsp;&nbsp;</a>
			                  	</c:if>
			                  	<c:if test="${startPage > pageSize}">
			                  		<a href="/mainList.do?pageNum=${startPage - pageSize }&pageBlock=${pageBlock }" style="text-decoration:none;font-size:12pt">◀&nbsp;&nbsp;</a>
			                  	</c:if>
			                  	<c:forEach var="i" begin="${startPage}" end="${endPage}">
			                  	<c:if test="${i != nowPage }">
				                  	<a href="/mainList.do?pageNum=${i}&pageBlock=${pageBlock }" style="color:black;text-decoration:none">${i}&nbsp;&nbsp;</a>
				                </c:if>
								<c:if test="${i == nowPage }">
									<a href="/mainList.do?pageNum=${i}&pageBlock=${pageBlock }" style="color:red;text-decoration:none"><u>${i}</u>&nbsp;&nbsp;</a>
								</c:if>
							</c:forEach>
								<c:if test="${endPage < pageCount}">
									<a href="/mainList.do?pageNum=${startPage + pageSize}&pageBlock=${pageBlock }" style="text-decoration:none;font-size:12pt">&nbsp;▶</a>
								</c:if>
								<c:if test="${endPage < pageCount}">
									<a href="/mainList.do?pageNum=${pageCount}&pageBlock=${pageBlock }" style="text-decoration:none;font-size:12pt">&nbsp;▶▶</a>
								</c:if>
								</c:if>
			               </td>
			            </tr>
					</table>
				</div>
			</body>
		</html>