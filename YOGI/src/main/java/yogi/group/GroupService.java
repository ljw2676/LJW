package yogi.group;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import yogi.group.GroupModel;
import yogi.group.GroupSearchModel;

public interface GroupService {
	
	List<Map<String, Object>> selectGroupList(Map<String, Object> map) throws Exception;	
	
}
