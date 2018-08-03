package yogi.group;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import yogi.group.GroupService;
import org.springframework.ui.Model;

@Controller
public class GroupController {

	private Map<String, Object> map = new HashMap<String, Object>();
	private Map session;
	private HttpServletRequest request;
	
	@Resource
	private GroupService groupService;
	
	@RequestMapping(value="/group/groupList")
    public String groupList(Model model) throws Exception{
        List<Map<String,Object>> list = groupService.selectGroupList(map);
    
        model.addAttribute("list", list);
        return "/group/groupList";
    }

	
}
