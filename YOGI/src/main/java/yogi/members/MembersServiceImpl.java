package yogi.members;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service("membersService")
public class MembersServiceImpl implements MembersService{
	
	@Resource(name="membersDAO")
	private MembersDAO membersDAO;
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlMapper;
	
	@Override
	public void insertMember(MembersModel model) {
		System.out.println("서비스 : " + model.getM_name());
		sqlMapper.insert("member.insertMember",model);
	}
	
	
}
