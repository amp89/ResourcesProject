
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
${resource.status}<br>
	<form action="saveResource.do" method="POST">
		<button>save</button>
		Add comments and save
		<input type="text" name="comments" />
		<input type="hidden" name="resourceId" value="${resource.id}"/>
	</form>

<%@ include file="/includes/footer.jsp"%>
