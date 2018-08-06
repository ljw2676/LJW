package yogi.admin.report;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("adminReportService")
public class AdminReportServiceImpl implements AdminReportService{
	
	@Resource(name="adminReportDao")
	private AdminReportDao adminReportDao;

	@Override
	public List<Map<String, Object>> selectAdminReportList(Map<String, Object> map) throws Exception {
		return adminReportDao.selectReportList(map);
	}

}
