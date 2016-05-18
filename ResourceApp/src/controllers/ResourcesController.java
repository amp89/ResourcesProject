package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import data.CurrentUser;
import data.ResourcesDAO;
import data.ResultObject;
import entities.User;

@Controller
//@SessionAttributes({ "loggedInUser" })
//maybe i should not use this
public class ResourcesController {

	
	@Autowired
	private ResourcesDAO dao;
	
//	public ModelAndView setSessionCurrentUser(Model model, CurrentUser cu, String viewName){
//		ModelAndView mv = new ModelAndView();
//		model.addAttribute("loggedInUser",cu);
//		mv.setViewName(viewName);
//		mv.addObject("loggedInUser",cu)
//		return mv;
//		
//	}
	
	
//	@RequestMapping("init")
//	public ModelAndView initSession(Model model){
//		ModelAndView mv = new ModelAndView();
//		//initilize user thing
//	
//		model.addAttribute("loggedInUser",new CurrentUser());
//		System.out.println("DONE");
////		mv.setViewName("views/index.html");
//		return mv;
//		
//	}
//	@ModelAttribute("loggedInUser")
//	public CurrentUser setLoggedInUser(Model model){
//		model.addAttribute("loggedInUser",new CurrentUser());
//		return new CurrentUser();
//	}
	//TODO:  javascript document.cookie = object;
		// inspect > resources > cookies >
	
	//TODO just a test method
	@ResponseBody
	@RequestMapping("ping")
	public ModelAndView pingPongTest(){
		ModelAndView mv = new ModelAndView();
		mv.addObject("testMessage","pong");
		mv.setViewName("test");
		return mv;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="signIn", method = RequestMethod.POST)
	public CurrentUser signIn(@RequestBody User user){
		ResultObject loginResult = dao.signInUser(user);
//		ResultObject loginResult = null;
		
		
		System.out.println(loginResult.getCurrentUser());
		//add currentUser to session attribute
		CurrentUser loggedInUser = loginResult.getCurrentUser();
//		model.addAttribute("loggedInUser",loggedInUser);		
//		setSessionCurrentUser(model, loggedInUser, "views/index.html");
		
		System.out.println(loggedInUser);
//		TODO:change to ResultObject return
		System.out.println("NOW RETURN");
		return loggedInUser;
//		return null;
	}
	
	@ResponseBody
	@RequestMapping(value="signUp", method= RequestMethod.POST)
	public CurrentUser signUp(@RequestBody User newUser, @ModelAttribute("loggedInUser") CurrentUser loggedInUser, Model model){
		System.out.println("CONTROLLER: " + newUser);
		//works! session attribute holds loggedInUser
		//TODO just a test:
		System.out.println(model.containsAttribute("loggedInUser"));
		System.out.println("did it save?:" + loggedInUser);
		
		//TODO END TEST
		
		
		//TODO add server & client validation
//		User addedUser = dao.signUpUser(newUser);
		//call dao signup method
		//get key
		//call mail 
		
		
		
		return null;
	}
	
	
	
}
