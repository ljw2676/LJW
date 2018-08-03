package yogi.admin.lendplace;

import java.util.Map;

import org.springframework.stereotype.Repository;

import yogi.common.dao.AbstractDAO;

@Repository("lendplaceDAO")
public class LendplaceDAO extends AbstractDAO{

	public void insertPlace(Map<String, Object> map) {
		insert("lendplace.lendplace_insert", map);
	}
	

}
