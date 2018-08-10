package yogi.main;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import yogi.common.util.PagingCalculator;
import yogi.common.util.YogiUtils;
import yogi.config.CommandMap;
import yogi.group.GroupService;
import yogi.members.MembersModel;
import yogi.members.MembersService;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping (value= "/main")
	public ModelAndView main(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mainPage");
		
		HttpSession session = request.getSession();
		System.out.println("main Controller : "+session.getAttribute("session_m_id"));
		/*로그인 한 친구의 관심사 뽑아오기*/
		MembersModel mm;
		//mm = mainService.getInterest( (String) session.getAttribute("session_m_id") );
		mm = mainService.getInterest( "test" );
		
		
		/*관심사 배열로 만들기*/
		if(mm.getM_fav_field() != null) {
			String interest_tmp = mm.getM_fav_field();
			String[] interest ;
			interest = interest_tmp.split(",");
			Map<String, Object> hm = new HashMap<String, Object>();

			hm.put("interest", interest);
			System.out.println("*******************" + interest[0] + "*******************");
			System.out.println("*******************" + hm.get("interest") + "*******************");
			
			List<Map<String, Object>>  list = mainService.test(hm);
			System.out.println("출력.." +list.size());
			mv.addObject("list",list);
			
		}
		if(mm.getM_fav_area() != null) {
			String area_tmp = mm.getM_fav_area();
			String[] area ;
			area = area_tmp.split(",");
		}
		
		return mv;
	}
	
	
}
