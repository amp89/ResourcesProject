
<%@ include file="/includes/header.jsp"%>


userMenu.jsp

currentUser = ${currentUser.firstName}

<form action="logout.do">
<button type="submit">Logout</button>
</form>
<form action="selfManage.do">
<button type="submit">Manage Account</button>
</form>



<%@ include file="/includes/footer.jsp"%>
