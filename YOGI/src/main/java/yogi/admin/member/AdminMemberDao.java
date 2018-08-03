package yogi.admin.member;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import yogi.common.dao.AbstractDAO;

@Repository("adminMemberDao")
public class AdminMemberDao extends AbstractDAO{

	@Resource
	private SqlSessionTemplate sqlSession;

	//멤버 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) {
		return sqlSession.selectList("admin.selectMemberList", map);
	}
}
