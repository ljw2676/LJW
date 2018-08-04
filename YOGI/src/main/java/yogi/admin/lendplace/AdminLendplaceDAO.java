package yogi.admin.lendplace;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import yogi.common.dao.AbstractDAO;
import yogi.lendplace.LendplaceModel;

@Repository("adminLendplaceDAO")
public class AdminLendplaceDAO extends AbstractDAO{

	public void insertPlace(LendplaceModel lendplaceModel) {
		insert("lendplace.insertLendplace", lendplaceModel);
	}
	
}
