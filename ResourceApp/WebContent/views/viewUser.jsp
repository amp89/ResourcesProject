
<%@ include file="/includes/header.jsp"%>
<div class="row">
	<div class="col-xs-12 col-md-offset-4 col-md-4">

<c:if test="${currentUser.userType.accessLevel > 4 }">
<a href="setUpManageUsers.do">Back to user search</a>
</c:if>

<form:form modelAttribute="user" action="modifyUser.do">
	<form:input type="hidden" path="id" />
	<table>
		<tr>
			<td>username</td>
			<td><form:input path="userName" /></td>
		</tr>
		<tr>
			<td>Firstname</td>
			<td><form:input path="firstName" /></td>
		</tr>

		<tr>
			<td>Lastname</td>
			<td><form:input path="lastName" /></td>
		</tr>

		<tr>
			<td>email</td>
			<td><form:input path="email" /></td>
		</tr>

		<tr>
			<td>password</td>
			<td><form:input path="password" /></td>
		</tr>

		<tr>
			<td>confirmation key</td>
			<td><form:input path="userConfirmationKey" /></td>
		</tr>


		<tr>

			${user.userType.id}
			<td colspan="2"><select name="userTypeId">
					<c:forEach var="userType" items="${userTypeList}">
						<option value="${userType.id}"
							<c:if test="${user.userType.id == userType.id}">
					selected="selected"
				</c:if>>${userType.typeName}</option>
					</c:forEach>
			</select></td>
		</tr>







	</table>
	<button type="submit">Submit Changes</button>
</form:form>


<form action="deleteUser.do">
	<input type="hidden" name="userId" value="${user.id}">
	<button type="submit">Delete</button>
</form>

  </div>
  </div>
<%@ include file="/includes/footer.jsp"%>
