package yogi.admin.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class AdminMemberController {
	
	private Map<String, Object> map = new HashMap<String, Object>();
	private Map session;
	private HttpServletRequest request;

	@Autowired
	private AdminMemberService adminMemberService;
	
	/*@RequestMapping(value="/admin/member/list", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView memberList(CommandMap map, HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("adminMemberList");
        
        List<Map<String,Object>> list = adminMemberService.list(map.getMap());
        
        
        

        return mv;
	}*/
	
	@RequestMapping(value="/admin/member/list")
	public String memberList(Model model) throws Exception{
		
		List<Map<String, Object>> list = adminMemberService.list(map);
		
		model.addAttribute("list", list);
		
		return "adminMemberList";
	}
}
