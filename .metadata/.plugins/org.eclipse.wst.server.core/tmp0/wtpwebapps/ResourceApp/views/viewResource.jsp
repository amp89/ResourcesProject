
<%@ include file="/includes/header.jsp"%>
<div class="row">
	<div class="col-xs-12 col-md-offset-4 col-md-4">

<br>
<%-- ${resource.id}<br> --%>
<span class="box-title">Name: ${resource.name}</span><br>
<span class="box-title">Description:</span> ${resource.description}<br>
<span class="box-title">Link:</span> <a target="_blank" href="${resource.link}">${resource.linkTitle}</a><br>
<span class="box-title">Date Added:</span> ${resource.dateAdded}<br>
<span class="box-title">Status:</span> ${resource.status.name}<br>
<c:if test="${!empty(resource.codeSnippet)}">
	<span class="box-title">Code snippet:</span><br>
	${resource.codeSnippet}<br>
</c:if>
	<form action="saveResource.do" method="POST">
		Add comments and save
		<button>Save this to your account.</button>
		<textarea maxlength="5000" rows="10" cols="60" name="comments"></textarea>
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
	<c:if test="${resource.status.id < 3}">
	<form action="setUpEditResource.do" method="POST">
		<button>edit</button>
		<input type="hidden" name="resourceId" value="${resource.id}" />
	</form>

	</c:if>
</c:if>

  </div>
  </div>
<%@ include file="/includes/footer.jsp"%>
