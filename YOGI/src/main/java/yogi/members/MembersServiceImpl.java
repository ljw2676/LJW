package yogi.members;

import java.util.Calendar;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service("membersService")
public class MembersServiceImpl implements MembersService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="membersDAO")
	private MembersDAO membersDAO;
	
	
	@Override
	public void insertMember(MembersModel model){
		model.setM_date(Calendar.getInstance().getTime());
		membersDAO.insertMember(model);
	}
	
	@Override
	public int checkId(String id) {
		System.out.println("Service : "+id);
		return membersDAO.idCheck(id);
	}


	@Override
	public MembersModel loginCheck(MembersModel model, HttpServletRequest request) {
		membersDAO.loginCheck(model);
		return (MembersModel)membersDAO.loginCheck(model);
	}
	
}
