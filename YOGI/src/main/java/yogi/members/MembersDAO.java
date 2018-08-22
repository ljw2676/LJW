package yogi.members;

import java.util.Map;

import org.springframework.stereotype.Repository;

import yogi.common.dao.AbstractDAO;

@Repository("membersDAO")
public class MembersDAO extends AbstractDAO{
	
	public void insertMember(MembersModel model){
		insert("test.insertMember", model);
	}
	
	public MembersModel loginCheck(MembersModel model){
		return (MembersModel)selectOne("test.loginCheck", model);
	}
	
	public int idCheck(String id) {
		return (Integer)selectOne("test.idCheck", id);
	}
	
	public MembersModel findId(MembersModel model) {
		return (MembersModel)selectOne("test.findId", model);
	}
	
	public MembersModel findPW(MembersModel model) {
		return (MembersModel)selectOne("test.findPW", model);
	}
	
	public void resetPW(MembersModel model) {
		update("test.resetPW", model);
	}
	
	public MembersModel mInfo(int no) {
		return (MembersModel) selectOne("test.membersInfo", no);
	}
	
	public void updateMember(MembersModel model){
		update("test.updateMembers", model);
	}
	public void deleteMember(String name) {
		update("test.deleteMembers", name);
	}

}
