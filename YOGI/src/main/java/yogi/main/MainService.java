package yogi.main;

import java.util.List;
import java.util.Map;

import yogi.members.MembersModel;

public interface MainService {
	public MembersModel getInterest(String id);
	public List<Map<String, Object>> test(Map<String, Object> map)throws Exception;
}
