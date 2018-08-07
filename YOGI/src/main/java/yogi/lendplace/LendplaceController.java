package yogi.lendplace;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import yogi.config.CommandMap;

@Controller
public class LendplaceController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="lendplaceService")
	private LendplaceService lendplaceService;
	
	@RequestMapping(value="/lendplace/list")
    public ModelAndView selectLendplaceList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/lendplace/list");
    	List<Map<String, Object>> list = lendplaceService.selectLendplaceList(commandMap.getMap());
    	mv.addObject("list",list);
    	
		return mv;
    }
	
	@RequestMapping(value="/lendplace/detail")
	public ModelAndView selectLendplaceDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/lendplace/detail");
		
		Map<String,Object> map = lendplaceService.selectLendplaceDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
//	@RequestMapping(value="/lendplace/insertForm")
//	public ModelAndView insertLendplaceForm(CommandMap commandMap) throws Exception{
//		ModelAndView mv = new ModelAndView("/lendplace/insertForm");
//		
//		return mv;
//	}
//	
//	@RequestMapping(value="/lendplace/insert")
//	public ModelAndView insertLendplace(CommandMap commandMap, HttpServletRequest request) throws Exception{
//		ModelAndView mv = new ModelAndView("redirect:/lendplace/openBoardList.do");
//		
//		lendplaceService.insertLendplace(commandMap.getMap(), request);
//		
//		return mv;
//	}
}
