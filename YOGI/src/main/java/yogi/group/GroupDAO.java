package yogi.group;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import yogi.common.dao.AbstractDAO;
import yogi.group.GroupModel;

@Repository("groupDAO")
public class GroupDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectGroupList(Map<String, Object> map) {
		return  (List<Map<String, Object>>) selectList("group.group_select_all",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectGroupDetail(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("group.selectGroupDetail",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectLikeitExist(Map<String, Object> map) {
		return (Map<String, Object>)selectOne("group.selectLikeitExist",map);
	}
	
	public void insertLikeit(Map<String, Object> map) {
		insert("group.insertLikeit", map);
	}
	
	public void deleteLikeit(Map<String, Object> map) {
		delete("group.deleteLikeit", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectGroupEnrollExist(Map<String, Object> map) {
		return (Map<String, Object>)selectOne("group.selectGroupEnrollExist",map);
	}
	
	public void insertGroupEnroll(Map<String, Object> map) {
		insert("group.insertGroupEnroll", map);
	}

	public void deleteGroupEnroll(Map<String, Object> map) {
		delete("group.deleteGroupEnroll", map);
	}
	
	public void plusGrade(Map<String, Object> map) {
		update("group.plusGrade", map);
	}
	
	public void minusGrade(Map<String, Object> map) {
		update("group.minusGrade", map);
	}
	
	public void plusCrp(Map<String, Object> map) {
		update("group.plusCrp", map);
	}
	
	public void minusCrp(Map<String, Object> map) {
		update("group.minusCrp", map);
	}
	
	public void insertCmt(Map<String,Object> map) {
		insert("group.insertCmt", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCmtList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("group.selectCmtList",map);
	}
	
	public void insertGroup(GroupModel group) {
		insert("group.insertGroup", group);
	}
	
	public void modifyGroup(Map<String, Object> map) {
		System.out.println("groupModify:dao 실행");
		update("group.modifyGroup", map);
	}
	
	public void insertCmtRep(Map<String, Object> map) {
		insert("group.insertCmtRep", map);
	}
	
	public void updateReplyStep(Map<String, Object> map) {
		update("group.updateReplyStep", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> groupEnrollList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("group.groupEnrollList",map);
	}
	
	public String deleteFileName(String str) {
		return (String) selectOne("selectFileName", str);
	}
	
	public void modifyGroupExceptFile(Map<String, Object> map) {
		update("group.modifyGroupExceptFile", map);
	}

	public void inactivateGroup(Map<String, Object> map) {
		update("group.inactivateGroup", map);
		
	}
	
	public void insertGroupExceptFile(GroupModel group) {
		insert("group.insertGroupExceptFile", group);
	}
	
	public String selectGroupAddr(String str) {
		return (String) selectOne("selectGroupAddr", str);
	}
	
	public String selectGroupPlace(String str) {
		return (String) selectOne("selectGroupPlace", str);
	}
	

}
