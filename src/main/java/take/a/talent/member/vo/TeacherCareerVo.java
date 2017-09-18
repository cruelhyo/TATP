package take.a.talent.member.vo;

public class TeacherCareerVo
{
	private int teacherCareerNo;
	private int teacherNo;
	private String teacherCareerCompany;
	private String teacherCareerDepartment;
	private String teacherCareerPosition;
	private String teacherCareerEmploymentDate;
	private String teacherCareerLeaveDate;
	
	public int getTeacherCareerNo()
	{
		return teacherCareerNo;
	}
	public void setTeacherCareerNo(int teacherCareerNo)
	{
		this.teacherCareerNo = teacherCareerNo;
	}
	public int getTeacherNo()
	{
		return teacherNo;
	}
	public void setTeacherNo(int teacherNo)
	{
		this.teacherNo = teacherNo;
	}
	public String getTeacherCareerCompany()
	{
		return teacherCareerCompany;
	}
	public void setTeacherCareerCompany(String teacherCareerCompany)
	{
		this.teacherCareerCompany = teacherCareerCompany;
	}
	public String getTeacherCareerDepartment()
	{
		return teacherCareerDepartment;
	}
	public void setTeacherCareerDepartment(String teacherCareerDepartment)
	{
		this.teacherCareerDepartment = teacherCareerDepartment;
	}
	public String getTeacherCareerPosition()
	{
		return teacherCareerPosition;
	}
	public void setTeacherCareerPosition(String teacherCareerPosition)
	{
		this.teacherCareerPosition = teacherCareerPosition;
	}
	public String getTeacherCareerEmploymentDate()
	{
		return teacherCareerEmploymentDate;
	}
	public void setTeacherCareerEmploymentDate(String teacherCareerEmploymentDate)
	{
		this.teacherCareerEmploymentDate = teacherCareerEmploymentDate;
	}
	public String getTeacherCareerLeaveDate()
	{
		return teacherCareerLeaveDate;
	}
	public void setTeacherCareerLeaveDate(String teacherCareerLeaveDate)
	{
		this.teacherCareerLeaveDate = teacherCareerLeaveDate;
	}
	@Override
	public String toString()
	{
		return "TeacherCareer [teacherCareerNo=" + teacherCareerNo + ", teacherNo=" + teacherNo
				+ ", teacherCareerCompany=" + teacherCareerCompany + ", teacherCareerDepartment="
				+ teacherCareerDepartment + ", teacherCareerPosition=" + teacherCareerPosition
				+ ", teacherCareerEmploymentDate=" + teacherCareerEmploymentDate + ", teacherCareerLeaveDate="
				+ teacherCareerLeaveDate + "]";
	}
	
}
