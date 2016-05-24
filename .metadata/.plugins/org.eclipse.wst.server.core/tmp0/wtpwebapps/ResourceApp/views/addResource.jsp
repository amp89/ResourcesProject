
<%@ include file="/includes/header.jsp"%>

<%@ include file="/includes/debugInfo.jsp"%>


userMenu.jsp currentUser = ${currentUser.firstName}

<form:form modelAttribute="codeResourceToAdd" action="contribute.do">
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
			<td><form:select path="categoryId">
						<option>select one</option>
					<c:forEach var="category" items="${categoryList}">
						<option value="${category.id}">${category.name}</option>
					</c:forEach>
				</form:select></td>
		</tr>
		<tr>
			<td>Topic</td>
			<td><form:select path="topicId">
						<option>select one</option>
					<c:forEach var="topic" items="${topicList}">
						<option value="${topic.id}">${topic.name}</option>
					</c:forEach>
				</form:select></td>
		</tr>
		<tr>
			<td>Code Snippet</td>
			<td><form:input type="text" path="codeSnippet" /></td>
		</tr>

	</table>


	//change this button based on user type
	<button type="submit">Submit for review</button>

</form:form>



<%@ include file="/includes/footer.jsp"%>
