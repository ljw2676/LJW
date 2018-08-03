package yogi.members;


import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MembersController {
	
	@Resource(name="membersService")
	private MembersService membersService;
	
	@RequestMapping(value= {"/", "/first"})
	 public String first(){
    	return "firstPage";
	}
	/*
	@RequestMapping(value= "/members/createForm")
	 public String createForm(){
		return "createForm";
	}*/
	
	@RequestMapping(value="/members/createForm", method=RequestMethod.GET)
	public String createForm(Model model) {	
		return "createForm";
	}
	

	@RequestMapping(value="/members/createForm", method=RequestMethod.POST)
	public String join(@ModelAttribute("member") MembersModel member) throws Exception{
			System.out.println("컨트롤러 : " + member.getM_name());
			membersService.insertMember(member);//일반 회원가입	
		return "redirect:/first";
	}
	
//	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
//	public String loginForm(HttpServletRequest request, Model model) throws IOException{
//		
//		CookieBox CookieBox = new CookieBox(request);
//		
//		String ID = CookieBox.getValue("ID");
//		String PASSWORD = CookieBox.getValue("PW");
//		
//		model.addAttribute("cookieID", ID);
//		model.addAttribute("cookiePW", PASSWORD);
//		
//		return "loginForm";
//	}
//	
	
	
}
