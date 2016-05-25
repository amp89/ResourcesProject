
<%@ include file="/includes/header.jsp"%>
<%@ include file="/includes/debugInfo.jsp"%>
user resource result jsp
<br>
<c:forEach var="result" items="${resultList}">
	${result.name} ${result.description} <br> 

	
	<button>delete</button>
	<button>?</button>
	<button>?</button>
	manage save edit whatever here<br><br><br>
</c:forEach>


<%@ include file="/includes/footer.jsp"%>
