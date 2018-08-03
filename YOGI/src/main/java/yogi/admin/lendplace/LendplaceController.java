package yogi.admin.lendplace;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import yogi.common.common.CommandMap;

@Controller
public class LendplaceController {
	
	@Resource(name="lendplaceService")
	private LendplaceService lendplaceService;
	
	@RequestMapping(value= "/admin/lendplace/Form")
	 public String lendplaceForm(){
		return "/admin/lendplaceForm";
	}

	   @RequestMapping(value="/admin/lendplace/Insert", method=RequestMethod.POST)
	    public ModelAndView lendplaceInsert(CommandMap map, MultipartHttpServletRequest request) throws Exception{
			lendplaceService.insertPlace(map.getMap(), request);
			return new ModelAndView("redirect:/admin/lendplaceSuccess");
			
	    }
}
