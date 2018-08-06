package yogi.admin.group;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import yogi.common.dao.AbstractDAO;

@Repository("adminGroupDao")
public class AdminGroupDao extends AbstractDAO{

	//멤버 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectGroupList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.selectAdminGroupList", map);
	}
}
