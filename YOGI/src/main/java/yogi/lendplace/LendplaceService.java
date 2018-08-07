package yogi.lendplace;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface LendplaceService {

	List<Map<String, Object>> selectLendplaceList(Map<String, Object> map) throws Exception;

	Map<String, Object> selectLendplaceDetail(Map<String, Object> map) throws Exception;

//	public void updateLendplace(Map<String, Object> map) throws Exception;
	
//	void insertReview(Map<String, Object> map) throws Exception;
//	
//	void deleteReview(Map<String, Object> map) throws Exception;
}