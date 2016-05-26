
<%@ include file="/includes/header.jsp"%>

<%@ include file="/includes/debugInfo.jsp"%>


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
<%@ include file="/includes/footer.jsp"%>
