
<%@ include file="/includes/header.jsp"%>
<%@ include file="/includes/debugInfo.jsp"%>
search result.jsp
<br>
<c:forEach var="result" items="${resultList}">
	${result.name} ${result.description} <br> 

	manage save edit whatever here<br>
</c:forEach>


<%@ include file="/includes/footer.jsp"%>
