
<%@ include file="/includes/header.jsp"%>


<c:forEach var="singleUser" items="${userList}">

<div class="col-xs-12 col-md-4">
<div class="box">
	Id: ${singleUser.id}<br>
	Username: ${singleUser.userName}<br>
	Name: ${singleUser.firstName} ${singleUser.lastName}<br>
	Email: ${singleUser.email}<br>
	Password: ${singleUser.password}<br>
	Year Joined: ${singleUser.year}<br>
	UserType: ${singleUser.userType.typeName}<br>

	<form action="viewUser.do" method="POST">
		<input type="hidden" name="userId" value="${singleUser.id}" />
		<button type="submit">View / Edit This User</button>	
	</form>
</div>
</div>

</c:forEach>


<%@ include file="/includes/footer.jsp"%>
