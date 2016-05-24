package data;

public class CodeResourceToAdd {
	private int id;

	private String name;

	private String description;

	private String linkTitle;
	
	private String link;
	
	
	
	private Integer topicId;
	
	private Integer categoryId;


	private String codeSnippet;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLinkTitle() {
		return linkTitle;
	}

	public void setLinkTitle(String linkTitle) {
		this.linkTitle = linkTitle;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}



	public Integer getTopicId() {
		return topicId;
	}

	public void setTopicId(Integer topicId) {
		this.topicId = topicId;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}



	public String getCodeSnippet() {
		return codeSnippet;
	}

	public void setCodeSnippet(String codeSnippet) {
		this.codeSnippet = codeSnippet;
	}

	@Override
	public String toString() {
		return "CodeResourceToAdd [id=" + id + ", name=" + name + ", description=" + description + ", linkTitle="
				+ linkTitle + ", link=" + link + ", topicId=" + topicId + ", categoryId="
				+ categoryId + ", codeSnippet=" + codeSnippet + "]";
	}
	
	

}
