<%@ include file="/includes/header.jsp"%>

<%@ include file="/includes/debugInfo.jsp"%>



<form:form action="resetLogin.do" modelAttribute="user" method="POST">
	<table>
		<tr>
			<td>Username</td>
			<td><form:input type="text" path="userName"/></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><form:input type="text" path="email" /></td>
		</tr>
		<tr>
			<td>Confirmation Key</td>
			<td><form:input type="text" path="userConfirmationKey"/></td>
		</tr>
		<tr>
			<td>New Password</td>
			<td><form:input type="text" path="password" /></td>
		</tr>
		<tr>
			<td>New Password</td>
			<td>confirm password, get later, js</td>
		</tr>
		<tr>
			<td colspan="2"><button type="submit">Change Password</button></td>
		</tr>
	</table>

</form:form>


<%@ include file="/includes/footer.jsp"%>
