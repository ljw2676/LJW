package yogi.admin.lendplace;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import yogi.admin.lendplace.LendplaceDAO;
import yogi.common.util.FileUploadComponent;
import yogi.common.util.YogiUtils;

@Service("lendplaceService")
public class LendplaceServiceImpl implements LendplaceService {
	
	@Resource(name="lendplaceDAO")
	private LendplaceDAO lendplaceDAO;
	
	@Autowired
	private FileUploadComponent fileUploadComp;

	@Override
	public void insertPlace (Map<String, Object> map, MultipartHttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		
		String uploadFilePath = fileUploadComp.saveFile(request.getFile("file"));
		map.put("l_rep_img", uploadFilePath);
		map.put("l_sdate", YogiUtils.dateParse(map.get("l_sdate").toString()));
		map.put("l_edate", YogiUtils.dateParse(map.get("l_edate").toString()));
		lendplaceDAO.insertPlace(map);
	}
	
	
	

}
