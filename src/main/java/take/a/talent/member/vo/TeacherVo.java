package take.a.talent.member.vo;

public class TeacherVo {
	
	private int teacherNo;
	private int memberNo;
	private int teacherExp;
	private int teacherLevel;
	private int resourceNo;
	private int teacherAccountNo;
	private int teacherApplyNo;
	
	public int getTeacherNo() {
		return teacherNo;
	}
	public void setTeacherNo(int teacherNo) {
		this.teacherNo = teacherNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getTeacherExp() {
		return teacherExp;
	}
	public void setTeacherExp(int teacherExp) {
		this.teacherExp = teacherExp;
	}
	public int getTeacherLevel() {
		return teacherLevel;
	}
	public void setTeacherLevel(int teacherLevel) {
		this.teacherLevel = teacherLevel;
	}
	public int getResourceNo() {
		return resourceNo;
	}
	public void setResourceNo(int resourceNo) {
		this.resourceNo = resourceNo;
	}
	public int getTeacherAccountNo() {
		return teacherAccountNo;
	}
	public void setTeacherAccountNo(int teacherAccountNo) {
		this.teacherAccountNo = teacherAccountNo;
	}
	public int getTeacherApplyNo() {
		return teacherApplyNo;
	}
	public void setTeacherApplyNo(int teacherApplyNo) {
		this.teacherApplyNo = teacherApplyNo;
	}
	
	@Override
	public String toString() {
		return "TeacherVo [teacherNo=" + teacherNo + ", memberNo=" + memberNo + ", teacherExp=" + teacherExp
				+ ", teacherLevel=" + teacherLevel + ", resourceNo=" + resourceNo + ", teacherAccountNo="
				+ teacherAccountNo + ", teacherApplyNo=" + teacherApplyNo + "]";
	}
	
}
