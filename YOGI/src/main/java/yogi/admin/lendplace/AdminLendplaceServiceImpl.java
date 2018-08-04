package yogi.admin.lendplace;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import yogi.admin.lendplace.AdminLendplaceDAO;
import yogi.common.util.FileUploadComponent;
import yogi.common.util.YogiUtils;
import yogi.lendplace.LendplaceModel;

@Service("adminLendplaceService")
public class AdminLendplaceServiceImpl implements AdminLendplaceService {
	
	@Resource(name="adminLendplaceDAO")
	private AdminLendplaceDAO lendplaceDAO;
	
//	@Autowired
//	private FileUploadComponent fileUploadComp;

	@Override
	public void insertPlace (LendplaceModel lendplaceModel) throws Exception {
		// TODO Auto-generated method stub
		
//		String uploadFilePath = fileUploadComp.saveFile(request.getFile("file"));
//		map.put("l_rep_img", uploadFilePath);
//		map.put("l_sdate", YogiUtils.dateParse(map.get("l_sdate").toString()));
//		map.put("l_edate", YogiUtils.dateParse(map.get("l_edate").toString()));
		lendplaceDAO.insertPlace(lendplaceModel);
	}
	
	
	

}
