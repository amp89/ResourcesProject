
<%@ include file="/includes/header.jsp"%>
<%@ include file="/includes/debugInfo.jsp"%>


user listsslsdfjds
<c:forEach var="singleUser" items="${userList}">

	${singleUser.id}<br>
	${singleUser.userName}<br>
	${singleUser.firstName}<br>
	${singleUser.lastName}<br>
	${singleUser.email}<br>
	${singleUser.password}<br>
	${singleUser.userConfirmationKey}<br>
	${singleUser.dateJoined}<br>
	${singleUser.userType.typeName}<br>

	<form action="viewUser.do" method="POST">
		<input type="hidden" name="userId" value="${singleUser.id}" />
		<button type="submit">View / Edit This User</button>	
	</form>

</c:forEach>


<%@ include file="/includes/footer.jsp"%>
