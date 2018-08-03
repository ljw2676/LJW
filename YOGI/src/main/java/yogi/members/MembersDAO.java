package yogi.members;

import java.util.Map;

import org.springframework.stereotype.Repository;

import yogi.common.dao.AbstractDAO;

@Repository("membersDAO")
public class MembersDAO extends AbstractDAO{
	
	public void insertBoard(MembersModel model) throws Exception{
		System.out.println("DAO : " + model.getM_name());
		insert("test.insertMember", model);
	}

}
