package yogi.admin.lendplace;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;

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
	
	@Resource(name="adminLendplaceService")
	private AdminLendplaceService lendplaceService;
	
	@RequestMapping(value= "/admin/lendplace/Form")
	public String lendplaceForm(){
		return "/admin/lendplaceForm";
	}

	 @RequestMapping(value="/admin/lendplace/Insert")
	    public ModelAndView lendplaceInsert(CommandMap commandMap) throws Exception{
		   System.out.println("컨트롤러");
		   lendplaceService.insertPlace(commandMap.getMap());
		   return new ModelAndView("redirect:/admin/lendplaceSuccess"); //리다이렉트:관리자 장소 리스트 페이지
	    }
	  
	@RequestMapping(value= "/admin/lendplaceSuccess")
	public String lendplaceSuccess(){
		return "/admin/lendplaceSuccess";
	}
	  
	@RequestMapping(value= "/admin/lendplace/DeleteButton")
	public String lendplaceDelete(){
		return "/admin/lendplaceDeleteButton";
	}
	  
	@RequestMapping(value="/admin/lendplace/Delete")
	public ModelAndView lendplaceDelete(CommandMap commandMap) throws Exception {
		lendplaceService.deletePlace(commandMap.getMap());
		return new ModelAndView("redirect:/admin/lendplaceSuccess"); //리다이렉트 : 관리자 장소 리스트 페이지
	}
	
	@RequestMapping(value="/admin/lendplace/list")
	public ModelAndView lendplaceList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("adminLendplaceList");
		List<Map<String, Object>> list = lendplaceService.selectLendplaceList(commandMap.getMap());
		
		mv.addObject("list", list);
		
		return mv;
	}
	
	@RequestMapping(value="/admin/placeBook/list")
	public ModelAndView placeBookList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("adminPlaceBookList");
		List<Map<String, Object>> list = lendplaceService.selectPlaceBookList(commandMap.getMap());
		
		mv.addObject("list", list);
		
		return mv;
	}
	
	  
	  @RequestMapping(value="/admin/lendplace/Apply")
	    public ModelAndView placebookInsert(CommandMap commandMap) throws Exception{
		   System.out.println("컨트롤러");
		   lendplaceService.applyPlace(commandMap.getMap());
		   return new ModelAndView("redirect:/admin/lendplaceSuccess"); //리다이렉트:관리자 장소 리스트 페이지
	    }
	
	



}
