package take.a.talent.member.vo;

public class MemberAccountVo {
	private String teacherAccountNo;
	private String bankNo;
	private String accountNumber;
	private String accountHolderName;
	public String getTeacherAccountNo() {
		return teacherAccountNo;
	}
	public void setTeacherAccountNo(String teacherAccountNo) {
		this.teacherAccountNo = teacherAccountNo;
	}
	public String getBankNo() {
		return bankNo;
	}
	public void setBankNo(String bankNo) {
		this.bankNo = bankNo;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getAccountHolderName() {
		return accountHolderName;
	}
	
	public void setAccountHolderName(String accountHolderName) {
		this.accountHolderName = accountHolderName;
	}
	@Override
	public String toString() {
		return "MemberAccountVo [teacherAccountNo=" + teacherAccountNo + ", bankNo=" + bankNo + ", accountNumber="
				+ accountNumber + ", accountHolderName=" + accountHolderName + "]";
	}
	}
