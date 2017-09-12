package take.a.talent.file.service;

import org.springframework.web.multipart.MultipartFile;

public interface FileServiceInterface {

	void addPortFolioFile(MultipartFile uploadFile, String result, int fdCode);

}
