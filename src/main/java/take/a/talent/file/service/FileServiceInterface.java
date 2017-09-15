package take.a.talent.file.service;

import org.springframework.web.multipart.MultipartFile;

public interface FileServiceInterface {

	void addPortfolioFile(MultipartFile uploadFile, String result);

}
