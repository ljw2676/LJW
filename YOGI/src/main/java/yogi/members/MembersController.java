package yogi.members;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import yogi.members.CookieBox;

@Controller
public class MembersController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="membersService")
	private MembersService membersService;
	
	@RequestMapping(value= {"/", "/first"}, method=RequestMethod.GET)
	 public String first(HttpServletRequest request, Model model) throws IOException{
		
		CookieBox CookieBox = new CookieBox(request);
		
		String ID = CookieBox.getValue("m_id");
		String PASSWORD = CookieBox.getValue("m_password");
		
		model.addAttribute("cookieID", ID);
		model.addAttribute("cookiePW", PASSWORD);
    	return "firstPage";
	}
	
	@RequestMapping(value= {"/", "/first"}, method=RequestMethod.POST)
	 public String login(@ModelAttribute("member") MembersModel member, HttpServletRequest request, HttpServletResponse response) throws IOException{
		MembersModel mm;
		System.out.println(member.getM_id());
		mm = membersService.loginCheck(member, request);
		if(mm!=null) {
			HttpSession session = request.getSession();  
			if((request.getParameter("idSave")) != null) {
				if(((String)request.getParameter("idSave")).equals("save")) {
					System.out.println("느으으윾힘표!!!");
					response.addCookie(CookieBox.createCookie("m_id",mm.getM_id()));//ID 쿠키 생성
					response.addCookie(CookieBox.createCookie("m_password",mm.getM_password()));//ID 쿠키 생성
					}
				}
			/* 세션값 더 필요한 거 있으면 요기다 저장하세용~! */
			session.setAttribute("session_m_id", mm.getM_id());
			session.setAttribute("session_m_no", mm.getM_no());
			/*관심사가 이미 저장되어 있는 거 같은데...*/
			return "redirect:/main";
		}
		else
			return "firstPage";
	}
	
	@RequestMapping(value="/members/createForm", method=RequestMethod.GET)
	public String createForm(Model model) {	
		return "createForm";
	}

	@RequestMapping(value="/members/createForm", method=RequestMethod.POST)
	//public String join(@ModelAttribute("member") MembersModel member, MultipartFile file) throws Exception{
	public String join(@ModelAttribute("member") MembersModel member) throws Exception{
		membersService.insertMember(member);	
		return "redirect:/first";
	}
	
	@ResponseBody
	@RequestMapping("/checkId")
	public Map<Object, Object> idcheck(HttpServletRequest request){
		String userId = request.getParameter("userId");
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		count = membersService.checkId(userId);
		map.put("cnt", count);
		return map;
	}
	
	@RequestMapping(value= {"/members/find"}, method=RequestMethod.GET)
	 public String findForm(){
		return "findPage";
	}
	
	@RequestMapping(value= "/findId", method=RequestMethod.GET)
	 public ModelAndView findId(String name, String phone, HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();
		MembersModel member = new MembersModel();
		member.setM_name(name);
		member.setM_phone(phone);
		
		MembersModel result = new MembersModel();
		result = membersService.findId(member, request);
		
		if(result != null) {
			mav.addObject("member", result);
			mav.setViewName("findId");
			return mav;
		}
		else {
			mav.setViewName("mError");
			return mav;
		}
	}
	
	@RequestMapping(value= "/findPW", method=RequestMethod.GET)
	 public ModelAndView findPW(String name, String id, String phone, HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();
		MembersModel member = new MembersModel();
		member.setM_name(name);
		member.setM_id(id);
		member.setM_phone(phone);
		
		MembersModel result = new MembersModel();
		result = membersService.findPW(member, request);
		
		if(result != null) {
			mav.addObject("member", result);
			mav.setViewName("findPW");
			return mav;
		}
		else {
			mav.setViewName("mError");
			return mav;
		}
	}
	
	@RequestMapping(value= "/findPW", method=RequestMethod.POST)
	 public String ResetPW(MembersModel member, HttpServletRequest request){
		membersService.resetPW(member);
		return "result";		
	}
	
	
}