package data;

public class SearchParam {
	
	private String queryString;
	
	private Integer minimumStatus;
	
	private Integer categoryId;
	
	private Integer topicId;

	public String getQueryString() {
		return queryString;
	}

	public void setQueryString(String queryString) {
		this.queryString = queryString;
	}

	public Integer getMinimumStatus() {
		return minimumStatus;
	}

	public void setMinimumStatus(Integer minimumStatus) {
		this.minimumStatus = minimumStatus;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public Integer getTopicId() {
		return topicId;
	}

	public void setTopicId(Integer topicId) {
		this.topicId = topicId;
	}

	@Override
	public String toString() {
		return "SearchParam [queryString=" + queryString + ", minimumStatus=" + minimumStatus + ", categoryId="
				+ categoryId + ", topicId=" + topicId + "]";
	}

	
	
}
