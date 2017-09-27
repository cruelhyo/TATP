package take.a.talent.member.vo;

public class MemberPointVo {
	private int memberNo;
	private int pointChargeNo;
	private int pointChargeMoney;
	private int pointChargePoint;
	private String pointChargeDate;
	private String pointChargeShape;
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getPointChargeNo() {
		return pointChargeNo;
	}
	public void setPointChargeNo(int pointChargeNo) {
		this.pointChargeNo = pointChargeNo;
	}
	public int getPointChargeMoney() {
		return pointChargeMoney;
	}
	public void setPointChargeMoney(int pointChargeMoney) {
		this.pointChargeMoney = pointChargeMoney;
	}
	public int getPointChargePoint() {
		return pointChargePoint;
	}
	public void setPointChargePoint(int pointChargePoint) {
		this.pointChargePoint = pointChargePoint;
	}
	public String getPointChargeDate() {
		return pointChargeDate;
	}
	public void setPointChargeDate(String pointChargeDate) {
		this.pointChargeDate = pointChargeDate;
	}
	public String getPointChargeShape() {
		return pointChargeShape;
	}
	public void setPointChargeShape(String pointChargeShape) {
		this.pointChargeShape = pointChargeShape;
	}
	@Override
	public String toString() {
		return "MemberPointVo [pointChargeNo=" + pointChargeNo + ", pointChargeMoney=" + pointChargeMoney
				+ ", pointChargePoint=" + pointChargePoint + ", pointChargeDate=" + pointChargeDate
				+ ", pointChargeShape=" + pointChargeShape + ", memberNo=" + memberNo + "]";
	}
}