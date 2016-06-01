
<%@ include file="/includes/header.jsp"%>
<%@ include file="/includes/debugInfo.jsp"%>
search result.jsp
<br>
<c:forEach var="result" items="${resultList}">
	${result.name} ${result.description} <br> 


	<form action="viewResource.do" method="POST">
		<button>view</button>
		<input type="hidden" name="resourceId" value="${result.id}"/>
	</form>
	
</c:forEach>


<%@ include file="/includes/footer.jsp"%>
