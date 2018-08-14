package yogi.admin.lendplace;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import yogi.admin.lendplace.AdminLendplaceDAO;
import yogi.common.util.YogiUtils;
import yogi.config.CommandMap;
import yogi.lendplace.LendplaceModel;

@Service("adminLendplaceService")
public class AdminLendplaceServiceImpl implements AdminLendplaceService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminLendplaceDAO")
	private AdminLendplaceDAO lendplaceDAO;
	
//	@Autowired
//	private FileUploadComponent fileUploadComp;

	@Override
	public void insertPlace (Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
//		String uploadFilePath = fileUploadComp.saveFile(request.getFile("file"));
//		map.put("l_rep_img", uploadFilePath);
//		map.put("l_sdate", YogiUtils.dateParse(map.get("l_sdate").toString()));
//		map.put("l_edate", YogiUtils.dateParse(map.get("l_edate").toString()));
		lendplaceDAO.insertPlace(map);
	}

	@Override
	public void deletePlace(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		lendplaceDAO.deletePlace(map);
		
	}

	@Override
	public List<Map<String, Object>> selectLendplaceList(Map<String, Object> map) throws Exception {
		return lendplaceDAO.selectLendplaceList(map);
	}

	@Override
	public List<Map<String, Object>> selectPlaceBookList(Map<String, Object> map) throws Exception {
		return lendplaceDAO.selectPlaceBookList(map);
	}
	
	@Override
	public void applyPlace(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		lendplaceDAO.applyPlace(map);
		
	}

	@Override
	public void cancelPlace(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		lendplaceDAO.cancelPlace(map);
	}

	@Override
	public void updatePoint(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		lendplaceDAO.updatePoint(map);
	}

	@Override
	public void dwCountUdate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		lendplaceDAO.dwCountUdate(map);
	}
	
	
}
	
	
