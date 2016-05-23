
<%@ include file="/includes/header.jsp"%>

${currentUser.userName}
${errorMessage }
Change password

<form action="changeEmail.do" method="POST">
	<table>
		<tr>
			<td>Password:</td>
			<td><input type=text name="password"/></td>
		</tr>
		<tr>
			<td>New Email</td>
			<td><input type=text name="newEmail"/></td>
		</tr>
		<tr>
			<td>New Email again</td>
			<td></td>
		</tr>
	
	</table>
	
<!-- 	<input name="oldPassword"></input>
	<input name="newPassword"><input> -->
	<button type="submit">Change Email</button>
</form>




<%@ include file="/includes/footer.jsp"%>