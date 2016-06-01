
<%@ include file="/includes/header.jsp"%>



<div class="row">
	<div class="col-xs-12 col-md-offset-2 col-md-8">



	<form action="modifyCategory.do" method="POST">
<table>
	<tr>
	<td colspan="3">	<span class="box-title">Edit or Delete:
		</span>
		</td>
	</tr>
	<tr>

		<td>Category</td>
		<td><select name="categoryId">
				<option value="">select one</option>
				<c:forEach var="category" items="${categoryList}">
					<option value="${category.id}">${category.name}</option>
				</c:forEach></select>
				</td>
		<td colspan="2">
			<input type="text" name="newCategory" placeholder="New Category Name, Leave blank to delete"/>
		</td>
		<td>
			<button type="submit">Delete/Modify category</button>
		</td>
	</tr>
</table>
	</form>

	<form action="modifyTopic.do" method="POST">
<table>
	<tr>
		<td>Topic</td>
		<td><select name="topicId">
				<option value="">select one</option>
				<c:forEach var="topic" items="${topicList}">
					<option value="${topic.id}">${topic.name}</option>
				</c:forEach>
				</select></td>
		<td colspan="2">
			<input type="text" name="newTopic" placeholder="New Topic Name, Leave blank to delete"/>
		</td>
		<td>
			<button type="submit">Delete/Modify topic</button>
		</td>
	</tr>
</table>
</form>

	<form action="addCategory.do" method="POST">
<table>
	<tr>
	<td colspan="3">	<span class="box-title">Add new:
		</span>
		</td>
	</tr>
	<tr>
		<td>New Category</td>
		<td colspan="2">
			<input type="text" name="categoryName" placeholder="New Category Name" required="required"/>
		</td>
		<td>
			<button type="submit">Add category</button>
		</td>
	</tr>
</table>
</form>

	<form action="addTopic.do" method="POST">

<table>
	<tr>
		<td>New Topic</td>

		<td colspan="2">
			<input type="text" name="topicName" placeholder="New Topic Name" required="required"/>
		</td>
		<td>
			<button type="submit">Add topic</button>
		</td>
	</tr>
</table>

	</form>



  </div>
  </div>

<%@ include file="/includes/footer.jsp"%>
