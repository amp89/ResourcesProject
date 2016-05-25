package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import entities.User;

@Controller
@SessionAttributes({ "currentUser" })
public class ResourceRestController {

	//TODO maybe add alink
//	@RequestMapping("reset/{confkey}")
	//TODO THE PASSWORD LINK IS HERE
	@ResponseBody
	@RequestMapping("reset.do")
	public ModelAndView setUpResetPage(){
		ModelAndView mv = new ModelAndView();
		mv.addObject("user",new User());
		mv.setViewName("newPassword.jsp");
		return mv;
	}
}