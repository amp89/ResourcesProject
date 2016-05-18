package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import entities.CodeResource;
import entities.User;

@Transactional
public class ResourcesSQLDAO implements ResourcesDAO{

	@PersistenceContext(name="resources")
	private EntityManager em;

	@Override
	public List<User> getAllUsers() {
		List<User> ul = em.createQuery("SELECT u FROM User",User.class).getResultList();
		return ul;
	}

	
	@Override
	public ResultObject signUpUser(User user) {
		System.out.println(user);
		//set user level 1
		//set confirmation key
		//200 char max
		
		//add to database
		//send confirmation email
		
		
		//makes 
		return null;
	}

	@Override
	public ResultObject signInUser(User user){ 
		User u = null;
		ResultObject resultObject = new ResultObject();
		
		try{
			if(user.getEmail().length() > 1){
				//check email and password
				u = em.createQuery("SELECT u FROM User u WHERE u.email = :email AND u.password = :password",User.class).setParameter("email",user.getEmail()).setParameter("password",user.getPassword()).getSingleResult();
				
			}else if(user.getUserName().length() > 1){
				u = em.createQuery("SELECT u FROM User u WHERE u.userName = :un AND u.password = :password",User.class).setParameter("un",user.getUserName()).setParameter("password",user.getPassword()).getSingleResult();
				//check username and password
			}
			
			CurrentUser loggedInUser = new CurrentUser(u.getId(),u.getFirstName(),u.getLastName(),u.getEmail(),u.getUserType(),u.getDateJoined(),u.getUserResources());
			String message = "Loggin successful!";
			resultObject.setCurrentUser(loggedInUser);
			resultObject.setMessage(message);
			
		}catch(NoResultException nre){
			System.out.println("***USERNAME OR PASSWORD NOT FOUND");
			String message = "Loggin failed, user or password is incorrect.";
			resultObject.setErrorMessage(message);
			
		}
		
		return resultObject;

	}//sign in user

	@Override
	public ResultObject sendConfirmation() {
		// TODO Auto-generated method stub
		//this might just stay in the signup method
		return null;
	}

	@Override
	public ResultObject confirmAccount() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> getUsers(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultObject updateUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultObject removeUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultObject submitResource(User user, CodeResource codeResource) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultObject getResources(CodeResource codeResource) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultObject modifyResource(CodeResource codeResource) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultObject removeResource(CodeResource codeResource) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultObject saveResource(User user, CodeResource codeResource) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultObject deleteSavedResource(CodeResource codeResource) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CodeResource> getSavedResources(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultObject addCategories() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultObject removeCategories() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultObject modifyCategories() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultObject addTopics() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultObject removeTopics() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultObject modifyTopics() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultObject modifyPosts() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultObject changeReviewStatus() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultObject deletePost() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultObject lockPost() {
		// TODO Auto-generated method stub
		return null;
	}




}
