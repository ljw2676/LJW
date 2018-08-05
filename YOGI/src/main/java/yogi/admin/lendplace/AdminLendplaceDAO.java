package yogi.admin.lendplace;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import yogi.common.dao.AbstractDAO;
import yogi.lendplace.LendplaceModel;

@Repository("adminLendplaceDAO")
public class AdminLendplaceDAO extends AbstractDAO{

	public void insertPlace(LendplaceModel lendplaceModel) {
		insert("lendplace.insertLendplace", lendplaceModel);
	}

	public void deletePlace(Map<String, Object> map) {
		// TODO Auto-generated method stub
		delete("lendplace.deleteLendplace",map);
		
	}
	
}
