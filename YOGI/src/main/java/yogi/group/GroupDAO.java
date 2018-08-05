package yogi.group;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import yogi.group.GroupModel;
import yogi.group.GroupSearchModel;

@Repository
public class GroupDAO{

	@Resource
	private SqlSessionTemplate sqlSession;
	private GroupSearchModel sModel;
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectGroupList(Map<String, Object> map) {
		return sqlSession.selectList("group.group_select_all",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchGroupList(String query) {
		return sqlSession.selectList("group.group_search",query);
	}

}
