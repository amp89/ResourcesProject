
<%@ include file="/includes/header.jsp"%>

<c:forEach var="result" items="${resultList}">
	<div class="col-xs-12 col-md-4">
	<div class="box">
	<span class="box-title">${result.name}</span><br>
    ${result.description} <br> 


	<form action="viewResource.do" method="POST">
		<button>More about this resource</button>
		<input type="hidden" name="resourceId" value="${result.id}"/>
	</form>
	
	</div>
  </div>
</c:forEach>

<%@ include file="/includes/footer.jsp"%>
