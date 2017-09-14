package take.a.talent.filecontroller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Locale;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.ServletRegistration;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.DispatcherServlet;

import take.a.talent.file.service.FileService;
import take.a.talent.member.controller.MemberRestController;
import take.a.talent.member.service.MemberServiceInterface;
import take.a.talent.util.FileUtil;

@Controller
public class FileController {

	private static final Logger logger = LoggerFactory.getLogger(MemberRestController.class);
	
	
	@RequestMapping(value = "/fileupload" , method=RequestMethod.POST)
    public String fileUp(MultipartHttpServletRequest multi) {
         
		logger.info("컨트롤러 호출 맨 ");
		
		
        // 저장 경로 설정
        String root = multi.getSession().getServletContext().getRealPath("/"); // 테스트 후 D:\\TATProject\resource 로 절대경로 변경 
        String path = root+"resources/upload/";
         
        String newFileName = ""; // 업로드 되는 파일명
         
        File dir = new File(path);
        if(!dir.isDirectory()){
            dir.mkdir();
        }
         
        Iterator<String> files = multi.getFileNames();
        while(files.hasNext()){
            String uploadFile = files.next();
                         
            MultipartFile mFile = multi.getFile(uploadFile);
            String fileName = mFile.getOriginalFilename();
            System.out.println("실제 파일 이름 : " +fileName);
            newFileName = System.currentTimeMillis()+"."
                    +fileName.substring(fileName.lastIndexOf(".")+1);
             
            try {
                mFile.transferTo(new File(path+newFileName));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
         
        System.out.println("id : " + multi.getParameter("id"));
        System.out.println("pw : " + multi.getParameter("pw"));
         
        return "form";
    }
	
}
