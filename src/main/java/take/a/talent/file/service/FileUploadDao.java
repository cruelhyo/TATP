package take.a.talent.file.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import take.a.talent.member.controller.MemberRestController;

@Repository 
public class FileUploadDao implements FileUploadDaoInterface {

	private static final Logger logger = LoggerFactory.getLogger(MemberRestController.class);
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	@Override
	public void insertPortfolioFile(FileUploadVo fileUploadVo) {
		logger.info("FundingDao의 insertPortfolioFile호출 성공");
		
		sqlSessionTemplate.insert("take.a.talent.file.service.FileUploadMapper.fileUpload", fileUploadVo);
		
	}
	
	
}
