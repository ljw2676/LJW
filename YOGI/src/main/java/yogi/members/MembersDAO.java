package yogi.members;

import org.springframework.stereotype.Repository;

import yogi.common.dao.AbstractDAO;

@Repository("membersDAO")
public class MembersDAO extends AbstractDAO{
	
	public void insertMember(MembersModel model){
		insert("members.insertMember", model);
	}
	
	public MembersModel loginCheck(MembersModel model){
		return (MembersModel)selectOne("members.loginCheck", model);
	}
	
	public int idCheck(String id) {
		return (Integer)selectOne("members.idCheck", id);
	}
	
	public MembersModel findId(MembersModel model) {
		return (MembersModel)selectOne("members.findId", model);
	}
	
	public MembersModel findPW(MembersModel model) {
		return (MembersModel)selectOne("members.findPW", model);
	}
	
	public void resetPW(MembersModel model) {
		update("members.resetPW", model);
	}
	
	public MembersModel mInfo(int no) {
		return (MembersModel) selectOne("members.membersInfo", no);
	}
	
	public void updateMember(MembersModel model){
		System.out.println("m_fav_area : "+model.getM_fav_area());
		System.out.println("m_fav_field : "+model.getM_fav_field());
		System.out.println("m_profile : "+model.getM_profile());
		System.out.println("m_phone : "+model.getM_phone());
		System.out.println("m_password : "+model.getM_password());
		System.out.println("m_id : "+model.getM_id());
		update("members.updateMembers", model);
	}
	
	public void updateMemberExceptFile(MembersModel model){
		update("members.updateMembersExceptFile", model);
	}
	
	public void deleteMember(String name) {
		update("members.deleteMembers", name);
	}

	public String deleteFileName(int m_no) {
		return (String) selectOne("members.selectFileName", m_no);
	}

}
