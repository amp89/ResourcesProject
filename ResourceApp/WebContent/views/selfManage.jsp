
<%@ include file="/includes/header.jsp"%>



<div class="row">
	<div class="col-xs-12 col-md-offset-4 col-md-4">

${currentUser.id}<br>
Name: ${currentUser.firstName} ${currentUser.lastName} <br>
email: ${currentUser.email}<br>
Account Type: ${currentUser.userType.typeName}<br>
Year Joined: ${currentUser.year}

<form action="setUpChangePassword.do" method="POST">
	<button type="submit">Change Password</button>
</form>

<form action="setUpChangeEmail.do" method="POST">
	<button type="submit">Change Email</button>
</form>


<form action="deleteSelf.do">
	<input type="hidden" name="userId" value="${currentUser.id}" />
	<button type="submit">Delete own account</button>
</form>


  </div>
  </div>
<%@ include file="/includes/footer.jsp"%>