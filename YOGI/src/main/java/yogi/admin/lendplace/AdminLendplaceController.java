package yogi.admin.lendplace;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import yogi.lendplace.LendplaceModel;
import yogi.config.CommandMap;

@Controller
public class AdminLendplaceController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminLendplaceService")
	private AdminLendplaceService lendplaceService;
	
	@RequestMapping(value= "/admin/lendplace/Form")
	public String lendplaceForm(){
		return "/admin/lendplaceForm";
	}

	//장소등록
	 @RequestMapping(value="/admin/lendplace/Insert")
	    public ModelAndView lendplaceInsert(CommandMap commandMap) throws Exception{
		   System.out.println("컨트롤러");
		   lendplaceService.insertPlace(commandMap.getMap());
		   return new ModelAndView("redirect:/lendplace/list"); //리다이렉트:관리자 장소 리스트 페이지
	    }
	//테스트용 success화면
	@RequestMapping(value= "/admin/lendplaceSuccess")
	public String lendplaceSuccess(){
		return "/admin/lendplaceSuccess";
	}
	  
	//장소 삭제
	@RequestMapping(value="/admin/lendplace/Delete")
	public ModelAndView lendplaceDelete(CommandMap commandMap) throws Exception {
		lendplaceService.deletePlace(commandMap.getMap());
		return new ModelAndView("redirect:/admin/lendplaceSuccess"); //리다이렉트 : 관리자 장소 리스트 페이지
	}
	
	//장소 리스트
	@RequestMapping(value="/admin/lendplace/list")
	public ModelAndView lendplaceList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("adminLendplaceList");
		List<Map<String, Object>> list = lendplaceService.selectLendplaceList(commandMap.getMap());
		
		mv.addObject("list", list);
		
		return mv;
	}
	
	//장소 신청 리스트
	@RequestMapping(value="/admin/placeBook/list")
	public ModelAndView placeBookList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("adminPlaceBookList");
		List<Map<String, Object>> list = lendplaceService.selectPlaceBookList(commandMap.getMap());
		
		mv.addObject("list", list);
		
		return mv;
	}
	
	  //장소 신청
	  @RequestMapping(value="/admin/lendplace/Apply")
	    public ModelAndView placebookInsert(CommandMap commandMap) throws Exception{
		   lendplaceService.applyPlace(commandMap.getMap());
		   return new ModelAndView("redirect:/admin/lendplaceSuccess"); //리다이렉트 : 장소 리스트 페이지
	    }
	  
	  //장소 신청 취소
	  @RequestMapping(value="/admin/lendplace/Cancel")
	    public ModelAndView placebookCancel(CommandMap commandMap) throws Exception{
		   lendplaceService.cancelPlace(commandMap.getMap());
		   return new ModelAndView("redirect:/admin/lendplaceSuccess"); //리다이렉트:장소 리스트 페이지
	    }
	
	



}
