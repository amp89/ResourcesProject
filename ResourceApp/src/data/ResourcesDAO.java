package data;

import java.util.List;

import entities.Category;
import entities.CodeResource;
import entities.Topic;
import entities.User;

public interface ResourcesDAO {

	//TODO: test method
	
	
	
	public ResultObject signUpUser(User user);
	//Add user / sign up
		//set account to type 1
		//send confirmation email

	
	public ResultObject signInUser(User user);
	//email or password
		//if account type is > 1 (contributor or higher), force confirmation before allowing
		//a sign in
	
	public ResultObject sendConfirmation();
	
	public ResultObject confirmAccount(User user);
	//confirm account
		//check key to generated key
		//populate sign up (?)
	
	public ResultObject retrieveLogin(User user);
	public ResultObject resetLogin(User user);
	
	public List<User> getAllUsers();
	//Get users
		//all
		//by user parameters
	public List<User> getUsers(User user);

	//user self stuff
	public ResultObject updateUser(User user);
		//statements to change shit
		//if change email
			//most of this stuff could probably just call the sign up methods
				//change generated key
				//confirm account
	//delete own account
	public ResultObject updatePassword(String newPassword, String oldPassword, CurrentUser currentUser);
		
	public ResultObject updateEmail(CurrentUser CurrentUser, User newParams);
	
	public ResultObject removeUser(User user);
	//cascade
	
	
	
	//submit resource
	public ResultObject submitResource(CurrentUser CurrentUser, CodeResourceToAdd codeResourceToAdd);
	
	public CodeResource getResource(CodeResource codeResource);
	
	public List<CodeResource> getResources(SearchParam searchParam);
	//get resources
		
		//TODO: resuse this logic for user to search own saved stuff
		//TODO: build a dynamic search
		//by search terms
		//by topic
		//by category
		//review y/n
	
	public ResultObject modifyResource(CodeResource codeResource);
	
	public ResultObject removeResource(CodeResource codeResource);
	
	public ResultObject saveResource(CurrentUser currentUser, CodeResource codeResource, String comments);
	//save resources
		
		//get parameters
		//persist new save
	
	public ResultObject deleteSavedResource(CodeResource codeResource);
	//delete saved resources
		//search then remove from list
	
	//view saved resources
	public List<CodeResource> getSavedResources(SearchParam searchParam);
		//could populate dropdowns with specific stuff
		//like get resources page, except with own shit
	
	
	//dev
	//call this explicity, or call when a new category is added
	public ResultObject addCategories(Category c);
		//dev and up
		//add categories (shouldn't be able to select and add)
		//at topics ""
	public ResultObject removeCategories(Category c);
		//admin only
	public ResultObject modifyCategories(Category c);
	//admin only
	public ResultObject addTopics(Topic t);
		//dev and up, shouldn't select and add
	public ResultObject removeTopics(Topic t);
		//admin only
	public ResultObject modifyTopics(Topic t);
	//admin only
	
	public ResultObject modifyPosts();
		//posts
			//modify OWN posts
			//ADMIN: modify all posts
			//TODO this should be a button on the normal search
	public ResultObject changeReviewStatus();
			//ADMIN: change review status
	public ResultObject deletePost();
			//ADMIN: delete
	public ResultObject lockPost();
			//now lsdjfdlsa;f can't modify their own posts
			//ADMIN: lock post //TODO TODO TODO TODO TODO TODO  add locked/finalized/something status to database

	public List<Category> getCategoryList();
	
	public List<Topic> getTopicList();

	
}
