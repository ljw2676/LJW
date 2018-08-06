package yogi.admin.group;

import java.util.List;
import java.util.Map;

public interface AdminGroupService {

	//모임 전체 리스트
	public List<Map<String, Object>> selectAdminGroupList(Map<String, Object> map) throws Exception;
}
