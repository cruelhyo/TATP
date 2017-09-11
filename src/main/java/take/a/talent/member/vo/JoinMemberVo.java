package take.a.talent.member.vo;

public class JoinMemberVo
{
	private String memberId;
	private String memberPassword;
	private String memberName;
	private String memberGender;
	private int memberAge;
	private String memberBirthday;
	private String memberMailNumber;
	private String memberAddress;
	private String memberPhone;
	private String memberEmail;
	private String memberMailagreement;
	private String memberNickname;
	private String memberHobby;
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}
	public int getMemberAge() {
		return memberAge;
	}
	public void setMemberAge(int memberAge) {
		this.memberAge = memberAge;
	}
	public String getMemberBirthday() {
		return memberBirthday;
	}
	public void setMemberBirthday(String memberBirthday) {
		this.memberBirthday = memberBirthday;
	}
	public String getMemberMailNumber() {
		return memberMailNumber;
	}
	public void setMemberMailNumber(String memberMailNumber) {
		this.memberMailNumber = memberMailNumber;
	}
	public String getMemberAddress() {
		return memberAddress;
	}
	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberMailagreement() {
		return memberMailagreement;
	}
	public void setMemberMailagreement(String memberMailagreement) {
		this.memberMailagreement = memberMailagreement;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public String getMemberHobby() {
		return memberHobby;
	}
	public void setMemberHobby(String memberHobby) {
		this.memberHobby = memberHobby;
	}
	@Override
	public String toString() {
		return "JoinMemberVo [memberId=" + memberId + ", memberPassword=" + memberPassword + ", memberName="
				+ memberName + ", memberGender=" + memberGender + ", memberAge=" + memberAge + ", memberBirthday="
				+ memberBirthday + ", memberMailNumber=" + memberMailNumber + ", memberAddress=" + memberAddress
				+ ", memberPhone=" + memberPhone + ", memberEmail=" + memberEmail + ", memberMailagreement="
				+ memberMailagreement + ", memberNickname=" + memberNickname + ", memberHobby=" + memberHobby + "]";
	}

	
}