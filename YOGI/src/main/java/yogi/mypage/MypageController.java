package yogi.mypage;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import yogi.admin.lendplace.AdminLendplaceService;
import yogi.config.CommandMap;

@Controller
public class MypageController {
	
	
	@Resource(name="mypageService")
	private MypageService mypageService;
	
	@RequestMapping(value= "/mypage/mypageView")
	public String lendplaceForm(){
		return "/mypage/mypageView";
	}
	
	
	@RequestMapping(value="/mypage/placebookHistory")
	public ModelAndView placebookHistory(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/mypagePlacebookHistory");
		List<Map<String, Object>> list = mypageService.selectPlacebookHistory(commandMap.getMap());
		
		mv.addObject("list", list);
		
		return mv;
	}

}
