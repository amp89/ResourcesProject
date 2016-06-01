
<%@ include file="/includes/header.jsp"%>

	<form:form modelAttribute="user" action="signUp.do">
		<table>
			<tr>
				<td>Firstname</td>
				<td><form:input path="firstName" type="text"/></td>
			</tr>
			
			<tr>
				<td>Lastname</td>
				<td><form:input path="lastName" type="text"/></td>
			</tr>
			
			<tr>
				<td>email</td>
				<td><form:input path="email" type="email"/></td>
			</tr>
			
			<tr>
				<td>password</td>
				<td><form:input path="password" type="password"/></td>
			</tr>
			
			<tr>
				<td>desired username</td>
				<td><form:input path="userName" type="text"/></td>
			</tr>
			
<%-- 	add later w/ js
		<tr>
				<td>repeat password</td>
				<td>disabled atm. use js. prev default button.  data vaid, submit()</td>
			</tr> --%>
			
		</table>
		<button type="submit">Sign up!</button>
	</form:form>
${errorMessage}
<%@ include file="/includes/footer.jsp" %>
