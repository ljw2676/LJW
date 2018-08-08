package yogi.mypage;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import yogi.admin.lendplace.AdminLendplaceService;
import yogi.config.CommandMap;

@Controller
public class MypageController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="mypageService")
	private MypageService mypageService;
	
	@RequestMapping(value= "/mypage/mypageView")
	public String lendplaceForm(){
		return "/mypage/mypageView";
	}
	
	
	@RequestMapping(value="/mypage/placebookHistory")
	public ModelAndView placebookHistory(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/mypagePlacebookHistory");
		List<Map<String, Object>> list = mypageService.selectPlacebookHistory(commandMap.getMap());
		commandMap.put("m_no", session.getAttribute("session_m_no"));
		mv.addObject("list", list);
		
		return mv;
	}

}
