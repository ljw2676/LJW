package yogi.mypage;

import java.util.List;
import java.util.Map;

public interface MypageService {

	public List<Map<String, Object>> selectPlacebookHistory(Map<String, Object> map) throws Exception;
	
}
