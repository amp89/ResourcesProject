package data;

import entities.CodeResource;
import entities.User;

public class ResultObject {

	private String message;
	private String errorMessage;
	
	private CodeResource codeResource;
	
	private CurrentUser currentUser;
	
	private User fullUser;
	
	private String userKey;

	
	
	
	public User getFullUser() {
		return fullUser;
	}

	public void setFullUser(User fullUser) {
		this.fullUser = fullUser;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public CodeResource getCodeResource() {
		return codeResource;
	}

	public void setCodeResource(CodeResource codeResource) {
		this.codeResource = codeResource;
	}

	public CurrentUser getCurrentUser() {
		return currentUser;
	}

	public void setCurrentUser(CurrentUser currentUser) {
		this.currentUser = currentUser;
	}

	public String getUserKey() {
		return userKey;
	}

	public void setUserKey(String userKey) {
		this.userKey = userKey;
	}

	
	
}
