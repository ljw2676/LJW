package yogi.common.util;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import yogi.common.common.YogiConstants;

@Component
public class FileUploadComponent {
	private final String filePath = YogiConstants.UPLOAD_PATH_IMAGE;

	public String saveFile(MultipartFile multipartFile) throws IllegalStateException, IOException{
		if(multipartFile == null || multipartFile.isEmpty()){
			return null;
		}

		File file = new File(filePath);
		if(file.exists() == false){
			file.mkdirs();
		}
		String generatePath = System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename();
    	file = new File(filePath+generatePath);
    	multipartFile.transferTo(file);
    	return file.getAbsolutePath();
	}

}
