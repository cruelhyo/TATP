package take.a.talent.member.vo;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.userdetails.User;

public class MemberDetailsVO extends User
{
	/*
	 * username = id, password = pw, enabled = 계정사용 가능 여부, accountNonExpired = 계정 만료
	 * 여부 , credentialsNonExpired = pw 만료 여부, accountNonLocked = 계정 잠김 여부,
	 * authorities = 권한 을 입력 받아 User클래스를 상속 받은 UserDetailsVO 객체를 생성한다 이 VO객체 다른 값을
	 * 넣고 싶다면 아래 주석처럼 추가 할 수 있다
	 */
	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

	// private int member_no;

	public MemberDetailsVO(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities)
	{
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		// this.member_no = member_no;

	}

	/*
	 * public int getMember_no() { return member_no; }
	 * 
	 * public void setMember_no(int member_no) { this.member_no = member_no; }
	 * 
	 * @Override public String toString() { return super.toString() +
	 * "; member_no: "+this.member_no; }
	 */
}
