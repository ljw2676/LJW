package yogi.group;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import yogi.group.GroupDAO;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

@Service
public class GroupServiceImpl implements GroupService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private GroupDAO groupDAO;
	
	@Override
	public List<Map<String, Object>> selectGroupList(Map<String, Object> map) throws Exception {
		if(map.get("searchCategory") == null || StringUtils.isBlank(map.get("searchCategory").toString())){
			map.remove("searchCategory");
		}
		if(map.get("searchAddr") == null || StringUtils.isBlank(map.get("searchAddr").toString())){
			map.remove("searchAddr");
		}
		if(map.get("searchMStart") == null || StringUtils.isBlank(map.get("searchMStart").toString())){
			map.remove("searchMStart");
		}
		if(map.get("searchPay") == null || StringUtils.isBlank(map.get("searchPay").toString())){
			map.remove("searchPay");
		}
		if(map.get("searchWord") == null || StringUtils.isBlank(map.get("searchWord").toString())){
			map.remove("searchWord");
		}
		
		List<Map<String, Object>> resultList = groupDAO.selectGroupList(map);

		return resultList;
	}
	
}
