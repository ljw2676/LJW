package yogi.mypage;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import yogi.mypage.MypageDAO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService {

	
	@Resource(name="mypageDAO")
	private MypageDAO mypageDAO;

	@Override
	public List<Map<String, Object>> selectPlacebookHistory(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mypageDAO.selectPlacebookHistory(map);
	}
	
	
}
