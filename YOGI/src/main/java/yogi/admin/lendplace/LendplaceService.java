package yogi.admin.lendplace;

import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface LendplaceService {

	void insertPlace(Map<String, Object> map, MultipartHttpServletRequest request) throws Exception;

}
