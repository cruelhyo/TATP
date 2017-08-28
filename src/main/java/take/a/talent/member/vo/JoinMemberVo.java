package take.a.talent.member.vo;

public class JoinMemberVo
{
	private String memberId;
	private String memberPassword;
	private String memberName;
	private String memberGender;
	private String memberSocial_number;
	private String memberAddress;
	private String memberAddressDetail;
	private String phone;
	private String email;
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
	public String getMemberSocial_number()
	{
		return memberSocial_number;
	}
	public void setMemberSocial_number(String memberSocial_number)
	{
		this.memberSocial_number = memberSocial_number;
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
	public String getPhone()
	{
		return phone;
	}
	public void setPhone(String phone)
	{
		this.phone = phone;
	}
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email = email;
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
				+ memberName + ", memberGender=" + memberGender + ", memberSocial_number=" + memberSocial_number
				+ ", memberAddress=" + memberAddress + ", memberAddressDetail=" + memberAddressDetail + ", phone="
				+ phone + ", email=" + email + ", memberAgreement=" + memberAgreement + "]";
	}
	
}
