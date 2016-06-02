
<%@ include file="/includes/header.jsp"%>


<c:if test="${empty(resultList)}">
No results.  Your search parameters are too specific, or you have not saved any resources. <a href="setUpSearchUserResources.do">Search again.</a>
</c:if>


<c:forEach var="result" items="${resultList}">

	<div class="col-xs-12 col-md-4">
	<div class="box">
	<span class="box-title">${result.name}</span><br>
	 ${result.description} <br>
	<%-- fix comments --%>
	<form action="viewResource.do" method="POST">
		<input type="hidden" name="resourceId" value="${result.id }" />		
		<button type="submit">View this resource</button>
	</form>
	<form action="deleteSavedResource.do" method="POST">

		<input type="hidden" name="resourceId" value="${result.id}" />
		
	<button type="submit">Remove from saved resources</button>
	</form>
	</div>
	</div>
</c:forEach>


<%@ include file="/includes/footer.jsp"%>
