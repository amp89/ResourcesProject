
<%@ include file="/includes/header.jsp"%>
<div class="row">
	<div class="col-xs-12 col-md-offset-4 col-md-4">

	<form:form modelAttribute="user" action="getUserList.do">
		Search by email leave blank for all
		<table>
		
			<tr>
				<td>email</td>
				<td><form:input path="email" /></td>
			</tr>

		</table>
		<button type="submit">Find User</button>
	</form:form>
  </div>
  </div>

<%@ include file="/includes/footer.jsp"%>
