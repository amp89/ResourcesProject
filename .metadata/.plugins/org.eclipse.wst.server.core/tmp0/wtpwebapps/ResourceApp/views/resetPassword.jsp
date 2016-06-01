<%@ include file="/includes/header.jsp"%>

<%@ include file="/includes/debugInfo.jsp"%>


<div class="row">
	<div class="col-xs-12 col-md-offset-4 col-md-4">

<form:form action="retrieveForgottonLogin.do" modelAttribute="user" method="POST">
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
			<td colspan="2"><button type="submit">Sign in</button></td>
		</tr>
	</table>

</form:form>

  </div>
  </div>

<%@ include file="/includes/footer.jsp"%>
