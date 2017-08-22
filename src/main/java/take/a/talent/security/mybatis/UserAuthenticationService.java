package take.a.talent.security.mybatis;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
  
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import take.a.talent.user.vo.UserDetailsVO;

public class UserAuthenticationService implements UserDetailsService 
{
  
	private static final Logger logger = LoggerFactory.getLogger(UserAuthenticationService.class);
	private SqlSessionTemplate sqlSession;
  
  
	public UserAuthenticationService() 
	{
		
	}
  
	public UserAuthenticationService(SqlSessionTemplate sqlSession) 
	{
		
		this.sqlSession = sqlSession;
	}
  
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException 
	{
	
		Map<String, Object> user = sqlSession.selectOne("take.a.talent.member.service.MemberMapper.selectMemberTest",username);
		if(user == null ) throw new UsernameNotFoundException(username);
		logger.info(user.toString());
		List<GrantedAuthority> gas = new ArrayList<GrantedAuthority>();
		gas.add(new SimpleGrantedAuthority(user.get("authority").toString()));
		
		if(user.get("authority") == "ROLE_WITHDRAWAL_MEM" || user.get("authority") == "ROLE_RESTRICTION") 
		{
			return new UserDetailsVO(user.get("member_id").toString()
					, user.get("member_pw").toString()
					, false
					, true, true, true
					, gas
					, (Integer)user.get("member_no"));
		}
		
		return new UserDetailsVO(user.get("username").toString()
								, user.get("password").toString()
								, true
								, true, true, true
								, gas
								, (Integer)user.get("member_no"));
		
	}
	
}
