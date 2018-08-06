package yogi.group;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import yogi.group.GroupService;
import org.springframework.ui.Model;
import yogi.group.GroupSearchModel;
import yogi.common.util.*;
import yogi.config.CommandMap;

@Controller
public class GroupController {
	
	@Autowired
	private GroupService groupService;
	
	@RequestMapping(value="/group/groupList")
    public ModelAndView groupList(CommandMap map, HttpServletRequest request) throws Exception{
		YogiUtils.savePageURI(request);
		ModelAndView mv = new ModelAndView("/group/groupList");
		List<Map<String,Object>> list = groupService.selectGroupList(map.getMap());
		PagingCalculator paging = new PagingCalculator("group/groupList", map.getCurrentPageNo(), list, 6 ,3);
		Map<String, Object> result = paging.getPagingList();
		mv.addObject("list", result.get("list"));
		mv.addObject("pagingHtml", result.get("pagingHtml"));
		mv.addObject("currentPageNo", map.getCurrentPageNo());
        return mv;
    }	
	
	
}
