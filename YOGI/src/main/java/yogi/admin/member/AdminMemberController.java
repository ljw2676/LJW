package yogi.admin.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import yogi.config.CommandMap;



@Controller
public class AdminMemberController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminMemberService")
	private AdminMemberService adminMemberService;

	@RequestMapping(value="/admin/member/list")
	public ModelAndView memberList(CommandMap commandMap) throws Exception{
		
		ModelAndView mv = new ModelAndView("adminMemberList");
		List<Map<String, Object>> list = adminMemberService.selectAdminMemberList(commandMap.getMap());
		
		mv.addObject("list",list);
		
		return mv;
	}
	
	@RequestMapping(value="/admin/member/inactivateMember")
	public ModelAndView inactivateMember(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/member/list");
		//System.out.println("adminMemberController 실행");
		//System.out.println("커맨드맵 : "+commandMap.get("M_NO"));
		adminMemberService.inactivateMember(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value="/admin/member/activateMember")
	public ModelAndView activateMember(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/member/list");
		//System.out.println("adminMemberController 실행");
		//System.out.println("커맨드맵 : "+commandMap.get("M_NO"));
		adminMemberService.activateMember(commandMap.getMap());
		
		return mv;
	}
}
