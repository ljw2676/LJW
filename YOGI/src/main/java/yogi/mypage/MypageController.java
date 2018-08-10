package yogi.mypage;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import yogi.admin.lendplace.AdminLendplaceService;
import yogi.config.CommandMap;
import yogi.members.MembersModel;

@Controller
public class MypageController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="mypageService")
	private MypageService mypageService;
	
/*	@RequestMapping(value= "/mypage/mypageView")
	public ModelAndView mypage(){
		return "/mypage/mypageView";
	}*/
	
	@RequestMapping("/mypage/mypageView")
	public ModelAndView mypageView(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/mypageView");
		Map<String, Object> map = mypageService.selectOneMember(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
		
	}
	
	//내가 개설한 모임
	@RequestMapping(value="/mypage/writeHistory")
	public ModelAndView writeHistory(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/mypageWriteHistory");
		List<Map<String, Object>> list = mypageService.selectWriteHistory(commandMap.getMap());
//		commandMap.put("m_no", session.getAttribute("session_m_no"));
		mv.addObject("list", list);
		
		return mv;
	}
	
	//내가 참여한 모임
	@RequestMapping(value="/mypage/meetHistory")
	public ModelAndView meetHistory(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/mypageMeetHistory");
		List<Map<String, Object>> list = mypageService.selectMeetHistory(commandMap.getMap());
//		commandMap.put("m_no", session.getAttribute("session_m_no"));
		mv.addObject("list", list);
		
		return mv;
	}
	
	//내가 찜한 모임
	@RequestMapping(value="/mypage/zzimHistory")
	public ModelAndView zzimHistory(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/mypageZzimHistory");
		List<Map<String, Object>> list = mypageService.selectZzimHistory(commandMap.getMap());
//		commandMap.put("m_no", session.getAttribute("session_m_no"));
		mv.addObject("list", list);
		
		return mv;
	}
	
	
	
	//장소 신청 내역
	@RequestMapping(value="/mypage/placebookHistory")
	public ModelAndView placebookHistory(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/mypagePlacebookHistory");
		List<Map<String, Object>> list = mypageService.selectPlacebookHistory(commandMap.getMap());
//		commandMap.put("m_no", session.getAttribute("session_m_no"));
		mv.addObject("list", list);
		
		return mv;
	}

}
