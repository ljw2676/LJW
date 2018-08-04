package yogi.admin.lendplace;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import yogi.lendplace.LendplaceModel;
import yogi.members.MembersModel;
@Controller
public class AdminLendplaceController {
	
	@Resource(name="adminLendplaceService")
	private AdminLendplaceService lendplaceService;
	
	@RequestMapping(value= "/admin/lendplace/Form")
	 public String lendplaceForm(){
		return "/admin/lendplaceForm";
	}

	  @RequestMapping(value="/admin/lendplace/Form", method=RequestMethod.POST)
	    public ModelAndView lendplaceInsert(@ModelAttribute("lendplaceModel")LendplaceModel lendplaceModel) throws Exception{
		   System.out.println("컨트롤러");
		   lendplaceService.insertPlace(lendplaceModel);
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
	  public ModelAndView lendplaceDelete(LendplaceModel lendplaceModel) throws Exception {
		 lendplaceService.deletePlace(lendplaceModel);
		 return new ModelAndView("redirect:/admin/lendplaceSuccess"); //리다이렉트 : 관리자 장소 리스트 페이지
	  }
	

}
