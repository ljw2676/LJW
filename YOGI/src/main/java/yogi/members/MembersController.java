package yogi.members;


import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import yogi.config.CommandMap;
import yogi.alram.AlramServiceImpl;
import yogi.members.CookieBox;

@Controller
public class MembersController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="membersService")
	private MembersService membersService;
	
	@Resource(name = "alramService")
	private AlramServiceImpl alramService;
	
	// REST API KEY
	private static final String restapi = "2ab48798bf1b7030199a226eec55208a";
	// redirect_uri
	private static final String mydomainkakao = "http://localhost:8080/yogi/kakaoCallback";
			
	//카카오로그인
		@RequestMapping(value="/kakaoLogin")
		public String kakao() {
			String karequestUrl = "https://kauth.kakao.com/oauth/authorize?client_id="+restapi+"&redirect_uri="+mydomainkakao+"&response_type=code";
			log.info("login 코드 요청 종료 CallBack 기다리는 중");
	        log.info("login 코드 요청 보낸 uri 값은 "+karequestUrl);
	        return "redirect:" + karequestUrl;   //만들어진 URL로 인증을 요청합니다.		
	       	}
		
		@SuppressWarnings("static-access")
		@RequestMapping(value="/kakaoCallback",method=RequestMethod.GET)
		public String kakaoLogin(@RequestParam(required = false,value = "code") String code,HttpServletRequest request) throws Exception {
				Kakao kakao = null;
				HttpSession session = request.getSession(); 
				
				log.info("카카오로 부터 응답이 왔습니다.");
		        log.info("카카오로 부터 callback 이 호출됩니다.");
		        log.info("받은 변수의 값은 code :"+code);

		        log.info("인증 코드를 받았습니다.");

		        String grant_type="authorization_code";
		        /*
		        * client_id
		        * redirect_uri
		        * code
		        * */
		        log.info("토큰을 받을 주소를 만듭니다.");
		        String tokenReqUrl="https://kauth.kakao.com/oauth/token?grant_type="+grant_type+"&client_id="+restapi
		                +"&redirect_uri="+mydomainkakao+"&code="+code;

		        log.info("토큰 주소는 : "+tokenReqUrl);

		        log.info("토크을 보내고 받아 옵니다.");

				String data = kakao.getHtml(tokenReqUrl, code);       //access_token을 받아옵니다.
		        log.info("응답바디는 :" + data);
		        Map<String,String> map = kakao.JSONStringToMap(data); //JSON의 형태로 받아온 값을 Map으로 저장합니다.

		        String accessToken = map.get("access_token");
		        String tokenType = map.get("token_type");
		        String refresh_Token = map.get("refresh_token");
		        String scope = map.get("scope");

		       
		        /* 아래 형태로 access_token을 받아 온다.
		        "access_token":"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
		        "token_type":"bearer",
		        "refresh_token":"yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy",
		        "expires_in":43199,
		        "scope":"Basic_Profile"
		        */

		        log.info("accessToken : " + accessToken);
		        log.info("token_type : " + tokenType);
		        log.info("refresh_token : " + refresh_Token);
		        log.info("scope : "+ scope);

		        
		        String kakaoUserProfileReqUrl="https://kapi.kakao.com/v2/user/me?Authorization="+accessToken;

		        log.info("받아온 토큰으로 사용자 정보 요청 url 생성 : " + kakaoUserProfileReqUrl);

		        String userData = kakao.getHtml(kakaoUserProfileReqUrl, tokenType + " " + accessToken);

		        log.info("1.받아온 데이터는 : " + userData);

		        UserkakaoVo userkakaoVo    = new Gson().fromJson(userData, UserkakaoVo.class );
		        
		        log.info("로그인 유저 카카오 ID : " +userkakaoVo.getId());

		        log.info("로그인 유저 카카오 닉네임 : " +userkakaoVo.getProperties().get("nickname"));
		        
		        List<Map<String, Object>> mem_alram = null;
				if(alramService.alramExist(Integer.parseInt(userkakaoVo.getId())) != 0){
					mem_alram = alramService.alramLoad(Integer.parseInt(userkakaoVo.getId()));
				}
				

				session.setAttribute("session_m_id", userkakaoVo.getProperties().get("nickname"));
				session.setAttribute("session_m_name",userkakaoVo.getProperties().get("nickname"));
				session.setAttribute("session_m_no", userkakaoVo.getId());
				if (userkakaoVo.getProperties().get("email") != null) {
					session.setAttribute("session_m_email", userkakaoVo.getProperties().get("email"));
				}
				session.setAttribute("session_mem_alram", mem_alram);
				return "redirect:/main";
		    }
		
	
	
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
	 public String login(@ModelAttribute("member") MembersModel member, HttpServletRequest request, HttpServletResponse response) throws Exception{
		MembersModel mm;
		System.out.println(member.getM_id());
		mm = membersService.loginCheck(member, request);
		if(mm!=null) {
			HttpSession session = request.getSession();  
			if((request.getParameter("idSave")) != null) {
				if(((String)request.getParameter("idSave")).equals("save")) {
					response.addCookie(CookieBox.createCookie("m_id",mm.getM_id()));//ID 쿠키 생성
					response.addCookie(CookieBox.createCookie("m_password",mm.getM_password()));//ID 쿠키 생성
					}
				}
			else {
				response.addCookie(CookieBox.createCookie("m_id","none"));//ID 쿠키 생성
			}
			System.out.println("member_no"+mm.getM_no());
			List<Map<String, Object>> mem_alram = null;
			if(alramService.alramExist(mm.getM_no()) != 0){
				mem_alram = alramService.alramLoad(mm.getM_no());
			}
			
			/* 세션값 더 필요한 거 있으면 요기다 저장하세용~! */
			session.setAttribute("session_m_id", mm.getM_id());
			session.setAttribute("session_m_phone", mm.getM_phone());
			session.setAttribute("session_m_name", mm.getM_name());
			session.setAttribute("session_m_no", mm.getM_no());
			session.setAttribute("session_mem_alram", mem_alram);
			return "redirect:/main";
		}
		else
			return "firstPage";
	}
	@RequestMapping(value= "/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("session_m_id") != null){
			session.removeAttribute("session_m_id");
			session.removeAttribute("session_m_no");
		}
		return "redirect:first";
	}
	
	@RequestMapping(value="/members/createForm")
	public String createForm(Model model) {	
		return "createForm";
	}

	@RequestMapping(value="/members/createForm", method=RequestMethod.POST)
	//public String join(@ModelAttribute("member") MembersModel member, MultipartFile file) throws Exception{
	public String join(@ModelAttribute("member") MembersModel member, HttpServletRequest request) throws Exception{
		membersService.insertMember(member, request);	
		return "redirect:/first";
	}
	
	@ResponseBody//자바 객체를 HTTP 요청의 body 내용으로 매핑하는 역할을 합니다.
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
	
	@RequestMapping(value="/members/modifyForm", method=RequestMethod.GET)
	public ModelAndView modifyForm(CommandMap map, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("/members/modifyForm");
		MembersModel result = membersService.mInfo((Integer)session.getAttribute("session_m_no"));
		String[] gogo = null;
		if(result.getM_fav_field() != null) {
			String[] interest = result.getM_fav_field().split(",");
			gogo = new String[15];
			for(int j=0; j<interest.length; j++) {
				if(interest[j].equals("실외활동"))
					gogo[0]="check";
				else if(interest[j].equals("패션"))
					gogo[1]="check";
				else if(interest[j].equals("맛집"))
					gogo[2]="check";
				else if(interest[j].equals("게임"))
					gogo[3]="check";
				else if(interest[j].equals("동물"))
					gogo[4]="check";
				else if(interest[j].equals("보드게임"))
					gogo[5]="check";
				else if(interest[j].equals("전시/공연"))
					gogo[6]="check";
				else if(interest[j].equals("취업/스터디"))
					gogo[7]="check";
				else if(interest[j].equals("춤"))
					gogo[8]="check";
				else if(interest[j].equals("독서토론"))
					gogo[9]="check";
				else if(interest[j].equals("음악"))
					gogo[10]="check";
				else if(interest[j].equals("언어교환"))
					gogo[11]="check";
				else if(interest[j].equals("여행"))
					gogo[12]="check";
				else if(interest[j].equals("웰빙"))
					gogo[13]="check";
				else if(interest[j].equals("공예"))
					gogo[14]="check";
			}
		}
		mv.addObject("interest", gogo);
		
		
		String[] a_gogo=null;
		if(result.getM_fav_area() != null) {
			String[] area = result.getM_fav_area().split(",");
			a_gogo = new String[25];
			for(int j=0; j<area.length; j++) {
				if(area[j].equals("종로구"))
					a_gogo[0]="check";
				else if(area[j].equals("중구"))
					a_gogo[1]="check";
				else if(area[j].equals("용산구"))
					a_gogo[2]="check";
				else if(area[j].equals("성동구"))
					a_gogo[3]="check";
				else if(area[j].equals("광진구"))
					a_gogo[4]="check";
				else if(area[j].equals("동대문구"))
					a_gogo[5]="check";
				else if(area[j].equals("중랑구"))
					a_gogo[6]="check";
				else if(area[j].equals("성북구"))
					a_gogo[7]="check";
				else if(area[j].equals("강북구"))
					a_gogo[8]="check";
				else if(area[j].equals("도봉구"))
					a_gogo[9]="check";
				else if(area[j].equals("노원구"))
					a_gogo[10]="check";
				else if(area[j].equals("은평구"))
					a_gogo[11]="check";
				else if(area[j].equals("서대문구"))
					a_gogo[12]="check";
				else if(area[j].equals("마포구"))
					a_gogo[13]="check";
				else if(area[j].equals("양천구"))
					a_gogo[14]="check";
				else if(area[j].equals("강서구"))
					a_gogo[15]="check";
				else if(area[j].equals("구로구"))
					a_gogo[16]="check";
				else if(area[j].equals("금천구"))
					a_gogo[17]="check";
				else if(area[j].equals("영등포구"))
					a_gogo[18]="check";
				else if(area[j].equals("동작구"))
					a_gogo[19]="check";
				else if(area[j].equals("관악구"))
					a_gogo[20]="check";
				else if(area[j].equals("서초구"))
					a_gogo[21]="check";
				else if(area[j].equals("강남구"))
					a_gogo[22]="check";
				else if(area[j].equals("송파구"))
					a_gogo[23]="check";
				else if(area[j].equals("강동구"))
					a_gogo[24]="check";
				
			}
		}
		mv.addObject("area", a_gogo);
		
		mv.addObject("members",result);
		return mv;
	}

	@RequestMapping(value="/members/modifyForm", method=RequestMethod.POST)
	public String modify(@ModelAttribute("member") MembersModel member, HttpServletRequest request) throws Exception{
		membersService.updateMember(member, request);	
		return "redirect:/main";
	}
	
	
	@RequestMapping(value= "/members/delMem", method=RequestMethod.GET)
	 public String deleteMember(String id){
		membersService.deleteMember(id);
		return "/members/delMem";
	}
	
}