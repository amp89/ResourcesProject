
<%@ include file="/includes/header.jsp"%>

<%@ include file="/includes/debugInfo.jsp"%>


userMenu.jsp

currentUser = ${currentUser.firstName}

<form action="logout.do">
<button type="submit">Logout</button>
</form>
<form action="selfManage.do">
<button type="submit">Manage Account</button>
</form>
<form action="setUpSearch.do">
<button type="submit">Search for resources</button>
</form>
<form action="setUpContribute.do">
<button type="submit">Contribute resources</button>
</form>

<form action="setUpManageCategoriesAndTopics.do">
	<button type="submit">ManageCategoriesAndTopics</button>
</form>

<form action="setUpSearchUserResources.do">
	<button type="submit">search my stuff</button>
</form>




<%@ include file="/includes/footer.jsp"%>
