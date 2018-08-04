package yogi.admin.lendplace;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import yogi.lendplace.LendplaceModel;

public interface AdminLendplaceService {

	public void insertPlace(LendplaceModel lendplaceModel) throws Exception;

}
