package yogi.admin.member;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import yogi.members.MembersDAO;


@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService{
	
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
		System.out.println("adminMemberService 실행");
		System.out.println("커맨드맵 : "+map.get("M_NO"));
		adminMemberDao.inactivateMember(map);
		
	}
	
	@Override
	public void activateMember(Map<String, Object> map) {
		System.out.println("adminMemberService 실행");
		System.out.println("커맨드맵 : "+map.get("M_NO"));
		adminMemberDao.activateMember(map);
		
	}

}
