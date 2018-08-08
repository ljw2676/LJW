package yogi.lendplace;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;


@Service("lendplaceService")
public class LendplaceServiceImpl implements LendplaceService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="lendplaceDAO")
	private LendplaceDAO lendplaceDAO;
	
	@Override
	public List<Map<String, Object>> selectLendplaceList(Map<String, Object> map) throws Exception {
		
		if(map.get("searchAddr") == null || StringUtils.isBlank(map.get("searchAddr").toString())){
			map.remove("searchAddr");
		}
		if(map.get("min_pay") == null || StringUtils.isBlank(map.get("min_pay").toString())){
			map.remove("min_pay");
		}
		if(map.get("max_pay") == null || StringUtils.isBlank(map.get("max_pay").toString())){
			map.remove("max_pay");
		}
		if(map.get("searchWord") == null || StringUtils.isBlank(map.get("searchWord").toString())){
			map.remove("searchWord");
		}
		if(map.get("l_sdate") == null || StringUtils.isBlank(map.get("l_sdate").toString())){
			map.remove("l_sdate");
		}
		if(map.get("l_edate") == null || StringUtils.isBlank(map.get("l_edate").toString())){
			map.remove("l_edate");
		}
		
		return lendplaceDAO.selectLendplaceList(map);
	}

	@Override
	public Map<String, Object> selectLendplaceDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = lendplaceDAO.selectLendplaceDetail(map);
		
		return resultMap;
	}


//	@Override
//	public void updateLendplace(Map<String, Object> map, HttpServletRequest request) throws Exception {
//	}
//
//	@Override
//	public void insertReview(Map<String, Object> map) throws Exception {
//	}
//
//	@Override
//	public void deleteReview(Map<String, Object> map) throws Exception {
//	}

}
