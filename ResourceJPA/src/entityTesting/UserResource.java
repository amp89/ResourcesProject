package entityTesting;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

import entities.User;

public class UserResource {
	EntityManagerFactory emf;
	EntityManager em;
	
	@Before
	public void setUp(){
		emf = Persistence.createEntityManagerFactory("resources");
		em = emf.createEntityManager();
	}
	
	//id
	
	//user fk
	
	//resource fk
	
	//date added
	
	//comments
		
	@After
	public void tearDown(){
		em.close();
		emf.close();
	}

	
	
}
