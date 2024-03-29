package entityTesting;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.User;

public class EntityTest {
	EntityManagerFactory emf;
	EntityManager em;
	
	@Before
	public void setUp(){
		emf = Persistence.createEntityManagerFactory("resources");
		em = emf.createEntityManager();
	}
	
	//id
	@Test
	public void testId() {
		Integer i = 1001;
		assertEquals(em.find(User.class, 1001).getId(),i);
	}
	
	//username
	@Test
	public void testUsername() {
		assertEquals(em.find(User.class, 1001).getUserName(),"amp");
	}
	//firstname
	@Test
	public void testFirstname() {
		assertEquals(em.find(User.class, 1001).getFirstName(),"alex");
	}
	//lastname
	@Test
	public void testLastname() {
		assertEquals(em.find(User.class, 1001).getLastName(),"peterson");
	}
	//email
	@Test
	public void testEmail() {
		assertEquals(em.find(User.class, 1001).getEmail(),"mail@alexmpeterson.com");
	}
	
	//password
	@Test
	public void testPassword(){
		assertEquals(em.find(User.class, 1001).getPassword(), "password");
	}
	
	//user_confirmation_key
	@Test
	public void testCkey() {
		assertEquals(em.find(User.class, 1001).getUserConfirmationKey(),"userconfirmationkey");
	}
	
	//user type fk id
	@Test
	public void testutypeId() {
		assertEquals(em.find(User.class, 1001).getUserType().getId(),4);
	}
	
	//user type type name
	@Test
	public void testutypename() {
		assertEquals(em.find(User.class, 1001).getUserType().getTypeName(),"administrator");
	}
	
	//user type a level
	@Test
	public void testaccesslevel() {
		assertEquals(em.find(User.class, 1001).getUserType().getAccessLevel(),4);
	}
	
	
	//date_joined
	@Test
	public void test() {
		assertEquals(em.find(User.class, 1001).getDateJoined(),1463353351782L);
	}
		
	@After
	public void tearDown(){
		em.close();
		emf.close();
	}

	
	
}
