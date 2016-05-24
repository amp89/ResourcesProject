package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import data.CurrentUser;
import data.ResourcesDAO;
import data.ResultObject;
import entities.User;

@Controller
@SessionAttributes({ "currentUser" })
// maybe i should not use this
public class ResourcesController {

	@ModelAttribute("currentUser")
	private CurrentUser initLoggedInUser() {
		CurrentUser currentUser = new CurrentUser();
		System.out.println(currentUser);
		return currentUser;
	}

	@Autowired
	private ResourcesDAO dao;

	// index.jsp request
	// @RequestMapping(path="index.do",method=RequestMethod.GET)
	// public ModelAndView loadIndexPageGet(@ModelAttribute("currentUser")
	// CurrentUser currentUser){
	// ModelAndView mv = new ModelAndView();
	// if(currentUser.getUserType() != null &&
	// currentUser.getUserType().getAccessLevel() > 0){
	// mv.addObject("currentUser",currentUser);
	// mv.setViewName("userMenu.do");
	// }else{
	// mv.addObject("user",new User());
	// mv.setViewName("index.jsp");
	// }
	//
	// return mv;
	//
	// }
	// TODO wtf is this for
	@RequestMapping("index.do")
	// @RequestMapping(path="index.do", method=RequestMethod.POST)
	public ModelAndView loadIndexPagePost(@ModelAttribute("currentUser") CurrentUser currentUser) {
		ModelAndView mv = new ModelAndView();
		if (currentUser.getUserType() != null && currentUser.getUserType().getAccessLevel() > 0) {
			mv.addObject("currentUser", currentUser);
			mv.setViewName("userMenu.jsp");
		} else {
			mv.addObject("user", new User());
			mv.setViewName("index.jsp");
		}

		return mv;

	}

	// sign in request
	// @RequestMapping(path="signIn.do", method=RequestMethod.POST)
	@RequestMapping("signIn.do")
	public ModelAndView signIn(User user, @ModelAttribute("currentUser") CurrentUser currentUser) {
		System.out.println("singing in....");
		ModelAndView mv = new ModelAndView();
		ResultObject result = dao.signInUser(user);
		if (result.getErrorMessage() == null) {
			currentUser = result.getCurrentUser();
			mv.addObject("currentUser", currentUser);
			mv.setViewName("userMenu.jsp");
		} else {
			String errorMessage = result.getErrorMessage();
			mv.addObject("errorMessage", errorMessage);
			mv.addObject("user", new User());
			mv.setViewName("index.jsp");
		}
		return mv;
	}

	//goes to forget password page
	@RequestMapping("setUpRetrieveForgottenLogin.do")
	public ModelAndView setupForgottenLoginPage(){
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("resetPassword.jsp");
		mv.addObject("user",new User());
		return mv;
	}
	//sends email
	@RequestMapping("retrieveForgottonLogin.do")
	public ModelAndView retrieveForgottonLogin(User user){
		ModelAndView mv = new ModelAndView();
		ResultObject result = dao.retrieveLogin(user);
		if(result.getErrorMessage() == null){
			mv.setViewName("index.jsp");
			mv.addObject("message","check your email for your password reset informatoin");
			mv.addObject("user",new User());
			
		}else{
			mv.setViewName("resetPassword.jsp");
			mv.addObject("message",result.getErrorMessage());
			mv.addObject("user",user);
	
			
		}
		return mv;
	
	}
	//resets password
	@RequestMapping("resetLogin.do")
	public ModelAndView resetLostLogin(User user, @ModelAttribute("currentUser") CurrentUser currentUser) {
		ModelAndView mv = new ModelAndView();
		ResultObject result = dao.resetLogin(user);
		mv.setViewName("userMenu.jsp");
		mv.addObject("currentUser",result.getCurrentUser());
		return mv;
	}

	@RequestMapping("setUpSignUp.do")
	public ModelAndView setUpSignUp() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", new User());
		mv.setViewName("signUp.jsp");
		return mv;
	}

	@RequestMapping("signUp.do")
	public ModelAndView signUp(User user) {
		ModelAndView mv = new ModelAndView();
		System.out.println("signing up...");
		ResultObject result = dao.signUpUser(user);
		// null pointer at 97 b/c signUpUser returns nothing
		if (result.getErrorMessage() == null) {

			mv.addObject("currentUser", result.getCurrentUser());
			mv.setViewName("signUpConf.jsp");

		} else {
			mv.addObject("user", result.getFullUser());
			mv.addObject("errorMessage", result.getErrorMessage());
			mv.setViewName("signUp.jsp");
		}
		return mv;
	}

	@RequestMapping(path = "confirm.do", method = RequestMethod.POST)
	public ModelAndView confirmAccount(@RequestParam("password") String password,
			@RequestParam("confirmationKey") String confirmationKey, @RequestParam("userName") String userName) {
		ModelAndView mv = new ModelAndView();
		System.out.println("in confrim.do request mapping");
		User toConfirm = new User();
		toConfirm.setPassword(password);
		toConfirm.setUserConfirmationKey(confirmationKey);
		toConfirm.setUserName(userName);
		ResultObject result = new ResultObject();
		result = dao.confirmAccount(toConfirm);
		// if failed...e tc
		if (result.getErrorMessage() == null) {
			mv.addObject("message", "Thanks for confirming your account!");
			mv.setViewName("thankYou.jsp");

		} else {
			mv.addObject("errorMessage", result.getErrorMessage());
			mv.setViewName("thankYou.jsp");

		}
		return mv;
	}

	@RequestMapping("selfManage.do")
	public ModelAndView selfManage(@ModelAttribute("currentUser") CurrentUser currentUser) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("currentUser", currentUser);
		mv.setViewName("selfManage.jsp");
		return mv;

	}

	@RequestMapping("logout.do")
	public ModelAndView logout(@ModelAttribute("currentUser") CurrentUser currentUser) {
		System.out.println("DEBUG: TIME TO LOGGOUTTTTT");
		ModelAndView mv = new ModelAndView();

		System.out.println("Print current user " + currentUser);

		currentUser = null;
		System.out.println("Print current user " + currentUser);

		currentUser = new CurrentUser();

		System.out.println("Print current user " + currentUser);
		mv.addObject("user", new User());
		mv.addObject("currentUser", currentUser);
		mv.setViewName("index.jsp");
		return mv;
	}

	@RequestMapping("manageMyAccount.do")
	public ModelAndView manageMyAccount(@ModelAttribute("currentUser") CurrentUser currentUser) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("currentUser", currentUser);
		mv.setViewName("userMenu.jsp");

		return mv;
	}

	@RequestMapping("setUpChangePassword.do")
	public ModelAndView setUpChnagePassword() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("changePassword.jsp");
		return mv;

	}

	@RequestMapping("changePassword.do")
	public ModelAndView changePassword(@RequestParam("oldPassword") String oldPassword,
			@RequestParam("newPassword") String newPassword, @ModelAttribute("currentUser") CurrentUser currentUser) {
		ModelAndView mv = new ModelAndView();
		System.out.println("old pwd: " + oldPassword);
		System.out.println("new pwd: " + newPassword);
		System.out.println("changing");
		ResultObject result = dao.updatePassword(newPassword, oldPassword, currentUser);
		if (result.getErrorMessage() == null) {
			mv.addObject("errorMessage", result.getErrorMessage());
		}
		// TODO update current user session attribute? probaly not actually,
		// doesn't carry password
		mv.setViewName("selfManage.jsp");
		mv.addObject("currentUser", currentUser);
		return mv;

	}

	@RequestMapping("setUpChangeEmail.do")
	public ModelAndView setUpChangeEmail() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("changeEmail.jsp");
		return mv;

	}

	@RequestMapping("changeEmail.do")
	public ModelAndView changeEmail(@RequestParam("password") String password,
			@RequestParam("newEmail") String newEmail, @ModelAttribute("currentUser") CurrentUser currentUser) {
		ModelAndView mv = new ModelAndView();
		User newParams = new User();
		newParams.setPassword(password);
		newParams.setEmail(newEmail);
		ResultObject result = dao.updateEmail(currentUser, newParams);
		if (result.getErrorMessage() == null) {
			mv.addObject("message", result.getMessage());
			mv.setViewName("selfManage.jsp");
		} else {
			mv.addObject("errorMessage", result.getErrorMessage());
			mv.setViewName("changeEmail.jsp");

		}

		return mv;
	}

	@RequestMapping("setUpDeleteAccount.do")
	public ModelAndView setUpDeleteAccount(@ModelAttribute("currentUser") CurrentUser currentUser) {
		ModelAndView mv = new ModelAndView();

		mv.addObject("currentUser", currentUser);
		mv.setViewName("deleteAccount.jsp");

		return mv;
	}
	
	
	/*
	 * SEARCH METHODS
	 */
	
//	@RequestMapping("searchMethods")

	// @RequestMapping("deleteAccount.do"){
	// //TODO unfinished method
	// dao.removeUser(user);
	// mv.setViewName
	// }
	//

}

// public ModelAndView setSessionCurrentUser(Model model, CurrentUser cu, String
// viewName){
// ModelAndView mv = new ModelAndView();
// model.addAttribute("loggedInUser",cu);
// mv.setViewName(viewName);
// mv.addObject("loggedInUser",cu)
// return mv;
//
// }

// @RequestMapping("init")
// public ModelAndView initSession(Model model){
// ModelAndView mv = new ModelAndView();
// //initilize user thing
//
// model.addAttribute("loggedInUser",new CurrentUser());
// System.out.println("DONE");
//// mv.setViewName("views/index.html");
// return mv;
//
// }
// @ModelAttribute("loggedInUser")
// public CurrentUser setLoggedInUser(Model model){
// model.addAttribute("loggedInUser",new CurrentUser());
// return new CurrentUser();
// }
// TODO: javascript document.cookie = object;
// inspect > resources > cookies >

// TODO just a test method
// @ResponseBody
// @RequestMapping("ping")
// public ModelAndView pingPongTest(){
// ModelAndView mv = new ModelAndView();
// mv.addObject("testMessage","pong");
// mv.setViewName("test");
// return mv;
// }
//

//
// @ResponseBody
// @RequestMapping(value="signIn", method = RequestMethod.POST)
// public CurrentUser signIn(@RequestBody User user){
// ResultObject loginResult = dao.signInUser(user);
//// ResultObject loginResult = null;
//
//
// System.out.println(loginResult.getCurrentUser());
// //add currentUser to session attribute
// CurrentUser loggedInUser = loginResult.getCurrentUser();
//// model.addAttribute("loggedInUser",loggedInUser);
//// setSessionCurrentUser(model, loggedInUser, "views/index.html");
//
// System.out.println(loggedInUser);
//// TODO:change to ResultObject return
// System.out.println("NOW RETURN");
// return loggedInUser;
//// return null;
// }

// @ResponseBody
// @RequestMapping(value="signUp", method= RequestMethod.POST)
// public CurrentUser signUp(@RequestBody User newUser,
// @ModelAttribute("loggedInUser") CurrentUser loggedInUser, Model model){
// System.out.println("CONTROLLER: " + newUser);
// //works! session attribute holds loggedInUser
// //TODO just a test:
// System.out.println(model.containsAttribute("loggedInUser"));
// System.out.println("did it save?:" + loggedInUser);
//
// //TODO END TEST
//
//
// //TODO add server & client validation
//// User addedUser = dao.signUpUser(newUser);
// //call dao signup method
// //get key
// //call mail
//
//
//
// return null;
// }
