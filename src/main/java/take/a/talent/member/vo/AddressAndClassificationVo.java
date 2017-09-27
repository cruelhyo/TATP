package take.a.talent.member.vo;

public class AddressAndClassificationVo
{
	private int addressNo;
	private int memberNo;
	private int addressClassificationNo;
	private int addressMailNumber;
	private String memberAddress;
	private String addressClassificationName;
	
	public String getAddressClassificationName()
	{
		return addressClassificationName;
	}
	public void setAddressClassificationName(String addressClassificationName)
	{
		this.addressClassificationName = addressClassificationName;
	}
	public int getAddressNo()
	{
		return addressNo;
	}
	public void setAddressNo(int addressNo)
	{
		this.addressNo = addressNo;
	}
	public int getMemberNo()
	{
		return memberNo;
	}
	public void setMemberNo(int memberNo)
	{
		this.memberNo = memberNo;
	}
	public int getAddressClassificationNo()
	{
		return addressClassificationNo;
	}
	public void setAddressClassificationNo(int addressClassificationNo)
	{
		this.addressClassificationNo = addressClassificationNo;
	}
	public int getAddressMailNumber()
	{
		return addressMailNumber;
	}
	public void setAddressMailNumber(int addressMailNumber)
	{
		this.addressMailNumber = addressMailNumber;
	}
	public String getMemberAddress()
	{
		return memberAddress;
	}
	public void setMemberAddress(String memberAddress)
	{
		this.memberAddress = memberAddress;
	}
	@Override
	public String toString()
	{
		return "AddressAndClassification [addressNo=" + addressNo + ", memberNo=" + memberNo
				+ ", addressClassificationNo=" + addressClassificationNo + ", addressMailNumber=" + addressMailNumber
				+ ", memberAddress=" + memberAddress + ", addressClassificationName=" + addressClassificationName + "]";
	}
	
}
