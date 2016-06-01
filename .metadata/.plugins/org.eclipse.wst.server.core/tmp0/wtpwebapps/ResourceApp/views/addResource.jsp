
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
						<option value="${category.id}">${category.name}</option>
					</c:forEach>
				</form:select></td>
		</tr>
		<tr>
			<td>Topic</td>
			<td><form:select path="topicId" required="required">
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
	
			Description<br>
	<%-- <td><form:input type="text" path="description" /></td> --%>
	<form:textarea maxlength="5000" rows="10" cols="60" path="description"></form:textarea>



	<c:if test="${currentUser.userType.accessLevel > 2}">

		<button type="submit">Submit</button>

	</c:if>
	<c:if test="${currentUser.userType.accessLevel < 3}">
		<button type="submit">Submit for review</button>
	</c:if>
</form:form>



<%@ include file="/includes/footer.jsp"%>
