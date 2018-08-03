package yogi.members;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MembersController {
	@RequestMapping(value= {"/", "/first"})
	 public String first(){
    	return "firstPage";
	}
	@RequestMapping(value= "/members/createForm")
	 public String createForm(){
		return "createForm";
	}
}
