package take.a.talent.filecontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import take.a.talent.member.controller.MemberRestController;

@Controller
public class AppleControlle {

	private static final Logger logger = LoggerFactory.getLogger(MemberRestController.class);
	// 펀딩 보고서 업로드 
		@RequestMapping(value = "/addfundingfile", method = RequestMethod.POST)
		public String addFundingFile(Model model, Locale locale, MultipartHttpServletRequest request
				, MultipartFile uploadFile, @RequestParam("fileFdCode") int fdCode, HttpServletResponse response) throws IOException {
			logger.info("FundingController의 addFundingFile호출 성공");
			logger.info("fileFdCode : "+fdCode);
			logger.info("filename : "+uploadFile.getOriginalFilename());
			logger.info("filesize : "+uploadFile.getSize());
			
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
	    		 return "pms/companyuser/myfundingposterimg";
			} else {
				// 10MB 이하
				logger.info("컨트롤러 용량비교 확인 ");
				//리턴값으로 업로드된 경로+파일명을 가져온다.
				/*String result = fileutil.fileUpload(request, uploadFile);
				log.debug("result : "+result);
				//업로드된 경로+파일명 그리고 나머지 정보를 DB에 저장해줌
				service.addFundingFile(uploadFile, result, fdCode);*/
				return "redirect:/";
			}
		}
	
}
