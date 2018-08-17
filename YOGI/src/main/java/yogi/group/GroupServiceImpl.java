package yogi.group;

import java.util.Date;
import java.util.Enumeration;
import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

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
	
	Calendar today = Calendar.getInstance();
	
	private int ref;
	private int re_step;
	private int re_level;
	boolean reply = false;
	private static final String filePath = "C:\\java\\git\\YOGI\\YOGI\\src\\main\\webapp\\resources\\upload\\";

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
		System.out.println(map);
		Map<String, Object> detail = groupDAO.selectGroupDetail(map);
		List<Map<String,Object>> geList = groupDAO.groupEnrollList(map);	
		List<Map<String,Object>> cmtList = groupDAO.selectCmtList(map);
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
		resultMap.put("geList", geList);
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
	public void insertGroup(GroupModel group, HttpServletRequest request) throws Exception {
		System.out.println("GroupServiceImpl : insertGroup 실행");
		Map<String, Object> fileMap = fileUtils.parseInsertFileInfo(request);
		
		group.setM_no(1);
		group.setGg_enable(group.getGg_total()-1);
		group.setGg_ofn(fileMap.toString().valueOf(fileMap.get("ORIGINAL_FILE_NAME")));
		group.setGg_rfn(fileMap.toString().valueOf(fileMap.get("STORED_FILE_NAME")));
		
		groupDAO.insertGroup(group);
		
	}

	@Override
	public Map<String, Object> modifyGroup(Map<String, Object> map, HttpServletRequest request) throws Exception {
		System.out.println("groupModify:Sevice 실행");
		
		//request파일 객체 구체화
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		//넘어오는 파일객체가 있으면
		if(iterator.hasNext()) {
			
			//기존 파일 가져오기
			String deleteFileName = groupDAO.deleteFileName(map.get("gg_no").toString());
			//기존 파일이 존재하면 삭제
			if(deleteFileName!=null) {
				File deleteFile = new File(filePath+deleteFileName);
				deleteFile.delete();
			}
			
			//새로 넘어온 파일 처리
			Map<String, Object> fileMap = fileUtils.parseInsertFileInfo(request);
			map.put("gg_ofn", fileMap.toString().valueOf(fileMap.get("ORIGINAL_FILE_NAME")));
			map.put("gg_rfn", fileMap.toString().valueOf(fileMap.get("STORED_FILE_NAME")));
			System.out.println("그룹 이미지 변경 : "+map.get("gg_ofn")+" & "+map.get("gg_rfn"));
			
			groupDAO.modifyGroup(map);
			
		}
		//넘어오는 파일객체가 없으면
		else{
			/*Map<String, Object> FileName = groupDAO.selectGroupDetail(map);
			
			//원래 저장한 사진이 없을때
			if(FileName.get("gg_ofn")==null) {
				System.out.println("기존 그룹 이미지 : "+map.get("gg_ofn")+" & "+map.get("gg_rfn"));
			}
			//원래 저장한 사진이 있을때
			else {
				map.put("gg_ofn", FileName.get("gg_ofn"));
				map.put("gg_rfn", FileName.get("gg_rfn"));
				System.out.println("기존 그룹 이미지 : "+map.get("gg_ofn")+" & "+map.get("gg_rfn"));
			}*/
			groupDAO.modifyGroupExceptFile(map);
			
		}
		
		System.out.println("그룹 수정 내용 : "+map);
		return map;
		
	}
	
	@Override
	public void insertComments(Map<String, Object> map, HttpServletRequest request) throws Exception {
	reply = true;
	System.out.println(map);
	/*Integer.parseInt(map.get("ref").toString()) == 0*/
	System.out.println(ref);
	if(Integer.parseInt(map.get("ref").toString()) == 0)
	{
		map.put("re_step",0);
		map.put("re_level",0);
	}
	else {
		groupDAO.updateReplyStep(map);
		map.put("re_step", Integer.parseInt(map.get("re_step").toString())+1);
		//cModel.setC_re(cModel.getC_re() + 1);
		map.put("re_level", Integer.parseInt(map.get("re_level").toString())+1);
		//cModel.setC_lv(cModel.getC_lv() + 1);
	}
	
	if(Integer.parseInt(map.get("ref").toString()) == 0)
		groupDAO.insertCmt(map);
	else 
		groupDAO.insertCmtRep(map);
	}

	@Override
	public void inactivateGroup(Map<String, Object> map){
		groupDAO.inactivateGroup(map);
		
	}
}
