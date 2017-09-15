package take.a.talent.filecontroller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import take.a.talent.member.controller.MemberRestController;

@RestController
public class FileUploadController {
 
	private static final Logger logger = LoggerFactory.getLogger(MemberRestController.class);
	
	
	
 
	// simplefileuploadform으로 받아와서 로컬저장만 되는 상태
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(MultipartHttpServletRequest request, ModelMap model, HttpServletResponse response ) throws IllegalStateException, IOException{
	Map<String, MultipartFile> files = request.getFileMap();
	CommonsMultipartFile cmf = (CommonsMultipartFile) files.get("uploadFile");
	// 경로
	String path ="D:/TATProject/resource/"+cmf.getOriginalFilename(); //업로드 파일 저장경로 지정

	File file = new File(path);

	
	
	logger.info("업로드 컨트롤러 호출 완료  ");

	try {
	// insert method
		logger.info("try 실행완료  ");
	
	if(files.size() > 838860800 ){
	// 10MB 이상
		logger.info("if 실행완료  ");
		model.addAttribute("resMessage", "업로드 실패");  
		 response.setCharacterEncoding("UTF-8");
	/*	PrintWriter writer = response.getWriter();
     writer.println("<script type='text/javascript'>");
     writer.println("alert('용량이 10MB를 초과하였습니다');");
     writer.println("history.back();");
     writer.println("</script>");
     writer.flush();*/
	 return "redirect:/";
} else {
	// 10MB 이하일 경우 업로드한다.
	
	// 파일 업로드 처리 완료.
	cmf.transferTo(file);
	
	logger.info("else 실행완료  ");
	model.addAttribute("resMessage", "업로드 성공"); 
	//리턴값으로 업로드된 경로+파일명을 가져온다.
/*	String result = fileutil.fileUpload(request, uploadFile);
	log.debug("result : "+result);
	//업로드된 경로+파일명 그리고 나머지 정보를 DB에 저장해줌
	service.addFundingFile(uploadFile, result, fdCode);*/
	return "redirect:/";
}
	
	} catch (Exception e) {
	
	}
	return "url";
	}

	
}
