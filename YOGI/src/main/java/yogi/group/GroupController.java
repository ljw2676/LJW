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

@Controller
public class GroupController {

	private Map<String, Object> map = new HashMap<String, Object>();
	private Map session;
	private HttpServletRequest request;
	private GroupSearchModel sModel;
	@Resource
	private List<Map<String,Object>> list;
	
	@Autowired
	private GroupService groupService;
	
	@RequestMapping(value="/group/groupList")
    public String groupList(Model model) throws Exception{
         list = groupService.selectGroupList(map);
    
        model.addAttribute("list", list);
        return "/group/groupList";
    }	
	
	@RequestMapping(value="/group/groupSearch", method= {RequestMethod.POST})
	public String search(Model model) throws Exception{
		String query = createQuery();
		if(query.length() > 0){
		
		list = groupService.searchGroupList(query);
		} else {
		 return "/group/groupList";
		}
		
		model.addAttribute("list", list);
		return "/group/groupList";
	}
	
private String createQuery(){
		
		List<String> queryList = new ArrayList<String>();
		
		if(sModel.getSearchWord() != null && sModel.getSearchWord().length() > 0){ 
			queryList.add("(gg_name like '%"+sModel.getSearchWord()+"%' or gg_simple like '%"+sModel.getSearchWord()+"%' or gg_detail like '% "+sModel.getSearchWord()+"%')");
		} 
		
		if(sModel.getSearchCategory() != null && sModel.getSearchCategory().length() > 0){
			queryList.add("REGEXP_LIKE(gg_category,'"+sModel.getSearchCategory()+"')");
		} //
		
		if(sModel.getSearchAddr() != null && sModel.getSearchAddr().length() > 0){
			queryList.add("REGEXP_LIKE(gg_place,'"+sModel.getSearchAddr()+"')");

		}
		
		if(sModel.getSearchPay() != null && sModel.getSearchPay().length() > 0) {
			if(sModel.getSearchPay().equals("유료")){
				queryList.add("gg_cost > 0");	
			} if(sModel.getSearchPay().equals("무료")){ 
				queryList.add("gg_cost <= 0");
			}
		}
				
		if(sModel.getSearchMStart() != null){
			queryList.add("(gg_date LIKE '%"+sModel.getSearchMStart()+"%')");
		}
		
		System.out.println(sModel.getSearchWord());
		System.out.println(sModel.getSearchCategory());	
		System.out.println(sModel.getSearchAddr());
		System.out.println(sModel.getSearchPay());
		System.out.println(sModel.getSearchMStart());
		
		
		
		String query = "";
		if(queryList.size() > 1){
			for (int i = 0; i < queryList.size(); i++) {
				query += queryList.get(i);
				if(queryList.size()-1 == i){
					continue;
				}
				query += " and ";
			}
		} else if(queryList.size() == 1){
			query = queryList.get(0);
		}
		return query;
	}
	
}
