
<%@ include file="/includes/header.jsp"%>


<div class="row">
	<div class="col-xs-12 col-md-offset-4 col-md-4">

<form action="confirm.do" method="post">
	
	
<table>
	<tr>
		<td>Username</td>

		<td>	<input type="text" name="userName"></td>
	</tr>
	<tr>
		<td>Confirmation Key</td>
		<td><input type="text" name="confirmationKey"></td>
	</tr>
	<tr>
		<td>Password</td>
		<td><input type="password" name="password"></td>
	</tr>
</table>

	<button type="submit">Confirm Account</button>

</form>

  </div>
  </div>
<%@ include file="/includes/footer.jsp"%>
