
<%@ include file="/includes/header.jsp"%>

<div class="row">
	<div class="col-xs-12 col-md-offset-4 col-md-4 center-text">


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

  </div>
  </div>



<%@ include file="/includes/footer.jsp"%>
