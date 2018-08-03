package yogi.admin.lendplace;

import java.util.Map;

import org.springframework.stereotype.Repository;

import yogi.common.dao.AbstractDAO;

@Repository("adminLendplaceDAO")
public class AdminLendplaceDAO extends AbstractDAO{

	public void insertPlace(Map<String, Object> map) {
		insert("lendplace.lendplace_insert", map);
	}
	
}
