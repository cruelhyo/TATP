package take.a.talent.member.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import take.a.talent.member.controller.MemberRestController;

@RestController
public class SimpleController {
	private static final Logger logger = LoggerFactory.getLogger(MemberRestController.class);
	
	@RequestMapping(path = "/test-upload", method = RequestMethod.GET)
	String testUploadPage()
	{
		return "test-upload";
	}
	 
	// 업로드 처리 : POST
	@RequestMapping(path = "/test-upload", method = RequestMethod.POST)
	// 와 MultipartFile 보고 멀티파트를 자동으로 인식하는구나!!!
	String testUpload(@RequestParam("file") MultipartFile file)
	{
		logger.info("가져온 파일 확인 "+file.toString());
		if (!file.isEmpty())
		{
			try
			{
				// 디플로이 기준루트에 test-upload-path 폴더를 만들어줍니다.
				Files.copy(file.getInputStream(), Paths.get("test-upload-path", file.getOriginalFilename()));
				return "파일업로드 성공 : " + file.getOriginalFilename();
			}
			catch (IOException e)
			{
				logger.error("file upload fail", e);
				return "파일업로드 실패 로그 확인요망";
			}
		}
		else
		{
			return "파일이 없음";
		}
	}
	
	
}
