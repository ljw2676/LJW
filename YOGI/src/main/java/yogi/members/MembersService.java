package yogi.members;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

public interface MembersService {
	public void insertMember(MembersModel model,  HttpServletRequest request) throws Exception;
	public int checkId(String id);
	public MembersModel loginCheck(MembersModel model, HttpServletRequest request);

}
