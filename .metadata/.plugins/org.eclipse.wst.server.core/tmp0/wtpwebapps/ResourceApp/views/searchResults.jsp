
<%@ include file="/includes/header.jsp"%>
<div class="row">
	<div class="col-xs-12 col-md-offset-4 col-md-4">

<c:forEach var="result" items="${resultList}">
	${result.name} ${result.description} <br> 


	<form action="viewResource.do" method="POST">
		<button>view</button>
		<input type="hidden" name="resourceId" value="${result.id}"/>
	</form>
	
</c:forEach>

  </div>
  </div>
<%@ include file="/includes/footer.jsp"%>
