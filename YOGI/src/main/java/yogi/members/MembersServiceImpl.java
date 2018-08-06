package yogi.members;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service("membersService")
public class MembersServiceImpl implements MembersService{
	
	@Resource(name="membersDAO")
	private MembersDAO membersDAO;
	
	
	@Override
	public void insertMember(MembersModel model, HttpServletRequest request) throws Exception{
		System.out.println("서비스 : " + model.getM_name());
		membersDAO.insertMember(model);
	}
	
	@Override
	public int checkId(String id) {
		return membersDAO.idCheck(id);
	}


	@Override
	public MembersModel loginCheck(MembersModel model, HttpServletRequest request) {
		membersDAO.loginCheck(model);
		return (MembersModel)membersDAO.loginCheck(model);
	}
	
}
