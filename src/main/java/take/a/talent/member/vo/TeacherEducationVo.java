package take.a.talent.member.vo;

public class TeacherEducationVo
{
	private int teacherEducationNo;
	private int teacherNo;
	private int teacherEducationClassificationNo;
	private String teacherEducationClassificationName;
	private int teacherEducationStatusNo;
	private String teacherEducationStatusName;
	private String teacherEducationSchoolName;
	private String teacherEducationMajor;
	private String teacherEducationAdmission;
	private String teacherEducationGraduation;
	
	public int getTeacherEducationNo()
	{
		return teacherEducationNo;
	}
	public void setTeacherEducationNo(int teacherEducationNo)
	{
		this.teacherEducationNo = teacherEducationNo;
	}
	public int getTeacherNo()
	{
		return teacherNo;
	}
	public void setTeacherNo(int teacherNo)
	{
		this.teacherNo = teacherNo;
	}
	public int getTeacherEducationClassificationNo()
	{
		return teacherEducationClassificationNo;
	}
	public void setTeacherEducationClassificationNo(int teacherEducationClassificationNo)
	{
		this.teacherEducationClassificationNo = teacherEducationClassificationNo;
	}
	public String getTeacherEducationClassificationName()
	{
		return teacherEducationClassificationName;
	}
	public void setTeacherEducationClassificationName(String teacherEducationClassificationName)
	{
		this.teacherEducationClassificationName = teacherEducationClassificationName;
	}
	public int getTeacherEducationStatusNo()
	{
		return teacherEducationStatusNo;
	}
	public void setTeacherEducationStatusNo(int teacherEducationStatusNo)
	{
		this.teacherEducationStatusNo = teacherEducationStatusNo;
	}
	public String getTeacherEducationStatusName()
	{
		return teacherEducationStatusName;
	}
	public void setTeacherEducationStatusName(String teacherEducationStatusName)
	{
		this.teacherEducationStatusName = teacherEducationStatusName;
	}
	public String getTeacherEducationSchoolName()
	{
		return teacherEducationSchoolName;
	}
	public void setTeacherEducationSchoolName(String teacherEducationSchoolName)
	{
		this.teacherEducationSchoolName = teacherEducationSchoolName;
	}
	public String getTeacherEducationMajor()
	{
		return teacherEducationMajor;
	}
	public void setTeacherEducationMajor(String teacherEducationMajor)
	{
		this.teacherEducationMajor = teacherEducationMajor;
	}
	public String getTeacherEducationAdmission()
	{
		return teacherEducationAdmission;
	}
	public void setTeacherEducationAdmission(String teacherEducationAdmission)
	{
		this.teacherEducationAdmission = teacherEducationAdmission;
	}
	public String getTeacherEducationGraduation()
	{
		return teacherEducationGraduation;
	}
	public void setTeacherEducationGraduation(String teacherEducationGraduation)
	{
		this.teacherEducationGraduation = teacherEducationGraduation;
	}
	
	@Override
	public String toString()
	{
		return "TeacherEducationAndClassificationAndStatusVo [teacherEducationNo=" + teacherEducationNo + ", teacherNo="
				+ teacherNo + ", teacherEducationClassificationNo=" + teacherEducationClassificationNo
				+ ", teacherEducationClassificationName=" + teacherEducationClassificationName
				+ ", teacherEducationStatusNo=" + teacherEducationStatusNo + ", teacherEducationStatusName="
				+ teacherEducationStatusName + ", teacherEducationSchoolName=" + teacherEducationSchoolName
				+ ", teacherEducationMajor=" + teacherEducationMajor + ", teacherEducationAdmission="
				+ teacherEducationAdmission + ", teacherEducationGraduation=" + teacherEducationGraduation + "]";
	}
	
}
