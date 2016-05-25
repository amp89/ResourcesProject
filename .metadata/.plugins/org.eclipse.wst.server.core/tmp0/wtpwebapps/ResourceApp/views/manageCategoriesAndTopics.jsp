
<%@ include file="/includes/header.jsp"%>

<%@ include file="/includes/debugInfo.jsp"%>


userMenu.jsp currentUser = ${currentUser.firstName}

<table>
	<tr>
	<form action="modifyCategory.do" method="POST">
		<td>Category</td>
		<td><select name="categoryId">
				<option value="">select one</option>
				<c:forEach var="category" items="${categoryList}">
					<option value="${category.id}">${category.name}</option>
				</c:forEach>
				</form></td>
		<td colspan="2">
			<input type="text" name="newCategory" placeholder="New Category Name, Leave blank to delete"/>
		</td>
		<td>
			<button type="submit">Delete/Modify category</button>
		</td>
	</form>
	</tr>
</table>

<table>
	<tr>
	<form action="modifyTopic.do" method="POST">
		<td>Topic</td>
		<td><select name="topicId">
				<option value="">select one</option>
				<c:forEach var="topic" items="${topicList}">
					<option value="${topic.id}">${topic.name}</option>
				</c:forEach>
				</form></td>
		<td colspan="2">
			<input type="text" name="newTopic" placeholder="New Topic Name, Leave blank to delete"/>
		</td>
		<td>
			<button type="submit">Delete/Modify topic</button>
		</td>
	</form>
	</tr>
</table>
<table>
	<tr>
	<form action="addCategory.do" method="POST">
		<td>New Category</td>
		<td colspan="2">
			<input type="text" name="categoryName" placeholder="New Category Name" required="required"/>
		</td>
		<td>
			<button type="submit">Add category</button>
		</td>
	</form>
	</tr>
</table>

<table>
	<tr>
	<form action="addTopic.do" method="POST">
		<td>New Topic</td>

		<td colspan="2">
			<input type="text" name="topicName" placeholder="New Topic Name" required="required"/>
		</td>
		<td>
			<button type="submit">Add topic</button>
		</td>
	</form>
	</tr>
</table>






<%@ include file="/includes/footer.jsp"%>
