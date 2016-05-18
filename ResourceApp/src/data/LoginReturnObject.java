package data;

public class LoginReturnObject {

	private CurrentUser currentUser;
	private String message;
	private String errorMessage;
	
	public LoginReturnObject(){}

	public CurrentUser getCurrentUser() {
		return currentUser;
	}

	public void setCurrentUser(CurrentUser currentUser) {
		this.currentUser = currentUser;
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
	
	
	
}
