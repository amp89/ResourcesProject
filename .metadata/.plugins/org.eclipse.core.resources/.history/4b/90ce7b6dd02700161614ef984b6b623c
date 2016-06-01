
<%@ include file="/includes/header.jsp"%>
<%@ include file="/includes/debugInfo.jsp"%>
view resource jsp
<br>
<br>
${resource.id}<br>
${resource.name}<br>
${resource.description}<br>
${resource.linkTitle}<br>
${resource.link}<br>
${resource.dateAdded}<br>
${resource.status.id}<br>
	<form action="saveResource.do" method="POST">
		<button>save</button>
		Add comments and save
		<input type="text" name="comments" />
		<input type="hidden" name="resourceId" value="${resource.id}"/>
	</form>
<c:if test="${currentUser.userType.accessLevel > 2 }">

	<form action="setUpSetResourceStatus.do" method="POST">
		<button>set status</button>
		<input type="hidden" name="resourceId" value="${resource.id}" />

	</form>
</c:if>

<c:if test="${currentUser.userType.accessLevel > 3 }">
<form action="deleteCodeResource.do">
		<input type="hidden" name="resourceId" value="${resource.id}"/>
	
	<button>delete</button>
</form>

	<form action="setUpEditResource.do" method="POST">
		<button>edit</button>
		<input type="hidden" name="resourceId" value="${resource.id}" />
	</form>

</c:if>
<%@ include file="/includes/footer.jsp"%>
