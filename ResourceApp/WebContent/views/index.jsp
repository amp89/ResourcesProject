
<%@ include file="/includes/header.jsp"%>

<%-- <%@ include file="/includes/debugInfo.jsp"%> --%>
<div class="row">
	<div class="col-xs-12 col-md-offset-4 col-md-4">



<form:form action="signIn.do" modelAttribute="user" method="POST">
	<table>
		<tr>
			<td>Username</td>
			<td><form:input type="text" path="userName" value="owner" /></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><form:input type="password" path="password" value="password" /></td>
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


  </div>
  </div>

<%@ include file="/includes/footer.jsp"%>
