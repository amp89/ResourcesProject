
<%@ include file="/includes/header.jsp"%>
<%@ include file="/includes/debugInfo.jsp"%>

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


<%@ include file="/includes/footer.jsp"%>