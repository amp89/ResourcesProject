
<%@ include file="/includes/header.jsp"%>

<div class="row">
	<div class="col-xs-12 col-md-offset-4 col-md-4">
Change password

<form action="changePassword.do" method="POST">
	<table>
		<tr>
			<td>Old Password:</td>
			<td><input type="password" name="oldPassword"/></td>
		</tr>
		<tr>
			<td>New Password</td>
			<td><input type="password" name="newPassword"/></td>
		</tr>
		<tr>
			<td>New Password again</td>
			<td></td>
		</tr>
	
	</table>
	
<!-- 	<input name="oldPassword"></input>
	<input name="newPassword"><input> -->
	<button type="submit">Change Password</button>
</form>

  </div>
  </div>




<%@ include file="/includes/footer.jsp"%>