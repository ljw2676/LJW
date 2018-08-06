package yogi.members;


import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MembersController {
	
	@Resource(name="membersService")
	private MembersService membersService;
	
	@RequestMapping(value= {"/", "/first"}, method=RequestMethod.GET)
	 public String first(){
    	return "firstPage";
	}
	
	@RequestMapping(value= {"/", "/first"}, method=RequestMethod.POST)
	 public String login(@ModelAttribute("member") MembersModel member, HttpServletRequest request){
		MembersModel mm;
		mm = membersService.loginCheck(member, request);
		if(mm!=null) {
			HttpSession session = request.getSession();  
			/* 세션값 더 필요한 거 있으면 요기다 저장하세용~! */
			session.setAttribute("session_m_id", mm.getM_id());
			session.setAttribute("session_m_no", mm.getM_no());
			return "mainPage";
		}
		else
			return "firstPage";
	}
	
	@RequestMapping(value="/members/createForm", method=RequestMethod.GET)
	public String createForm(Model model) {	
		return "createForm";
	}

	@RequestMapping(value="/members/createForm", method=RequestMethod.POST)
	public String join(@ModelAttribute("member") MembersModel member, MultipartFile file) throws Exception{
		System.out.println("컨트롤러 : " + member.getM_name());
		System.out.println("컨트롤러 : " + member.getM_fav_field());
		System.out.println("파일이름 : "+ file.getName());
		
		//member.setM_profile(multipartFile.getOriginalFilename());
		//System.out.println("컨트롤러 : " + member.getM_profile());
		//membersService.insertMember(member, request);//일반 회원가입	
		
		return "redirect:/first";
	}
	
	@RequestMapping(value="/members/membersIdChk")
	public int IdChk(String m_id) {
		System.out.println("id : " + m_id);
		System.out.println(membersService.checkId(m_id));
		return membersService.checkId(m_id);
	}
	
//	@RequestMapping("/checkJoinId")//아이디 중복확인
//	public String checkJoinId(Model model, @RequestParam(value="id", required=false, defaultValue="0") String id/*기본값 0*/){  
//		if(!id.equals("0")) {//기본값이 아니라면
//			int resultNumber = MemberService.checkJoinId(id);//해당아이디의 카운트를 구해옴
//			//int의 기본값은 0
//			model.addAttribute("resultNumber", resultNumber);//0을 넘기면 아이디 중복안되는것 //1이면 중복!
//			model.addAttribute("id", id);
//		}
//		return "/join/checkJoinId";
//	}
	
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
