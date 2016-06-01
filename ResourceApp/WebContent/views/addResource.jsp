
<%@ include file="/includes/header.jsp"%>


<div class="row">
	<div class="col-xs-12 col-md-offset-4 col-md-4">
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
		</tr>

	</table>
	Code Snippet<br>	
	<form:textarea maxlength="5000" rows="10" cols="60" path="codeSnippet"></form:textarea>
			<br>Description<br>
	<%-- <td><form:input type="text" path="description" /></td> --%>
	<form:textarea maxlength="5000" rows="10" cols="60" path="description"></form:textarea><br>



	<c:if test="${currentUser.userType.accessLevel > 2}">

		<button type="submit">Submit</button>

	</c:if>
	<c:if test="${currentUser.userType.accessLevel < 3}">
		<button type="submit">Submit for review</button>
	</c:if>
</form:form>
</div>
</div>


<%@ include file="/includes/footer.jsp"%>
