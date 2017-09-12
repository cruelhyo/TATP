package take.a.talent.filecontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import take.a.talent.file.service.FileService;
import take.a.talent.member.controller.MemberRestController;
import take.a.talent.member.service.MemberServiceInterface;
import take.a.talent.util.FileUtil;

@Controller
public class FileController {

	private static final Logger logger = LoggerFactory.getLogger(MemberRestController.class);
	
	@Autowired
    private FileUtil fileutil;
	private FileService fileService;
	
	// 펀딩 보고서 업로드 
		@RequestMapping(value = "/addfundingfile.pms", method = RequestMethod.POST)
		public void portfolioUpload(Model model, Locale locale, MultipartHttpServletRequest request
				, MultipartFile uploadFile, @RequestParam("fileFdCode") int fdCode, HttpServletResponse response) throws IOException {
			
			logger.info("컨트롤러 portfolioUpload 호출 ");
			logger.info("fileFdCode : "+fdCode);
			logger.info("filename : "+uploadFile.getOriginalFilename());
			logger.debug("filesize : "+uploadFile.getSize());
			
			
			// 용량 제한을 10MB로 해줘서 튕겨낸다
			if(uploadFile.getSize() > 83886080){
	    		// 10MB 이상
				
	    		 response.setCharacterEncoding("UTF-8");
	             PrintWriter writer = response.getWriter();
	             writer.println("<script type='text/javascript'>");
	             writer.println("alert('용량이 10MB를 초과하였습니다');");
	             writer.println("history.back();");
	             writer.println("</script>");
	             writer.flush();
	    		 /*return "pms/companyuser/myfundingposterimg";*/
	             
	             
			} else {
				// 10MB 이하
				
				//리턴값으로 업로드된 경로+파일명을 가져온다.
				String result = fileutil.fileUpload(request, uploadFile);
				logger.info("result:"+result);
				//업로드된 경로+파일명 그리고 나머지 정보를 DB에 저장해줌
				fileService.addPortFolioFile(uploadFile, result, fdCode);
				return /*"redirect:/fundingfilelistpage.pms"*/; //여기는 포트폴리오 이미지 수정 요청한 페이지 나오면 경로 재설정
			}
		}
	
}
