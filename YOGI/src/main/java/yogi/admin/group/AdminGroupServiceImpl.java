package yogi.admin.group;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("adminGroupService")
public class AdminGroupServiceImpl implements AdminGroupService{

	@Resource(name="adminGroupDao")
	private AdminGroupDao adminGroupDao;

	@Override
	public List<Map<String, Object>> selectAdminGroupList(Map<String, Object> map) throws Exception {
		return adminGroupDao.selectGroupList(map);
	}
	
	
}
