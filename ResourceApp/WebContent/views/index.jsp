
<%@ include file="/includes/header.jsp"%>

<%-- <%@ include file="/includes/debugInfo.jsp"%> --%>


<form:form action="signIn.do" modelAttribute="user" method="POST">
	<table>
		<tr>
			<td>Username</td>
			<td><form:input type="text" path="userName" value="ampeterson" /></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><form:input type="password" path="password" value="hi" /></td>
		</tr>
		<tr>
			<td colspan="2"><button type="submit">Sign in</button></td>
		</tr>
	</table>

</form:form>

<form action="setUpSignUp.do">
	<button>Sign Up</button>
</form>

<form action="setUpRetrieveForgottenLogin.do" method="POST">
	<button type="submit">I forgot my password</button>
</form>



<%@ include file="/includes/footer.jsp"%>
