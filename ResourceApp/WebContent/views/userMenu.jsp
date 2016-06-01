
<%@ include file="/includes/header.jsp"%>

<%@ include file="/includes/debugInfo.jsp"%>


userMenu.jsp currentUser = ${currentUser.firstName}

<form action="logout.do">
	<button type="submit">Logout</button>
</form>
<form action="selfManage.do">
	<button type="submit">Manage Account</button>
</form>
<form action="setUpSearch.do">
	<button type="submit">Search for resources</button>
</form>
<c:if test="${currentUser.userType.accessLevel > 1}">
	<form action="setUpContribute.do">
		<button type="submit">Contribute resources</button>
	</form>
</c:if>


<c:if test="${currentUser.userType.accessLevel > 3}">
<form action="setUpManageCategoriesAndTopics.do">
	<button type="submit">ManageCategoriesAndTopics</button>
</form>

</c:if>

<form action="setUpSearchUserResources.do">
	<button type="submit">search my stuff</button>
</form>

<c:if test="${currentUser.userType.accessLevel > 4}">

	<form action="setUpManageUsers.do">
		<button type="submit">Manage Users</button>
	</form>

</c:if>





<%@ include file="/includes/footer.jsp"%>
