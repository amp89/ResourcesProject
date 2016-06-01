
<%@ include file="/includes/header.jsp"%>
<div class="row">
	<div class="col-xs-12 col-md-offset-4 col-md-4">

<c:if test="${currentUser.userType.accessLevel > 2 }">

userMenu.jsp currentUser = ${currentUser.firstName}
<form method="POST" action="setResourceStatus.do">
<input type="hidden" name="resourceId" value="${ codeResource.id }"/>
	<table>
	
		<tr>
			<td>Topic</td>
			<td><select name="statusId" required="required">
						<option>select one</option>
					<c:forEach var="status" items="${statusList}">
						<option value="${status.id}"
						
			<c:if test="${status.id == codeResource.status.id}">
							
							selected="selected"
							</c:if>
						
						>${status.name}</option>
					</c:forEach>
				</select></td>
		</tr>

	</table>


	<button type="submit">Submit Changes</button>

</form>

</c:if>
  </div>
  </div>
<%@ include file="/includes/footer.jsp"%>
