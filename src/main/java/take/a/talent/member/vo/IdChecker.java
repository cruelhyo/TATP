package take.a.talent.member.vo;

public class IdChecker
{
private String member_id;
private String member_pw;
public String getMember_id()
{
	return member_id;
}
public void setMember_id(String member_id)
{
	this.member_id = member_id;
}
public String getMember_pw()
{
	return member_pw;
}
public void setMember_pw(String member_pw)
{
	this.member_pw = member_pw;
}
@Override
public String toString()
{
	return "IdChecker [member_id=" + member_id + ", member_pw=" + member_pw + "]";
}



}