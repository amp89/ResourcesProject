
<%@ include file="/includes/header.jsp"%>
<%@ include file="/includes/debugInfo.jsp"%>
search result.jsp
<br>
<c:forEach var="result" items="${resultList}">
	${result.name} ${result.description} <br> 

	<form path="saveResource.do" method="POST">
		<button>save</button>
		THIS SHOULD GO ON THE RESOUCRE, NOT IN THE LIST (UNTIL JAVASCRIPT)
		<input type="hidden" name="resourceId" value="${result.name}"/>
	</form>
	<button>edit</button>
	<button>?</button>
	<button>?</button>
	manage save edit whatever here<br><br><br>
</c:forEach>


<%@ include file="/includes/footer.jsp"%>
