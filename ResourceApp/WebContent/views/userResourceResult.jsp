
<%@ include file="/includes/header.jsp"%>
<%@ include file="/includes/debugInfo.jsp"%>
user resource result jsp
<br>
<c:forEach var="result" items="${resultList}">
	${result.name} ${result.description} <br> 
	<form action="viewResource.do" method="POST">
		<input type="hidden" name="resourceId" value="${result.id }" />		
		<button type="submit">View</button>
	</form>
	<form action="deleteSavedResource.do" method="POST">

		<input type="hidden" name="resourceId" value="${result.id}" />
		
	<button type="submit">Remove from saved resources</button>
	</form>
	
</c:forEach>


<%@ include file="/includes/footer.jsp"%>
