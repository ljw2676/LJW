package yogi.lendplace;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import yogi.members.MembersDAO;

@Service("lendplaceService")
public class LendplaceServiceImpl implements LendplaceService {

	@Resource(name="lendplaceDAO")
	private LendplaceDAO lendplaceDAO;
	
	@Override
	public List<Map<String, Object>> selectLendplaceList(Map<String, Object> map) throws Exception {
		return lendplaceDAO.selectLendplaceList(map);
	}

	@Override
	public Map<String, Object> selectLendplaceDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = lendplaceDAO.selectLendplaceDetail(map);
		
		return resultMap;
	}

	@Override
	public void insertLendplace(Map<String, Object> map, HttpServletRequest request) throws Exception {
		lendplaceDAO.insertLendplace(map);		
	
	
	}

//	@Override
//	public void updateLendplace(Map<String, Object> map, HttpServletRequest request) throws Exception {
//	}
//
//	@Override
//	public void insertPlacebook(Map<String, Object> map) throws Exception {
//	}
//
//	@Override
//	public void deleteLendplace(Map<String, Object> map) throws Exception {
//	}
//
//	@Override
//	public void deletePlacebook(Map<String, Object> map) throws Exception {
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
