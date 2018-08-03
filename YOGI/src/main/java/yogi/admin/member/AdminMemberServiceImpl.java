package yogi.admin.member;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yogi.members.MembersDAO;


@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService{
	
	@Resource(name="adminMemberDao")
	private AdminMemberDao adminMemberDao;
	
	@Override
	public List<Map<String, Object>> list(Map<String, Object> map) {
		return adminMemberDao.selectMemberList(map);
	}

	@Override
	public List<Map<String, Object>> searchList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void memberInactive(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

}
