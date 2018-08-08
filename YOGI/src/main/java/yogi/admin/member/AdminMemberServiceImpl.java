package yogi.admin.member;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import yogi.members.MembersDAO;


@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminMemberDao")
	private AdminMemberDao adminMemberDao;
	
	@Override
	public List<Map<String, Object>> selectAdminMemberList(Map<String, Object> map) throws Exception{
		return adminMemberDao.selectMemberList(map);
	}

	@Override
	public List<Map<String, Object>> searchList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void inactivateMember(Map<String, Object> map) {
		adminMemberDao.inactivateMember(map);
		
	}
	
	@Override
	public void activateMember(Map<String, Object> map) {
		adminMemberDao.activateMember(map);
		
	}

}
