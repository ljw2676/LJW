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
		System.out.println("DAO" + id);
		System.out.println((Integer)selectOne("test.idCheck", id));
		return (Integer)selectOne("test.idCheck", id);
	}

}
