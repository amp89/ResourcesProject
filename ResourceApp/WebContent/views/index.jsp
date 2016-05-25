
<%@ include file="/includes/header.jsp"%>


DEBUG - currentUser: ${currentUser.firstName}

<form:form action="signIn.do" modelAttribute="user" method="POST">
	<table>
		<tr>
			<td>Username</td>
			<td><form:input type="text" path="userName"/></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><form:input type="text" path="password" /></td>
		</tr>
		<tr>
			<td colspan="2"><button type="submit">Sign in</button></td>
		</tr>
	</table>

</form:form>
message: ${message}
error message: ${errorMessage}
<button>Forgot password</button>

<form:form action="setUpSignUp.do">
<button>Sign Up</button>
</form:form>
<form action="setUpRetrieveForgottenLogin.do" method="POST">
<button type="submit" >I forgot my password :(</button>
</form>


<%@ include file="/includes/footer.jsp"%>