package take.a.talent.member.vo;

public class MemberPointExchangeVo {
	
	private int pointExchangeNo;
	private int memberNo;
	private int pointExchangeMoney;
	private int pointExchangePoint;
	private String pointExchangeDate;
	
	public int getPointExchangeNo() {
		return pointExchangeNo;
	}
	public void setPointExchangeNo(int pointExchangeNo) {
		this.pointExchangeNo = pointExchangeNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getPointExchangeMoney() {
		return pointExchangeMoney;
	}
	public void setPointExchangeMoney(int pointExchangeMoney) {
		this.pointExchangeMoney = pointExchangeMoney;
	}
	public int getPointExchangePoint() {
		return pointExchangePoint;
	}
	public void setPointExchangePoint(int pointExchangePoint) {
		this.pointExchangePoint = pointExchangePoint;
	}
	public String getPointExchangeDate() {
		return pointExchangeDate;
	}
	public void setPointExchangeDate(String pointExchangeDate) {
		this.pointExchangeDate = pointExchangeDate;
	}
	@Override
	public String toString() {
		return "MemberPointExchangeVo [pointExchangeNo=" + pointExchangeNo + ", memberNo=" + memberNo
				+ ", pointExchangeMoney=" + pointExchangeMoney + ", pointExchangePoint=" + pointExchangePoint
				+ ", pointExchangeDate=" + pointExchangeDate + "]";
	}
}
