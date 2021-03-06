package entityTesting;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.CodeResource;

public class ResourceTest {
	EntityManagerFactory emf;
	EntityManager em;
	
	@Before
	public void setUp(){
		emf = Persistence.createEntityManagerFactory("resources");
		em = emf.createEntityManager();
	}
	
	//id
	@Test
	public void idtest(){
		assertEquals(em.find(CodeResource.class,2).getId(),2);
		
	}
	//name
	@Test
	public void name(){
		assertEquals(em.find(CodeResource.class,2).getName(),"junitName");
		
	}
	
	//description
	@Test
	public void description(){
		assertEquals(em.find(CodeResource.class,2).getDescription(),"DESCRIPTION \"test\"");
		
	}
	
	//link_title
	@Test
	public void linkTitle(){
		assertEquals(em.find(CodeResource.class,2).getLinkTitle(),"junitLinkTitle");
		
	}
	
	//link
	@Test
	public void unitLink(){
		assertEquals(em.find(CodeResource.class,2).getLink(),"junitLink");
		
	}
	
	
	//add date
	@Test
	public void addDate(){
		assertEquals(em.find(CodeResource.class,2).getDateAdded(),1463353351782L);
		
	}
	
	//status fk
	@Test
	public void statusid(){
		assertEquals(em.find(CodeResource.class,2).getStatus().getId(),1);
	}
	@Test
	public void statusName(){
		assertEquals(em.find(CodeResource.class,2).getStatus().getName(),"in review");
		}
	
	//topic fk
	@Test
	public void topicId(){
		assertEquals(em.find(CodeResource.class,2).getTopic().getId(),1);
	}
	@Test
	public void topicName(){
		assertEquals(em.find(CodeResource.class,2).getTopic().getName(),"Java");
	}

	//category fk
	@Test
	public void categoryId(){

		assertEquals(em.find(CodeResource.class,2).getCategory().getId(),1);
	
	}
	@Test
	public void categoryName(){
		assertEquals(em.find(CodeResource.class,2).getCategory().getName(),"Code Example");
		
	}
	
	//code snippet
	@Test
	public void codeSnippet(){
		assertEquals(em.find(CodeResource.class,2).getCodeSnippet(),"HELLO I'M SOME CODE");
		
	}
		
	@After
	public void tearDown(){
		em.close();
		emf.close();
	}

	
	
}
