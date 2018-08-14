package yogi.lendplace;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import yogi.common.util.PagingCalculator;
import yogi.common.util.YogiUtils;
import yogi.config.CommandMap;

@Controller
public class LendplaceController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="lendplaceService")
	private LendplaceService lendplaceService;
	
	//장소 목록
	@RequestMapping(value="/lendplace/list")
    public ModelAndView selectLendplaceList(CommandMap commandMap,HttpServletRequest request) throws Exception{
		YogiUtils.savePageURI(request);
		ModelAndView mv = new ModelAndView("/lendplace/list");
    	List<Map<String, Object>> list = lendplaceService.selectLendplaceList(commandMap.getMap());
    	PagingCalculator paging = new PagingCalculator("lendplace/list", commandMap.getCurrentPageNo(), list, 6 ,3);
    	Map<String, Object> result = paging.getPagingList();
    	mv.addObject("list",result.get("list"));
    	mv.addObject("pagingHtml", result.get("pagingHtml"));
    	mv.addObject("currentPageNo", commandMap.getCurrentPageNo());
    	
		return mv;
		
	}
	
	//장소 상세
	@RequestMapping(value="/lendplace/detail")
	public ModelAndView selectLendplaceDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/lendplace/detail");
		Map<String,Object> map = lendplaceService.selectLendplaceDetail(commandMap.getMap());
		mv.addObject("map", map);
		int Udate = (Integer.parseInt(map.get("L_UDATE").toString()));
		if (Udate != 0 && Udate >= 1) {
			List<Map<String, Object>> date = lendplaceService.dateCheck(commandMap.getMap());
			mv.addObject("date",date);
		}
		
		
		return mv;
	}
	
	  //장소 신청
	@RequestMapping(value="/lendplace/apply")
    public ModelAndView placebookInsert(CommandMap commandMap) throws Exception{
		lendplaceService.insertPlacebook(commandMap.getMap());
		lendplaceService.upCountUdate(commandMap.getMap());
		return new ModelAndView("redirect:/lendplace/detail?L_NO="+commandMap.getMap().get("L_NO")+""); //리다이렉트 : 장소 상세 페이지
	    }

}
