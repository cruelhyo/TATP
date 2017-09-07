package take.a.talent.member.vo;

public class MemberPointVo {
	private String pointChargeNo;
	private String pointChargeMoney;
	private String pointChargePoint;
	private String pointChargeDate;
	private String pointChargeShape;
	public String getPointChargeNo() {
		return pointChargeNo;
	}
	public void setPointChargeNo(String pointChargeNo) {
		this.pointChargeNo = pointChargeNo;
	}
	public String getPointChargeMoney() {
		return pointChargeMoney;
	}
	public void setPointChargeMoney(String pointChargeMoney) {
		this.pointChargeMoney = pointChargeMoney;
	}
	public String getPointChargePoint() {
		return pointChargePoint;
	}
	public void setPointChargePoint(String pointChargePoint) {
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
				+ ", pointChargeShape=" + pointChargeShape + "]";
	}
}
