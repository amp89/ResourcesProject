
<%@ include file="/includes/header.jsp"%>
<%@ include file="/includes/debugInfo.jsp"%>


<c:forEach var="singleUser" items="${userList}">

<div class="col-xs-12 col-md-4">
<div class="userbox">
	${singleUser.id}<br>
	${singleUser.userName}<br>
	${singleUser.firstName}<br>
	${singleUser.lastName}<br>
	${singleUser.email}<br>
	${singleUser.password}<br>
	${singleUser.dateJoined}<br>
	${singleUser.userType.typeName}<br>

	<form action="viewUser.do" method="POST">
		<input type="hidden" name="userId" value="${singleUser.id}" />
		<button type="submit">View / Edit This User</button>	
	</form>
</div>
</div>

</c:forEach>


<%@ include file="/includes/footer.jsp"%>
