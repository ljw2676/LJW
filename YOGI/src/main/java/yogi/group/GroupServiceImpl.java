package yogi.group;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import yogi.common.common.YogiConstants;
import yogi.common.util.FileUtils;
import yogi.common.util.YogiUtils;
import yogi.group.GroupDAO;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

@Service("groupService")
public class GroupServiceImpl implements GroupService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="groupDAO")
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

	@Override
	public Map<String, Object> selectGroupDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> detail = groupDAO.selectGroupDetail(map);
		List<Map<String, Object>> cmtList = groupDAO.selectCmtList(map);
		detail.put("GG_DATE", YogiUtils.dateFormat((Date)detail.get("GG_DATE")));
		if(map.get("m_no") != null && !StringUtils.isEmpty(map.get("m_no").toString())) {
			Map<String, Object> likeit = groupDAO.selectLikeitExist(map);
			Map<String, Object> enroll = groupDAO.selectGroupEnrollExist(map);		
			if(likeit != null) {
				detail.put("GG_LIKEIT", likeit.get("LI_NO"));
			} else { 
				detail.put("GG_LIKEIT", null); 
			}
		
			if(enroll != null) {
				detail.put("GG_ENROLL", enroll.get("GE_NO"));
			} else {
				detail.put("GG_ENROLL", null);
			}
			
		} else {
			detail.put("GG_LIKEIT", null);
			detail.put("GG_ENROLL", null);
		}

		resultMap.put("detail", detail);
		resultMap.put("cmtList", cmtList);
		return resultMap;
	}

	@Override
	public void insertLikeit(Map<String, Object> map, HttpServletRequest request) throws Exception {
		map.put("m_no", request.getSession().getAttribute(YogiConstants.M_NO));
		Map<String, Object> resultMap = groupDAO.selectLikeitExist(map);
		if(resultMap == null){
			groupDAO.insertLikeit(map);
		} else {
			groupDAO.deleteLikeit(map);		
		}
	}
	@Override
	public void insertGroupEnroll(Map<String, Object> map, HttpServletRequest request) throws Exception {
		map.put("m_no", request.getSession().getAttribute(YogiConstants.M_NO));
		Map<String, Object> resultMap = groupDAO.selectGroupEnrollExist(map);
		if(resultMap == null){
			groupDAO.insertGroupEnroll(map);
			groupDAO.plusGrade(map);
			groupDAO.plusCrp(map);
		} else {
			groupDAO.deleteGroupEnroll(map);
			groupDAO.minusGrade(map);
			groupDAO.minusCrp(map);
		}
	}
	
	@Override
	public void insertComments(Map<String, Object> map) throws Exception {
		groupDAO.insertCmt(map);
	}

}
