package yogi.main;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import yogi.common.dao.AbstractDAO;
import yogi.members.MembersModel;

@Repository ("mainDAO")
public class MainDAO extends AbstractDAO{
	public MembersModel getInterest(String id) {
		return (MembersModel)selectOne("test.check", id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> test(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("test.test", map);
	}
	

}
