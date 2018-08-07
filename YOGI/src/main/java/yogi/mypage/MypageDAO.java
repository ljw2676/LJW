package yogi.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import yogi.common.dao.AbstractDAO;

@Repository("mypageDAO")
public class MypageDAO extends AbstractDAO{

	public List<Map<String, Object>> selectPlacebookHistory(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectList("mypage.placebookHistory", map);
	}

}
