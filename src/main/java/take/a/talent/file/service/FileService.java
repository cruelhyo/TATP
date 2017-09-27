package take.a.talent.file.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import take.a.talent.member.controller.MemberRestController;


@Service
public class FileService implements FileServiceInterface{

	private static final Logger logger = LoggerFactory.getLogger(MemberRestController.class);
	
	@Autowired
	private FileUploadDao fileUploadDao;
	
	
	//포트폴리오 이미지 업로드
	@Override
	public void addPortfolioFile(MultipartFile uploadFile, String result) {
		logger.info("FileService addPortfolioFile 호출  ");
		
		String oriFileName = uploadFile.getOriginalFilename();
		String oirFileExtension = oriFileName.substring(oriFileName.lastIndexOf("."));
		int FileSize = (int) uploadFile.getSize();
		
		
		logger.info("fdFileName : "+ oriFileName);
		logger.info("fdFileExtension : "+ oirFileExtension);
		logger.info("fdFileSize : "+ FileSize);
		
		FileUploadVo fileUploadVo = new FileUploadVo(); //받아온 값들을 FileUploadVO에 넣고 dao를 호출해 db에 저장할거임
		fileUploadVo.setOriFileName(oriFileName);
		fileUploadVo.setOirFileExtension(oirFileExtension);
		fileUploadVo.setFileSize(FileSize);
		fileUploadVo.setFileUploadName(result);
		
		fileUploadDao.insertPortfolioFile(fileUploadVo);
		
	}

}
