
<%@ include file="/includes/header.jsp"%>

<div class="row">
	<div class="col-xs-12 col-md-offset-4 col-md-4">
		<form action="changeEmail.do" method="POST">
				Change password
			<table>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="password" /></td>
				</tr>
				<tr>
					<td>New Email</td>
					<td><input type="email" name="newEmail" /></td>
				</tr>
				<%-- 	add later	<tr>
			<td>New Email again</td>
			<td></td>
		</tr>
 --%>
			</table>
			<button type="submit">Change Email</button>
		</form>
	</div>
</div>




<%@ include file="/includes/footer.jsp"%>