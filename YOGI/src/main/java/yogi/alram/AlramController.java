package yogi.alram;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import yogi.config.CommandMap;

@Controller
public class AlramController {

	@Resource(name="alramService")
	private AlramService alramService;
	
	@RequestMapping(value="/alramRead")
	public ModelAndView alramRead(CommandMap map,HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		String alram_seq = request.getParameter("alram_seq");
		
		alramService.readAlram(map.getMap());
		Map<String, Object> alramModel = alramService.selectAlramOne(map.getMap());
		
		String url = "";
		/*if(alramModel.getAlram_index_no() == 1 || alramModel.getAlram_index_no() == 4 || alramModel.getAlram_index_no() == 5 || alramModel.getAlram_index_no() == 6 || alramModel.getAlram_index_no() == 7){
			url = "viewStyle.do?url=main&article_seq="+alramModel.getAlram_contnum();
		}else if(alramModel.getAlram_index_no() == 2){
			url = "viewCollection.do?url=myPageActivity&mem_id="+alramModel.getAlram_id()+"&collection_seq="+alramModel.getAlram_contnum();
		}else if(alramModel.getAlram_index_no() == 3){
			url = "myPageActivitySty.do?mem_id="+alramModel.getAlram_id();
		}*/
		
		if(Integer.parseInt(alramModel.get("ALRAM_INDEX_NO").toString()) == 1 || Integer.parseInt(alramModel.get("alram_index_no").toString()) == 4 || Integer.parseInt(alramModel.get("alram_index_no").toString()) == 5 || Integer.parseInt(alramModel.get("alram_index_no").toString()) == 6 || Integer.parseInt(alramModel.get("alram_index_no").toString()) == 7) {
			url = "groupDetail?gg_no="+alramModel.get("ALRAM_CONTNUM");
		} else if(Integer.parseInt(alramModel.get("alram_index_no").toString()) == 2) {
			url = "viewCollection.do?url=myPageActivity&mem_id="+alramModel.get("alram_contnum")+"&collection_seq="+alramModel.get("alram_contnum");
		} else if(Integer.parseInt(alramModel.get("alram_index_no").toString()) == 3) {
			url = "myPageActivitySty.do?mem_id="+alramModel.get("alram_id");
		}
	
		mav.setViewName("redirect:"+url);
		
		return mav;
	}
	
}
