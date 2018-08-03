package yogi.group;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import yogi.group.GroupModel;

@Repository
public class GroupDAO {
	
	@Resource
	private SqlSessionTemplate sqlSession;

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectGroupList(Map<String, Object> map) {
		return sqlSession.selectList("group.group_select_all",map);
	}

}
