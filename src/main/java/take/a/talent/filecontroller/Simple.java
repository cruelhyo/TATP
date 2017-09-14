package take.a.talent.filecontroller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@RestController
public class Simple {

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(MultipartHttpServletRequest request, ModelMap model) throws IllegalStateException, IOException{
	Map<String, MultipartFile> files = request.getFileMap();
	CommonsMultipartFile cmf = (CommonsMultipartFile) files.get("uploadFile");
	// 경로
	String path ="D:/TATProject/resource"+cmf.getOriginalFilename(); // TATPropject 뒤에 / 붙이고 쓰면  저장되는 파일이름에 추가된다.(resource+원래 파일이름)

	File file = new File(path);
	// 파일 업로드 처리 완료.
	cmf.transferTo(file);

	try {
	// insert method
	model.addAttribute("resMessage", "업로드 성공"); 
	} catch (Exception e) {
	model.addAttribute("resMessage", "업로드 실패"); 
	}
	return "url";
	}

	
}
