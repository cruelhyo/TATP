package take.a.talent.util;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import take.a.talent.member.controller.MemberRestController;

@Component
public class FileUtil {
	private static final Logger logger = LoggerFactory.getLogger(MemberRestController.class);
String fileName = "";
    


// 파일 업로드 기능을 갖는 메서드   
// 리턴값으로 지정한 경로에 저장한 (path + uuid로 생성한 파일명) 을 리턴해줌
    public String fileUpload(MultipartHttpServletRequest request, MultipartFile uploadFile) {
    	logger.info("FileUtil의 fileUpload 메소드 호출 성공");
    	String path = "";
        String fileName = "";
        
        OutputStream out = null;
        PrintWriter printWriter = null;
        
        try {
            fileName = uploadFile.getOriginalFilename(); // 받아온 파일의 원래 이름을 가져옴
            byte[] bytes = uploadFile.getBytes();    // 유니코드 문자열을 인자로 지정된 캐릭터셋의 바이트 배열로 반환하는 메서드        
            
            //배포할때에
            /* path = getSaveLocation(request);*/
            
            //로컬에서 테스트할때에
            path = "D:/TATProject/resource/";
            
            logger.info("UtilFile fileUpload fileName : " + fileName);
            logger.info("UtilFile fileUpload uploadPath : " + path);
            
            File file = new File(path);
            
//          파일명이 중복으로 존재할 경우
            if (fileName != null && !fileName.equals("")) {
                if (file.exists()) {
                	// UUID 생성
                	UUID uuid = UUID.randomUUID();

//                  파일명 앞에 UUID를 붙여 파일명 중복을 방지
                    fileName = uuid + "_" + fileName;
                    
                    file = new File(path + fileName);
                }
            }
            
            logger.info("UtilFile fileUpload final fileName : " + fileName);
            logger.info("UtilFile fileUpload file : " + file);
            
            out = new FileOutputStream(file);
            logger.info("UtilFile fileUpload out : " + out);

            // 업로드를 마무리 해주는 write메서드 // 이후에 이미지일때는 썸네일로 만들어줌
            out.write(bytes);
            
            // 마임 타입은 image/jpg 형식이니 '/' 로 잘라서 [0]번째 배열의 값이 image인 것을 썸네일로 만들 것. 
            String filetype = uploadFile.getContentType();
    		String[] searchfiletype = filetype.split("/");
    		logger.info("filetype : " + searchfiletype[0]);
            // 이미지파일일때 -> 펀딩이미지 밖에 없으므로 모두 크기를 조절해서 썸네일로 만들어줌
            if(searchfiletype[0].equals("image")){
            	logger.info("업로드한 파일이 이미지파일로 인식되었습니다");
            	
            	//썸네일 가로사이즈
                int thumbnail_width = 300;
                //썸네일 세로사이즈
                int thumbnail_height = 245;     

                BufferedImage bfimage = ImageIO.read(file);
                BufferedImage bfthumbnailimage = new BufferedImage(thumbnail_width, thumbnail_height, BufferedImage.TYPE_3BYTE_BGR);
                Graphics2D graphic = bfthumbnailimage.createGraphics();
                graphic.drawImage(bfimage, 0, 0, thumbnail_width, thumbnail_height, null);
                // 다시 원본의 경로에 만들어준 썸네일을 덮어쓴다
                ImageIO.write(bfthumbnailimage, "jpg", file);
                logger.info("썸네일 생성완료");

            }
      
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        
        return path + fileName; //리턴값으로 파일이 저장될 경로와 파일이름을 합쳐서 보냄
   }
    
//  	업로드 파일 저장 경로 얻는 메소드
    private String getSaveLocation(MultipartHttpServletRequest request) {
        
        String uploadPath = request.getSession().getServletContext().getRealPath("/");
        String attachPath = "resources/files/";
       
        logger.info("UtilFile getSaveLocation path : " + uploadPath + attachPath);
        return uploadPath + attachPath;
	}
    
    
// 		파일 삭제 메소드
    
    public String deleteFile(String fileFullPath){
    	logger.info("FileUtil의 deleteFile호출 성공");
    	logger.info("fileFullPath : " + fileFullPath);
    	File file = new File(fileFullPath);
    	if(file.exists()) {
    	      file.delete();
    	      return "파일 삭제완료";
    	}
    	return "파일 삭제안됨";
    }
}
