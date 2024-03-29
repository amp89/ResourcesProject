
<%@ include file="/includes/header.jsp"%>

<%@ include file="/includes/debugInfo.jsp"%>
<div class="row">
	<div class="col-xs-12 col-md-offset-4 col-md-4">


<c:if test="${currentUser.userType.accessLevel > 3}">

<form:form modelAttribute="codeResource" action="editResource.do">
<form:input type="hidden" path="id"/>
	<table>
		<tr>
			<td>Name</td>
			<td><form:input type="text" path="name" /></td>
		</tr>

		<tr>
			<td>Description</td>
			<td><form:input type="text" path="description" /></td>
		</tr>

		<tr>
			<td>Link Title</td>
			<td><form:input type="text" path="linkTitle" /></td>
		</tr>

		<tr>
			<td>Link</td>
			<td><form:input type="text" path="link" /></td>
		</tr>

		<tr>
			<td>Category</td>
				<td><form:select path="categoryId" required="required">
							<option>select one</option>
						<c:forEach var="category" items="${categoryList}">
							<option value="${category.id}"
							<c:if test="${category.id == codeResource.categoryId}">
							
							selected="selected"
							</c:if>
							
							
							
							>${category.name}</option>
							
							
					
						</c:forEach>
					</form:select></td>
		</tr>
		<tr>
			<td>Topic</td>
			<td><form:select path="topicId" required="required">
						<option>select one</option>
					<c:forEach var="topic" items="${topicList}">
						<option value="${topic.id}"
						
			<c:if test="${topic.id == codeResource.topicId}">
							
							selected="selected"
							</c:if>
						
						>${topic.name}</option>
					</c:forEach>
				</form:select></td>
		</tr>
		<tr>
			<td>Code Snippet</td>
			<td><form:input type="text" path="codeSnippet" /></td>
		</tr>

	</table>

	<input type="hidden" name="currentUserId" value="${currentUser.id}" />
	<button type="submit">Submit Changes</button>

</form:form>

</c:if>
  </div>
  </div>
<%@ include file="/includes/footer.jsp"%>
