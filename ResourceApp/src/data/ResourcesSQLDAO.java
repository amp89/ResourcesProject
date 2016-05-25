package data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import entities.Category;
import entities.CodeResource;
import entities.Status;
import entities.Topic;
import entities.User;
import entities.UserType;

@Transactional
public class ResourcesSQLDAO implements ResourcesDAO {

	@PersistenceContext(name = "resources")
	private EntityManager em;

	@Override
	public List<User> getAllUsers() {
		List<User> ul = em.createQuery("SELECT u FROM User", User.class).getResultList();
		return ul;
	}

	// TODO make this a class
	private String createConfKey() {
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz`~!@#$%^&*()-_=+|}{[]1234567890";
		// TODO: conf key. if exists, then what?
		StringBuilder confKey = new StringBuilder();
		System.out.println(characters.length());
		for (int i = 0; i < 180; i++) {

			int randomCharKey = (int) (Math.random() * characters.length());
			confKey.append(characters.charAt(randomCharKey));
		}
		System.out.println(confKey.toString());
		return (confKey.toString());
	}

	@Override
	public ResultObject signUpUser(User user) {
		System.out.println(user);
		ResultObject result = new ResultObject();
		boolean emailInUse = true;
		boolean userNameInUse = false;
		StringBuilder errorMessage = new StringBuilder();
		UserType userTypeOne = em.find(UserType.class, 1);
		user.setUserType(userTypeOne);
		// set confirmation key
		// TODO change conf key to method call
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz`~!@#$%^&*()-_=+|}{[]1234567890";
		// TODO: conf key. if exists, then what?
		StringBuilder confKey = new StringBuilder();
		System.out.println(characters.length());

		try {
			User emailCheck = em.createQuery("SELECT u FROM User u WHERE email = :email", User.class)
					.setParameter("email", user.getEmail()).getSingleResult();
		} catch (NoResultException nre) {
			emailInUse = false;
		}
		try {
			User userNameCheck = em.createQuery("SELECT u FROM User u WHERE userName = :username", User.class)
					.setParameter("username", user.getUserName()).getSingleResult();

		} catch (NoResultException nre) {
			userNameInUse = false;
		}

		if (emailInUse) {
			errorMessage.append("That email is already in use.  ");
		}
		if (userNameInUse) {
			errorMessage.append("That username is already in use.  ");
		}

		if (!emailInUse && !userNameInUse) {

			for (int i = 0; i < 180; i++) {

				int randomCharKey = (int) (Math.random() * characters.length());
				confKey.append(characters.charAt(randomCharKey));
			}
			System.out.println(confKey.toString());
			user.setUserConfirmationKey(confKey.toString());
			// 200 char max
			// add to database
			Date d = new Date();
			user.setDateJoined(d.getTime());
			// send confirmation email
			sendConfirmationEmail(user);

			System.out.println(user);
			// makes
			em.persist(user);

			CurrentUser currentUser = new CurrentUser(user.getId(), user.getUserName(), user.getFirstName(),
					user.getLastName(), user.getEmail(), user.getUserType(), user.getDateJoined(),
					user.getUserResources());
			result.setCurrentUser(currentUser);
			result.setErrorMessage(null);

		} else {
			result.setFullUser(user);
			result.setErrorMessage(errorMessage.toString());
		}

		return result;
	}

	private void sendConfirmationEmail(User user) {
		EMail email = new EMail();
		email.setSubject("Confirmation for resources app!");
		email.setTextMessage("Go to conf page and enter: " + user.getUserConfirmationKey() + " to sign up.  Thanks!");
		email.setToEmailAddress(user.getEmail());
		boolean success = email.sendEMail();
		// TODO what if email fails?

	}

	// TODO
	@Override
	public ResultObject retrieveLogin(User user) {
		ResultObject result = new ResultObject();
		User userToReset = new User();
		try {
			userToReset = em
					.createQuery("SELECT u FROM User u WHERE LOWER(userName) = :userName AND LOWER(email) = :email",
							User.class)
					.setParameter("userName", user.getUserName().toLowerCase())
					.setParameter("email", user.getEmail().toLowerCase()).getSingleResult();
			result.setErrorMessage(null);
			// reset confirmation code
			// new conf code
			String newConfirmationKey = createConfKey();
			System.out.println(newConfirmationKey);
			userToReset.setUserConfirmationKey(newConfirmationKey);

			// send reset email
			EMail resetEmail = new EMail();
			resetEmail.setSubject("Reset your password");
			resetEmail.setTextMessage("Go to the confirmation page.\nEnter " + userToReset.getUserConfirmationKey()
					+ " to reset your password");
			resetEmail.setToEmailAddress(userToReset.getEmail());
			boolean success = resetEmail.sendEMail();
		} catch (NoResultException nre) {
			System.out.println(nre);
			result.setErrorMessage("The username or email address does not match any records");
		}

		// TODO what if email fails?
		return result;
	}

	@Override
	public ResultObject resetLogin(User user) {
		ResultObject result = new ResultObject();
		User userToReset = new User();
		try {
			userToReset = em
					.createQuery(
							"SELECT u FROM User u WHERE LOWER(userName) = :userName AND LOWER(email) = :email AND userConfirmationKey = :userConfirmationKey",
							User.class)
					.setParameter("userName", user.getUserName().toLowerCase())
					.setParameter("email", user.getEmail().toLowerCase())
					.setParameter("userConfirmationKey", user.getUserConfirmationKey()).getSingleResult();
			result.setErrorMessage(null);
		} catch (NoResultException nre) {
			System.out.println(nre);
			result.setErrorMessage("The username or email address does not match any records");
		}

		userToReset.setPassword(user.getPassword());
		System.out.println("New password:" + userToReset);
		CurrentUser currentUser = new CurrentUser(userToReset.getId(), userToReset.getUserName(),
				userToReset.getFirstName(), userToReset.getLastName(), userToReset.getEmail(),
				userToReset.getUserType(), userToReset.getDateJoined(), userToReset.getUserResources());
		result.setCurrentUser(currentUser);
		return result;
	}

	@Override
	public ResultObject signInUser(User user) {
		User u = null;
		ResultObject resultObject = new ResultObject();

		try {
			if (user.getEmail() != null && user.getEmail().length() > 1) {
				// check email and password
				u = em.createQuery("SELECT u FROM User u WHERE u.email = :email AND u.password = :password", User.class)
						.setParameter("email", user.getEmail()).setParameter("password", user.getPassword())
						.getSingleResult();

			} else if (user.getUserName().length() > 1) {
				u = em.createQuery("SELECT u FROM User u WHERE u.userName = :un AND u.password = :password", User.class)
						.setParameter("un", user.getUserName()).setParameter("password", user.getPassword())
						.getSingleResult();
				// check username and password
			}

			CurrentUser loggedInUser = new CurrentUser(u.getId(), u.getUserName(), u.getFirstName(), u.getLastName(),
					u.getEmail(), u.getUserType(), u.getDateJoined(), u.getUserResources());
			String message = "Loggin successful!";
			resultObject.setCurrentUser(loggedInUser);
			resultObject.setMessage(message);

		} catch (NoResultException nre) {
			System.out.println("***USERNAME OR PASSWORD NOT FOUND");
			String message = "Loggin failed, user or password is incorrect.";
			resultObject.setErrorMessage(message);

		}

		return resultObject;

	}// sign in user

	@Override
	public ResultObject sendConfirmation() {
		// TODO Auto-generated method stub
		// this might just stay in the signup method
		return null;
	}

	@Override
	public ResultObject confirmAccount(User user) {
		boolean success = false;
		ResultObject result = new ResultObject();
		User confirmUser = em.createQuery("SELECT u FROM User u WHERE userName = :userName", User.class)
				.setParameter("userName", user.getUserName()).getSingleResult();
		if ((confirmUser.getPassword().equals(user.getPassword()))
				&& (confirmUser.getUserConfirmationKey().equals(user.getUserConfirmationKey()))) {
			success = true;
			result.setErrorMessage(null);
		} else {
			result.setErrorMessage("Account NOT confirmed");

		}
		System.out.println("setting confirmUser to type 2");
		confirmUser.setUserType(em.find(UserType.class, 2));
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
	public ResultObject submitResource(CurrentUser currentUser, CodeResourceToAdd codeResourceToAdd) {
		CodeResource codeResource = new CodeResource();
		codeResource.setName(codeResourceToAdd.getName());
		codeResource.setDescription(codeResourceToAdd.getDescription());
		codeResource.setLinkTitle(codeResourceToAdd.getLinkTitle());
		codeResource.setLink(codeResourceToAdd.getLink());
		Date d = new Date();
		codeResource.setDateAdded(d.getTime());
		int statusId = 0;
		if (currentUser.getUserType().getAccessLevel() == 2) {
			statusId = 1;
		} else if (currentUser.getUserType().getAccessLevel() >= 3) {
			statusId = 2;
		}
		codeResource.setStatus(em.find(Status.class, statusId));
		codeResource.setTopic(em.find(Topic.class, codeResourceToAdd.getTopicId()));
		codeResource.setCategory(em.find(Category.class, codeResourceToAdd.getCategoryId()));
		codeResource.setCodeSnippet(codeResourceToAdd.getCodeSnippet());

		em.persist(codeResource);
		ResultObject result = new ResultObject();
		result.setMessage("Thank you for contributing!");
		// TODO map to adding user by userresources
		return result;
	}

	@Override
	public List<CodeResource> getResources(SearchParam searchParam) {
		// List<CodeResource> resourceList = em.createQuery(arg0)
		String[] queryWords = searchParam.getQueryString().split(" ");
		List<String> nameParamsLowerCase = new ArrayList<>();

		for (String string : queryWords) {
			nameParamsLowerCase.add("%" + string.trim().toLowerCase() + "%");
			System.out.println(string);
		}

		// TODO logic for these

		int statusIdParam = searchParam.getMinimumStatus();
		// TODO FOREACH KEYWORD ARRAY
		System.out.println(searchParam);
		List<CodeResource> resourceList = em
				.createQuery(
						"SELECT cr FROM CodeResource cr WHERE"
								+ " (LOWER(name) LIKE :name OR LOWER(description) LIKE :description) AND status.id >= :statusId",
						CodeResource.class)
				.setParameter("name", nameParamsLowerCase).setParameter("description", nameParamsLowerCase)
				.setParameter("statusId", statusIdParam).getResultList();

		return resourceList;
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
	public ResultObject addCategories(Category c) {
		// TODO ro needed?
		ResultObject result = new ResultObject();

		em.persist(c);

		return result;
	}

	@Override
	public ResultObject removeCategories(Category c) {
		Category categoryToRemove = em.find(Category.class,c.getId());
		System.out.println("DAO. Cat to remove: " + categoryToRemove);
		List<CodeResource> resourcesWithCategory;
		try {
			resourcesWithCategory = em
					.createQuery("SELECT cr FROM CodeResource cr WHERE category = :category",
							CodeResource.class)
					.setParameter("category", categoryToRemove).getResultList();
			
			for(int i = 0; i < resourcesWithCategory.size(); i++){
				System.out.println(resourcesWithCategory.get(i));
			}
			for(int i = 0; i < resourcesWithCategory.size(); i++){
				resourcesWithCategory.get(i).setCategory(em.find(Category.class,1));
			}
			
		} catch (NoResultException nre) {
			System.out.println("NO RESULT:" + nre);
		}
		
		em.remove(categoryToRemove);
		
		// select all resource with this cateogry
		// change them to id one, which should be a default value
		// remove category
		return new ResultObject();
	}

	@Override
	public ResultObject modifyCategories(Category c) {
		Category categoryToModify = em.find(Category.class, c.getId());
		categoryToModify.setName(c.getName());
		//TODO needed?
		return new ResultObject();
	}

	@Override
	public ResultObject addTopics(Topic t) {
		// TODO ro needed?
		ResultObject result = new ResultObject();
		em.persist(t);

		return result;
	}

	@Override
	public ResultObject removeTopics(Topic t) {
		Topic topicToRemove = em.find(Topic.class, t.getId());
		System.out.println("DAO. top to remove: " + topicToRemove);
		List<CodeResource> resourcesWithTopic;
		try {
			resourcesWithTopic = em
					.createQuery("SELECT cr FROM CodeResource cr WHERE topic = :topic",
							CodeResource.class)
					.setParameter("topic", topicToRemove).getResultList();
			
			for(int i = 0; i < resourcesWithTopic.size(); i++){
				System.out.println(resourcesWithTopic.get(i));
			}
			for(int i = 0; i < resourcesWithTopic.size(); i++){
				resourcesWithTopic.get(i).setTopic(em.find(Topic.class,1));
			}
			
		} catch (NoResultException nre) {
			System.out.println("NO RESULT:" + nre);
		}
		
		em.remove(topicToRemove);
		
		// select all resource with this cateogry
		// change them to id one, which should be a default value
		// remove category
		
		
		return new ResultObject();
	}

	@Override
	public ResultObject modifyTopics(Topic t) {
		Topic topicToModify = em.find(Topic.class, t.getId());
		topicToModify.setName(t.getName());
		//TODO needed?
		return new ResultObject();
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

	@Override
	public ResultObject updatePassword(String newPassword, String oldPassword, CurrentUser currentUser) {
		User user = em.find(User.class, currentUser.getId());
		ResultObject result = new ResultObject();
		if (user.getPassword().equals(oldPassword)) {
			user.setPassword(newPassword);
			// send password changed email
			System.out.println("password changed");
			result.setErrorMessage(null);
		} else {
			result.setErrorMessage("Password change failed");
			System.out.println("password change failed :(");

		}

		return result;
	}

	@Override
	public ResultObject updateEmail(CurrentUser currentUser, User newParams) {
		ResultObject result = new ResultObject();
		boolean emailInUse = true;
		try {
			em.createQuery("SELECT u FROM User u WHERE email = :email", User.class)
					.setParameter("email", newParams.getEmail()).getSingleResult();
			result.setErrorMessage("That email is already in use.");
		} catch (NoResultException nre) {
			emailInUse = false;
		}
		if (!emailInUse) {
			User userToChange = em.find(User.class, currentUser.getId());
			if (userToChange.getPassword().equals(newParams.getPassword())) {
				userToChange.setEmail(newParams.getEmail());
				result.setErrorMessage(null);
				result.setMessage("Email Updated");
			} else {
				result.setErrorMessage("Incorrect Password");
			}
		}

		return result;
	}

	@Override
	public List<Category> getCategoryList() {
		List<Category> categoryList = em.createQuery("SELECT c FROM Category c", Category.class).getResultList();
		return categoryList;
	}

	@Override
	public List<Topic> getTopicList() {
		List<Topic> topicList = em.createQuery("SELECT t FROM Topic t", Topic.class).getResultList();
		return topicList;
	}

}
