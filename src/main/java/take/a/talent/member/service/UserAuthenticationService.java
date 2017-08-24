package take.a.talent.member.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import take.a.talent.member.vo.MemberDetailsVo;

public class UserAuthenticationService implements UserDetailsService
{

	private static final Logger logger = LoggerFactory.getLogger(UserAuthenticationService.class);
	
	// sqlSession을 직접받아 오기 위해 변수 지정
	private SqlSessionTemplate sqlSession;

	public UserAuthenticationService()
	{
		
	}

	// sqlSession을 받아서 객체 생성
	public UserAuthenticationService(SqlSessionTemplate sqlSession)
	{

		this.sqlSession = sqlSession;
	}

	/*
	 * loadUserByUsername 매서드를 통하여 DB에 있는 값을 받아 VO객체를 생성후 리턴한다 입력값으로는 폼에서 입력한 id를
	 * 입력값으로 호출한다
	 */
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException
	{
		// 폼에서 입력받은 id값을 selectMemberTest 쿼리에 있는 #{username}에 넣고 쿼리를 실행후 user에 맵핑해준다
		Map<String, Object> user = sqlSession.selectOne("selectMemberTest", username);
		// user가 null이면 UsernameNotFoundException 에러 매세지를 보여준다
		if (user == null)
		{
			throw new UsernameNotFoundException(username);
		}
		logger.info(user.toString());
		// GrantedAuthority를 갖는 리스트 객체를 생성한다
		// (이 프로젝트 테이블 구조상 한명의 회원이 여러 권한을 갖지 않아 GrantedAuthority 변수를 지정해도 무관하다)
		List<GrantedAuthority> gas = new ArrayList<GrantedAuthority>();
		// user에 맵핑되어있는 권한을 가져와 gas에 add해준다
		gas.add(new SimpleGrantedAuthority(user.get("authority").toString()));

		// ROLE_WITHDRAWAL_MEM, ROLE_RESTRICTION 권한은 계정사용이 불가능한 권한으로 설정 할거기 때문에
		// 분기점을 두어 VO객체를 생성할 때 enabled에 false를 넣고 생성 후 리턴
		if (user.get("authority") == "ROLE_WITHDRAWAL_MEM" || user.get("authority") == "ROLE_RESTRICTION")
		{
			return new MemberDetailsVo(user.get("member_id").toString(), user.get("member_pw").toString(), false, false,
					false, false, gas);
		}

		// ROLE_WITHDRAWAL_MEM, ROLE_RESTRICTION 권한이 아닌 나머지 권한을 가진 유저는 전부 true로 설정, 맵핑한
		// 값을 넣은 후 리턴한다
		return new MemberDetailsVo(user.get("member_id").toString(), user.get("member_pw").toString(), true, true, true,
				true, gas);

	}
	
	public String getUserName()
	{
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails)
		{
			userName = ((UserDetails) principal).getUsername();
		}
		else
		{
			userName = principal.toString();
		}
		return userName;
	}

}
