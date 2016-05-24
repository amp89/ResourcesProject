
<%@ include file="/includes/header.jsp"%>
<%@ include file="/includes/debugInfo.jsp"%>

<form:form modelAttribute="searchParam" action="search.do">
	<table>
		<tr>
			<td>Search Keywords:</td>
			<td><form:input type="text" path="queryString"/></td>
		</tr>
		<tr>
			<td>Include Unconfirmed Resources</td>
			<td><form:select path="minimumStatus">
				<option value="2" selected="selected">No</option>
				<option value="1">Yes</option>
			</form:select></td>
		</tr>
		
		
		
		<tr>
			<td>Category:</td>
			<td><form:select path="categoryId">
				<option selected="selected" value="">Any</option>
				<c:forEach var="category" items="${categoryList}">
				<option value="${category.id}">${category.name}</option>
				</c:forEach>
			</form:select></td>
		</tr>
		
		
		<tr>
			<td>Topic:</td>
			<td><form:select path="topicId">
				<option selected="selected" value="">Any</option>
				<c:forEach var="topic" items="${topicList}">
				<option value="${topic.id}">${topic.name}</option>
				</c:forEach>
			</form:select></td>
		</tr>
		
		
		
		
		<tr>
			<td colspan="2"><button type="submit">Search</button></td>
		</tr>
	</table>

</form:form>


<%@ include file="/includes/footer.jsp"%>
