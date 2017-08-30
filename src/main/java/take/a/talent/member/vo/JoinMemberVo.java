package take.a.talent.member.vo;

public class JoinMemberVo
{
	private String memberId;
	private String memberPassword;
	private String memberName;
	private String memberGender;
	private String memberSocialNumber;
	private String memberAddress;
	private String memberAddressDetail;
	private String memberPhone;
	private String memberEmail;
	private String memberAgreement;
	
	
	public String getMemberId()
	{
		return memberId;
	}
	public void setMemberId(String memberId)
	{
		this.memberId = memberId;
	}
	public String getMemberPassword()
	{
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword)
	{
		this.memberPassword = memberPassword;
	}
	public String getMemberName()
	{
		return memberName;
	}
	public void setMemberName(String memberName)
	{
		this.memberName = memberName;
	}
	public String getMemberGender()
	{
		return memberGender;
	}
	public void setMemberGender(String memberGender)
	{
		this.memberGender = memberGender;
	}
	public String getMemberSocialNumber()
	{
		return memberSocialNumber;
	}
	public void setMemberSocialNumber(String memberSocialNumber)
	{
		this.memberSocialNumber = memberSocialNumber;
	}
	public String getMemberAddress()
	{
		return memberAddress;
	}
	public void setMemberAddress(String memberAddress)
	{
		this.memberAddress = memberAddress;
	}
	public String getMemberAddressDetail()
	{
		return memberAddressDetail;
	}
	public void setMemberAddressDetail(String memberAddressDetail)
	{
		this.memberAddressDetail = memberAddressDetail;
	}
	public String getMemberPhone()
	{
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone)
	{
		this.memberPhone = memberPhone;
	}
	public String getMemberEmail()
	{
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail)
	{
		this.memberEmail = memberEmail;
	}
	public String getMemberAgreement()
	{
		return memberAgreement;
	}
	public void setMemberAgreement(String memberAgreement)
	{
		this.memberAgreement = memberAgreement;
	}
	@Override
	public String toString()
	{
		return "JoinMemberVo [memberId=" + memberId + ", memberPassword=" + memberPassword + ", memberName="
				+ memberName + ", memberGender=" + memberGender + ", memberSocialNumber=" + memberSocialNumber
				+ ", memberAddress=" + memberAddress + ", memberAddressDetail=" + memberAddressDetail + ", memberPhone="
				+ memberPhone + ", memberEmail=" + memberEmail + ", memberAgreement=" + memberAgreement + "]";
	}
	}