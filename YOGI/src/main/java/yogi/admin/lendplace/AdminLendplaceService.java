package yogi.admin.lendplace;

import java.util.Map;



import yogi.lendplace.LendplaceModel;

public interface AdminLendplaceService {

	public void insertPlace(LendplaceModel lendplaceModel) throws Exception;

	public void deletePlace(Map<String, Object> map) throws Exception;


}

