package yogi.members;

import java.util.Map;

import org.springframework.stereotype.Repository;

import yogi.common.dao.AbstractDAO;

@Repository("membersDAO")
public class MembersDAO extends AbstractDAO{
	
	public void insertMember(MembersModel model){
		System.out.println("DAO : " + model.getM_name());
		insert("test.insertMember", model);
	}
	
	public MembersModel loginCheck(MembersModel model){
		return (MembersModel)selectOne("test.loginCheck", model);
	}
	
	public int idCheck(String id) {
		return (Integer)selectOne("test.idCheck", id);
	}

}
