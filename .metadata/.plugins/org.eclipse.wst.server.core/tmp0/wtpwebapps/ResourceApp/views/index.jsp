
<%@ include file="/includes/header.jsp"%>

<%-- <%@ include file="/includes/debugInfo.jsp"%> --%>
<div class="row center-text">
	<span class="title">
	Coding Resources
	</span>
</div>

<div class="row">
	
	
	<div class="col-xs-12 col-md-offset-4 col-md-4">

	

<form:form action="signIn.do" modelAttribute="user" method="POST">
	<table>
		<tr>
			<td>Username</td>
			<td><form:input type="text" path="userName" placeholder="username" /></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><form:input type="password" path="password" /></td>
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
  <div class="row center-text">
  <span class="info">
  *This project is working, but is still a work in progress*<br>
  Test Login, all permissions:<br>
  Username: owner<br>
  Password: password<br>
  
  Test login, contributor permissions:<br>
  Username: contributor<br>
  Password: password<br>
  
  For an overview of permissions, check out the <a target="_blank" href="http://www.alexmpeterson.com/resourceapp.php"> project description.</a><br>
  Feel free to play with the application, however, if you delete things please let me know at <a  href="mailto:mail@alexmpeterson.com?Subject=Resource DB Reset%!"> mail@alexmpeterson.com </a> so I can reset the database.<br>
  
  
  
  </span>
  </div>

<%@ include file="/includes/footer.jsp"%>
