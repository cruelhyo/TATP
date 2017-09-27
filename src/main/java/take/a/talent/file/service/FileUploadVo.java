package take.a.talent.file.service;

public class FileUploadVo {

	private String oriFileName;
	private String oirFileExtension;
	private int fileSize;
	private String fileUploadName;
	
	public String getOriFileName() {
		return oriFileName;
	}
	public void setOriFileName(String oriFileName) {
		this.oriFileName = oriFileName;
	}
	public String getOirFileExtension() {
		return oirFileExtension;
	}
	public void setOirFileExtension(String oirFileExtension) {
		this.oirFileExtension = oirFileExtension;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileUploadName() {
		return fileUploadName;
	}
	public void setFileUploadName(String fileUploadName) {
		this.fileUploadName = fileUploadName;
	}
	@Override
	public String toString() {
		return "FileUploadVo [oriFileName=" + oriFileName + ", oirFileExtension=" + oirFileExtension + ", fileSize="
				+ fileSize + ", fileUploadName=" + fileUploadName + "]";
	} 
	
	
}
