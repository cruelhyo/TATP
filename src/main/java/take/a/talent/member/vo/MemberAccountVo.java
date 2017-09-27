package take.a.talent.member.vo;

public class MemberAccountVo {
	private int teacherAccountNo;
	private int bankNo;
	private int accountNumber;
	private String accountHolderName;
	
	public int getTeacherAccountNo() {
		return teacherAccountNo;
	}
	public void setTeacherAccountNo(int teacherAccountNo) {
		this.teacherAccountNo = teacherAccountNo;
	}
	public int getBankNo() {
		return bankNo;
	}
	public void setBankNo(int bankNo) {
		this.bankNo = bankNo;
	}
	public int getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(int accountNumber) {
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
