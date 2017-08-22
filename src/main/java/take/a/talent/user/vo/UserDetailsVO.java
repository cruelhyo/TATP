package take.a.talent.user.vo;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.userdetails.User;

public class UserDetailsVO extends User {

	 private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;
	  
	 private int member_no;
	  
	 public UserDetailsVO(String username, String password, boolean enabled,
			 			boolean accountNonExpired, boolean credentialsNonExpired,
			 			boolean accountNonLocked,
			 			Collection<? extends GrantedAuthority> authorities,int member_no) 
	 {
		 super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		 this.member_no = member_no; 
		 
	 }
	  
	 public int getMember_no() 
	 {
		 return member_no;
	 }
	  
	 public void setMember_no(int member_no) 
	 {
		 this.member_no = member_no;
	 }
	  
	 @Override
	 public String toString() 
	 {
		 return super.toString() + "; member_no: "+this.member_no;
	 }
}
