package yogi.admin.group;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import yogi.config.CommandMap;

@Controller
public class AdminGroupController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminGroupService")
	private AdminGroupService adminGroupService;

	@RequestMapping(value="/admin/group/list")
	public ModelAndView memberList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("adminGroupList");
		List<Map<String, Object>> list = adminGroupService.selectAdminGroupList(commandMap.getMap());
		
		mv.addObject("list",list);
		
		return mv;
	}

}
