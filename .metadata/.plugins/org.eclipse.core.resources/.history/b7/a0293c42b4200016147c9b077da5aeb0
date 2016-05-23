package data;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import entities.CodeResource;
import entities.User;
import entities.UserType;

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
		ResultObject result = new ResultObject();
		boolean emailInUse = true;
		boolean userNameInUse = false;
		StringBuilder errorMessage = new StringBuilder();
		UserType userTypeOne = em.find(UserType.class,1); 
		user.setUserType(userTypeOne);
		//set confirmation key
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz`~!@#$%^&*()-_=+|}{[]1234567890";
		//TODO:  conf key.  if exists, then what?
		StringBuilder confKey = new StringBuilder();
		System.out.println(characters.length());
		
		try{
		User emailCheck = em.createQuery("SELECT u FROM User u WHERE email = :email",User.class).setParameter("email", user.getEmail()).getSingleResult();
		}catch(NoResultException nre){
			emailInUse = false;
		}
		try{
			User userNameCheck = em.createQuery("SELECT u FROM User u WHERE userName = :username",User.class).setParameter("username", user.getUserName()).getSingleResult();
			
		}catch(NoResultException nre){
			userNameInUse = false;
		}
		
		if(emailInUse){
			errorMessage.append("That email is already in use.  ");
		}
		if(userNameInUse){
			errorMessage.append("That username is already in use.  ");
		}
		
		if(!emailInUse && !userNameInUse){
		
		for(int i = 0; i < 180; i++){
			
				int randomCharKey = (int)(Math.random()*characters.length());
				confKey.append(characters.charAt(randomCharKey));
			}
			System.out.println(confKey.toString());
			user.setUserConfirmationKey(confKey.toString());
					//200 char max
			//add to database
			Date d = new Date();
			user.setDateJoined(d.getTime());
			//send confirmation email
			sendEmail(user);
			
			System.out.println(user);
			//makes 
			em.persist(user);
			
			
			
			CurrentUser currentUser = new CurrentUser(user.getId(),user.getUserName(),user.getFirstName(),user.getLastName(),user.getEmail(),user.getUserType(),user.getDateJoined(),user.getUserResources());
			result.setCurrentUser(currentUser);
			result.setErrorMessage(null);
			
		}else{
			result.setFullUser(user);
			result.setErrorMessage(errorMessage.toString());
		}
		
		return result;
	}

	private void sendEmail(User user){
		EMail email = new EMail();
		email.setSubject("Confirmation for resources app!");
		email.setTextMessage("Go to conf page and enter: " + user.getUserConfirmationKey() + " to sign up.  Thanks!");
		email.setToEmailAddress(user.getEmail());
		boolean success = email.sendEMail();
		//TODO what if email fails?
		
	}
	
	@Override
	public ResultObject signInUser(User user){ 
		User u = null;
		ResultObject resultObject = new ResultObject();
		
		try{
			if(user.getEmail() != null && user.getEmail().length() > 1){
				//check email and password
				u = em.createQuery("SELECT u FROM User u WHERE u.email = :email AND u.password = :password",User.class).setParameter("email",user.getEmail()).setParameter("password",user.getPassword()).getSingleResult();
				
			}else if(user.getUserName().length() > 1){
				u = em.createQuery("SELECT u FROM User u WHERE u.userName = :un AND u.password = :password",User.class).setParameter("un",user.getUserName()).setParameter("password",user.getPassword()).getSingleResult();
				//check username and password
			}
			
			CurrentUser loggedInUser = new CurrentUser(u.getId(),u.getUserName(), u.getFirstName(),u.getLastName(),u.getEmail(),u.getUserType(),u.getDateJoined(),u.getUserResources());
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
	public ResultObject confirmAccount(User user) {
		boolean success = false;
		ResultObject result = new ResultObject();
		User confirmUser = em.createQuery("SELECT u FROM User u WHERE userName = :userName",User.class).setParameter("userName",user.getUserName()).getSingleResult();		
		if((confirmUser.getPassword().equals(user.getPassword())) && (confirmUser.getUserConfirmationKey().equals(user.getUserConfirmationKey())) ){
			success = true;
			result.setErrorMessage(null);
		}else{
			result.setErrorMessage("Account NOT confirmed");
			
		}
		System.out.println("setting confirmUser to type 2");
		confirmUser.setUserType(em.find(UserType.class,2));
		return result;
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

	public ResultObject updatePassword(String newPassword, String oldPassword, CurrentUser currentUser){
		User user = em.find(User.class,currentUser.getId());		
		ResultObject result = new ResultObject();
		if(user.getPassword().equals(oldPassword)){
			user.setPassword(newPassword);
			//send password changed email
			System.out.println("password changed");
			result.setErrorMessage(null);
		}else{
			result.setErrorMessage("Password change failed");
			System.out.println("password change failed :(");
			
		}
		
		return result;
	}


}
