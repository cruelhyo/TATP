package take.a.talent.file.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.servlet.ModelAndView;

import take.a.talent.file.service.FileServiceInterface;
import take.a.talent.member.controller.MemberRestController;
import take.a.talent.util.FileUtil;

@Controller
public class FileUploadController {
 
	private static final Logger logger = LoggerFactory.getLogger(MemberRestController.class);
	
	@Autowired
	private FileServiceInterface fileServiceInterface ;
	
	@Autowired
	private FileUtil fileUtil ;
	
 
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String UploadFile(Model model, Locale locale, MultipartHttpServletRequest request
			, MultipartFile uploadFile, HttpServletResponse response) throws IOException {
		logger.info("FileUploadContorller UploadFile 호출완료  ");
		logger.info("filename : "+uploadFile.getOriginalFilename());
		logger.info("filesize : "+uploadFile.getSize());
		
		// 용량 제한을 10MB로 해줘서 튕겨낸다
		if(uploadFile.getSize() > 83886080){
    		// 10MB 이상
			logger.info("if문 실행  ");
    		 response.setCharacterEncoding("UTF-8");
             PrintWriter writer = response.getWriter();
             writer.println("<script type='text/javascript'>");
             writer.println("alert('용량이 10MB를 초과하였습니다');");
             writer.println("history.back();");
             writer.println("</script>");
             writer.flush();
    		 /*return "pms/companyuser/myfundingposterimg";*/ //merge후 페이지 변경
             return "redirect:/";
		} else {
			// 10MB 이하
			logger.info("else문 실행  ");
			//리턴값으로 업로드된 경로+파일명을 가져온다.
			String result = fileUtil.fileUpload(request, uploadFile);
			logger.info("result : "+result);
			//업로드된 경로+파일명 그리고 나머지 정보를 DB에 저장해줌
			fileServiceInterface.addPortfolioFile(uploadFile, result);
			/*return "redirect:/fundingfilelistpage.pms";*/ //merge후 페이지 변경
			
			return "redirect:/";
		}
	}
	
	
	// 펀딩파일 다운로드 요청
		@RequestMapping(value = "/calldownload.pms")
		public ModelAndView fileDownload(@RequestParam("fileFullPath") String fileFullPath, 
		            HttpServletRequest request, HttpServletResponse response) throws Exception {
			logger.info("FileUploadContorller addFundingFile 호출완료  ");
			logger.info("fileFullPath : "+ fileFullPath);
		    File downloadFile = new File(fileFullPath);
		    if(!downloadFile.canRead()){
		        throw new Exception("File can't read(파일을 찾을 수 없습니다)");
		    }
		    return new ModelAndView("fileDownloadView", "downloadFile",downloadFile);
		}


	
}
