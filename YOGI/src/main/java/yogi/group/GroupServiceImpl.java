package yogi.group;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import yogi.group.GroupDAO;

@Service
public class GroupServiceImpl implements GroupService {
	
	@Resource
	private GroupDAO groupDAO;
	
	@Override
	public List<Map<String, Object>> selectGroupList(Map<String, Object> map) throws Exception {

		List<Map<String, Object>> resultList = groupDAO.selectGroupList(map);

		return resultList;
	}

}
